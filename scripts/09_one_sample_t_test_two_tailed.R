# ===========================================================
# File: 09_one_sample_t_test_two_tailed.R
# Repository: R-for-Biostatistics
# Author: Muskan Sharma
#
# Objective:
# Perform a one-sample two-tailed t-test.
#
# H0: population mean = 12
# H1: population mean != 12
# ===========================================================

sample_values <- c(
  14.0, 14.1, 14.5, 13.2, 11.2,
  14.0, 14.1, 12.2, 11.1, 13.7,
  13.2, 16.0, 12.8, 14.4, 12.9
)

hypothesized_mean <- 12
alpha <- 0.10
confidence_level <- 0.90

test_result <- t.test(
  sample_values,
  mu = hypothesized_mean,
  alternative = "two.sided",
  conf.level = confidence_level
)

print(test_result)

degrees_of_freedom <- length(sample_values) - 1
calculated_t <- as.numeric(test_result$statistic)
critical_t <- qt(1 - alpha / 2, df = degrees_of_freedom)

cat("\n=== Decision using p-value ===\n")

if (test_result$p.value < alpha) {
  cat("Decision: Reject H0\n")
  cat("Conclusion: The population mean is significantly different from 12.\n")
} else {
  cat("Decision: Fail to reject H0\n")
  cat("Conclusion: There is not enough evidence that the mean differs from 12.\n")
}

cat("\n=== Decision using critical t-value ===\n")
cat("Calculated t-value :", round(calculated_t, 3), "\n")
cat("Critical t-value   : ±", round(critical_t, 3), "\n")
cat("Degrees of freedom :", degrees_of_freedom, "\n")
cat("Alpha              :", alpha, "\n")

if (abs(calculated_t) > critical_t) {
  cat("Decision: Reject H0\n")
  cat("Reason: |calculated t| > critical t\n")
} else {
  cat("Decision: Fail to reject H0\n")
  cat("Reason: |calculated t| <= critical t\n")
}
