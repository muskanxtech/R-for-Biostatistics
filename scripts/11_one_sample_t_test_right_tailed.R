# ===========================================================
# File: 11_one_sample_t_test_right_tailed.R
# Repository: R-for-Biostatistics
# Author: Muskan Sharma
#
# Objective:
# Perform a one-sample right-tailed t-test.
#
# H0: population mean = 14
# H1: population mean > 14
# ===========================================================

sample_values <- c(
  14.5, 12.9, 14, 16.1, 12, 17.5,
  14.1, 12.9, 17.9, 12, 16.4, 24.2,
  12.2, 14.4, 17, 10, 18.5, 20.8,
  16.2, 14.9, 19.6, 22.3, 17.8, 12.1
)

hypothesized_mean <- 14
alpha <- 0.05
confidence_level <- 0.95

test_result <- t.test(
  sample_values,
  mu = hypothesized_mean,
  alternative = "greater",
  conf.level = confidence_level
)

print(test_result)

degrees_of_freedom <- length(sample_values) - 1
calculated_t <- as.numeric(test_result$statistic)
critical_t <- qt(1 - alpha, df = degrees_of_freedom)

cat("\n=== Decision using p-value ===\n")

if (test_result$p.value < alpha) {
  cat("Decision: Reject H0\n")
  cat("Conclusion: The population mean is significantly greater than 14.\n")
} else {
  cat("Decision: Fail to reject H0\n")
  cat("Conclusion: There is not enough evidence that the mean is greater than 14.\n")
}

cat("\n=== Decision using critical t-value ===\n")
cat("Calculated t-value :", round(calculated_t, 3), "\n")
cat("Critical t-value   :", round(critical_t, 3), "\n")
cat("Degrees of freedom :", degrees_of_freedom, "\n")
cat("Alpha              :", alpha, "\n")

if (calculated_t > critical_t) {
  cat("Decision: Reject H0\n")
  cat("Reason: calculated t > critical t for right-tailed test\n")
} else {
  cat("Decision: Fail to reject H0\n")
  cat("Reason: calculated t <= critical t for right-tailed test\n")
}
