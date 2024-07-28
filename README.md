# Canine-detection-of-SARS-CoV-2-Diagnostic-Test-Accuracy-meta-analysis

This project is an exploratory diagnostic test accuracy (DTA) meta-analysis investigating the ability of dogs to detect SARS-CoV-2 through olfactory route. The analysis includes data from six papers, which were subject to significant variations in the methods of result collection. Therefore, this analysis is intended for exploratory purposes.

## Analysis Workflow

1. **Data Collection:** Data were collected from six papers on the olfactory detection of SARS-CoV-2 by dogs.
2. **Univariate Analysis:** Calculation of sensitivity, specificity, and diagnostic odds ratio.
3. **Bivariate Analysis:** Implementation of the bivariate model to generate SROC curve.
4. **Risk of Bias Assessment:** Evaluation of risk of bias and applicability concerns using the QUADAS-2 tool.

## Files in the Repository

- `data/`: Contains the data used for analysis as TP, FN, TN, FN.
- `DTA meta analysis/`: R script for each step of the analysis.
- `Figures/`: Plots and results generated from the analysis.
- `README.md`: Project overview and instructions.

## Data and Methods

The meta-analysis was conducted using R, specifically employing the `meta` and `mada` packages. The analysis aims to aggregate and examine the diagnostic performance metrics from the included studies.

### Univariate Analysis

- **Sensitivity:** 0.875
- **Specificity:** 0.942
- **Diagnostic Odds Ratio (DOR):** 109

### Bivariate Analysis

- **Model:** Bivariate model
- **Area Under the Curve (AUC):** 0.952


## Conclusion

This exploratory meta-analysis provides insights into the potential of dogs for olfactory detection of SARS-CoV-2. However, due to the substantial differences in study methods and missing data, these findings should be interpreted with caution.


