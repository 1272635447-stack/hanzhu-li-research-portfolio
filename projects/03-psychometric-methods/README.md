# Project 03 — Psychometric Methods Training

This R-based methods exercise uses a synthetic dataset of 300 records and 15 five-point questionnaire items across three proposed constructs: Instrumental Help-Seeking (IHS), Executive Help-Seeking (EHS), and Evidence Verification (EV).

## Methods

- Data simulation and missingness audit
- Pearson and ordinal reliability estimates (alpha and omega)
- Bootstrap summaries
- Exploratory factor analysis and parallel analysis
- Confirmatory factor analysis comparing one-, two-, and three-factor models
- AVE, composite reliability, Fornell–Larcker, and HTMT diagnostics
- Paired sensitivity analysis comparing polychoric continuity correction settings

## Limitations

This is methods training using simulated data, not a study with student participants and not empirical validation of the questionnaire. EFA and CFA used the same simulated dataset, so this is not independent-sample cross-validation. The analysis scripts were AI-assisted and executed in R; execution does not imply independent authorship or full mastery of every method. Task 2.5 is represented by a corrected script (`task2_5_run_fixed.R`); its original syntax-error file is preserved separately in the private source archive.

The public source bundle contains the scripts, synthetic input data, and selected result tables. Full internal workbooks, RDS objects, execution traces, and researcher-only review material are not included.
