# WP1 / Task 2.1 -- SIMULATED DATA ONLY, questionnaire v2.0
# Uses base R only. No reliability/EFA/CFA is performed at this stage.
# The code was AI-assisted and executed in R; see project README.

run_task2_1 <- function(out_dir = getwd()) {
  dir.create(out_dir, recursive = TRUE, showWarnings = FALSE)
  RNGkind("Mersenne-Twister", "Inversion", "Rejection")
  set.seed(210300)
  n <- 300L
  constructs <- c("IHS", "EHS", "EV")
  items <- unlist(lapply(constructs, function(x) sprintf("%s%02d", x, 1:5)))
  group <- rep(1:3, each = 5)
  # Illustrative population parameters, NOT estimates from participants.
  phi <- matrix(c(1, .30, .40, .30, 1, .30, .40, .30, 1), 3, 3,
                dimnames = list(constructs, constructs))
  lambda <- c(.75, .70, .80, .65, .72,
              .78, .72, .68, .75, .60,
              .75, .80, .70, .68, .65)
  thresholds <- c(-Inf, -1.2, -.4, .4, 1.2, Inf)
  missing_probability <- .05
  stopifnot(isSymmetric(phi), all(eigen(phi, symmetric = TRUE)$values > 0),
            all(lambda > 0 & lambda < 1))
  eta <- matrix(rnorm(n * 3), n, 3) %*% chol(phi)
  colnames(eta) <- constructs
  epsilon <- matrix(rnorm(n * 15), n, 15)
  y_star <- sweep(eta[, group], 2, lambda, "*") +
    sweep(epsilon, 2, sqrt(1 - lambda^2), "*")
  complete <- apply(y_star, 2, function(x)
    cut(x, breaks = thresholds, labels = FALSE, right = TRUE))
  colnames(complete) <- items
  # MCAR omission; all simulated people are assumed to have opportunities for all EV items.
  missing <- matrix(runif(n * 15) < missing_probability, n, 15)
  observed <- complete
  observed[missing] <- NA_integer_
  dat <- data.frame(ID = sprintf("SIM%03d", 1:n), observed,
                    check.names = FALSE)
  stopifnot(nrow(dat) == 300, ncol(dat) == 16, !anyDuplicated(dat$ID),
            identical(names(dat)[-1], items),
            all(observed[!is.na(observed)] %in% 1:5))
  csv_path <- file.path(out_dir, "simulated_questionnaire.csv")
  write.csv(dat, csv_path, row.names = FALSE, na = "NA", fileEncoding = "UTF-8")
  roundtrip <- read.csv(csv_path, na.strings = "NA", check.names = FALSE)
  stopifnot(identical(dat, roundtrip))
  counts <- t(vapply(seq_len(15), function(j)
    tabulate(observed[, j], nbins = 5), integer(5)))
  colnames(counts) <- paste0("n_score_", 1:5)
  audit <- data.frame(item = items, construct = constructs[group],
    n_observed = colSums(!is.na(observed)), n_missing = colSums(is.na(observed)),
    missing_pct = round(100 * colMeans(is.na(observed)), 2),
    mean = round(colMeans(observed, na.rm = TRUE), 3),
    sd = round(apply(observed, 2, sd, na.rm = TRUE), 3), counts,
    row.names = NULL)
  write.csv(audit, file.path(out_dir, "item_audit.csv"), row.names = FALSE)
  parameters <- data.frame(item = items, construct = constructs[group],
    loading = lambda, residual_variance = 1 - lambda^2,
    threshold_1 = -1.2, threshold_2 = -.4, threshold_3 = .4, threshold_4 = 1.2,
    reverse_scored = FALSE)
  write.csv(parameters, file.path(out_dir, "simulation_parameters.csv"), row.names = FALSE)
  saveRDS(list(seed = 210300, phi = phi, lambda = lambda,
    thresholds = thresholds, missing_probability = missing_probability,
    factors = eta, complete_responses = complete, missing_mask = missing,
    assumptions = "All EV opportunities available; independent MCAR omissions; simple structure"),
    file.path(out_dir, "simulation_truth.rds"))
  packages <- c("tidyverse", "psych", "lavaan", "semTools", "GPArotation", "corrplot")
  package_check <- data.frame(package = packages,
    available = vapply(packages, requireNamespace, logical(1), quietly = TRUE))
  write.csv(package_check, file.path(out_dir, "package_check.csv"), row.names = FALSE)
  total_missing <- sum(is.na(observed))
  summary_text <- capture.output({
    cat("WP1 TASK 2.1 | SIMULATED DATA ONLY | Questionnaire v2.0\n")
    cat(R.version.string, "\nSeed: 210300\n")
    cat("Rows:", nrow(dat), "| Items: 15 | ID columns: 1\n")
    cat("Observed response range:", range(observed, na.rm = TRUE), "\n")
    cat(sprintf("Missing: %d / 4500 (%.2f%%); target probability: 5%%\n",
                total_missing, 100 * total_missing / 4500))
    cat("Complete cases:", sum(complete.cases(observed)), "\n")
    cat("EV opportunity assumption: available for every simulated person/item.\n")
    cat("CSV read-back and structure checks: PASS\n\n")
    print(audit, row.names = FALSE)
    cat("\nSpecified population factor correlations:\n"); print(phi)
    cat("\nRealized latent correlations (generator truth, not fitted estimates):\n")
    print(round(cor(eta), 3))
    cat("\nPackage availability in this R library:\n"); print(package_check, row.names = FALSE)
    cat("\nNo participant data; no empirical validation; no Task 2.2 analysis.\n")
  })
  writeLines(summary_text, file.path(out_dir, "task2_1_console_output.txt"))
  writeLines(capture.output(sessionInfo()), file.path(out_dir, "sessionInfo.txt"))
  cat(paste(summary_text, collapse = "\n"), "\n")
  invisible(dat)
}
args <- commandArgs(trailingOnly = TRUE)
task2_1_data <- run_task2_1(if (length(args)) args[1] else getwd())
