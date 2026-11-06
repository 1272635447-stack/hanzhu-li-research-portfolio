# Public release: psychometric methods practice

This R-based workflow uses a synthetic dataset (300 rows, 15 five-point items) to practise measurement analysis across three proposed constructs: Instrumental Help-Seeking (IHS), Executive Help-Seeking (EHS), and Evidence Verification (EV).

## Published result tables

- [Reliability estimates and bootstrap intervals](results/task2_2_2_reliability_summary_with_CI.csv)
- [EFA factor-number summary](results/task2_3_factor_number_summary.csv)
- [EFA pattern loadings](results/task2_3_pattern_loadings.csv)
- [CFA model comparison](results/task2_4_fit_comparison.csv)
- [AVE and composite reliability](results/task2_5_AVE_CR_results.csv)
- [HTMT bootstrap intervals](results/task2_5_HTMT_bootstrap_CI.csv)
- [HTMT continuity-correction sensitivity](results/task2_5_1_sensitivity.csv)

## Interpretation limits

All records are simulated, not student responses. The item set is exploratory and is not a validated scale. EFA and CFA were run on the same simulated dataset, so this is not independent-sample cross-validation. In Task 2.5.1, all 1,000 corrected bootstrap replicates generated continuity-correction warnings; the uncorrected method generated none. This warning pattern must remain visible in interpretation.

The scripts and complete public-release bundle are supplied separately in the accompanying archive. This GitHub page is not evidence of human-participant research or empirical validation.
