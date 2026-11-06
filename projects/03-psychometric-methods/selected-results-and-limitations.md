# Selected Results and Interpretation Boundaries

All values below come from the supplied WP1 review packages and describe the synthetic dataset only.

## Data and reliability (Task 2.1–2.2.2)

The dataset contains 300 simulated records, 15 five-point items, 233 missing item cells (5.18%), and 141 complete cases. Missingness was generated independently at a 5% probability per item (MCAR) by design. The simulation assumes every record had an opportunity to respond to every Evidence Verification item; it does not model a no-opportunity response.

Polychoric standardized alpha / omega point estimates were:

| Construct | Ordinal alpha | Ordinal omega |
|---|---:|---:|
| IHS | .8394 | .8410 |
| EHS | .8345 | .8371 |
| EV | .8540 | .8549 |

Each reported reliability bootstrap summary used 1,000 row-resampled estimates. These coefficients describe the latent continuous-response model behind the simulated ordinal items; they are not direct estimates of reliability for real student responses or proof of validity or unidimensionality.

## Exploratory factor analysis (Task 2.3)

Three parallel-analysis procedures (500 iterations each) selected three factors. KMO was .8540. The Bartlett diagnostic was chi-square = 1849.89, df = 105, p < .001, with the supplied caveat that it is based on polychoric correlations and pairwise N and is not a calibrated ordinal test.

The labelled pattern loadings broadly followed the intended three-construct structure. The smallest primary loading was EHS05 at .5485 on the EHS-like factor; its secondary loading on the EV-like factor was .1501. These are exploratory results from the simulated dataset.

## Confirmatory factor analysis (Task 2.4)

The three-factor model reported robust CFI = .9926, robust TLI = .9911, robust RMSEA = .0234, and SRMR = .0424. The one-factor and two-factor alternatives fit less well in this same simulated dataset. Because EFA and CFA used the same generated sample, this is not independent-sample cross-validation.

## Convergent and discriminant diagnostics (Task 2.5–2.5.1)

| Construct | AVE | CR |
|---|---:|---:|
| IHS | .5392 | .8526 |
| EHS | .5327 | .8496 |
| EV | .5587 | .8629 |

Corrected HTMT point estimates were .3184 (IHS–EHS), .4040 (IHS–EV), and .3326 (EHS–EV). The Task 2.5 percentile bootstrap intervals were [.1832, .4485], [.2731, .5246], and [.2095, .4559], respectively.

Task 2.5.1 compared polychoric continuity correction settings using the same 1,000 row-bootstrap samples for both methods. The paired mean differences (uncorrected minus corrected) were -.00814 for IHS–EHS, -.00492 for IHS–EV, and -.00787 for EHS–EV. Their paired 95% percentile intervals were [-.01308, -.00230], [-.01080, .00081], and [-.01296, -.00225].

The corrected method produced warnings in all 1,000 Task 2.5.1 replicates; the uncorrected method produced none. The supplied report explicitly notes that success means finite HTMT estimates, not that every replicate's correlation matrix was independently checked for positive definiteness. Warnings are not to be described as absent.

## Overall boundary

These exercises demonstrate a documented R workflow and sensitivity checks on a synthetic dataset. They do not validate the questionnaire in a real population, establish learning outcomes, or provide evidence about actual students. The scripts were AI-assisted and executed in R; this should be disclosed accurately.
