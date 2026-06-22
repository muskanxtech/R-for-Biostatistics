# ===========================================================
# File: 10_one_sample_t_test_left_tailed.R
# Repository: R-for-Biostatistics
# Author: Muskan Sharma
#
# Objective:
# Perform a one-sample left-tailed t-test.
#
# H0: population mean = 60
# H1: population mean < 60
# ===========================================================

sample_values <- c(
  62, 62, 68, 48, 51, 60, 51, 57,
  57, 41, 62, 50, 53, 34, 62, 61
)

hypothesized_mean <- 60
alpha <- 0.05
confidence_level <- 0.95

test_result <- t.test(
  sample_values,
  mu = hypothesized_mean,
  alternative = "less",
  conf.level = confidence_level
)

print(test_result)

degrees_of_freedom <- length(sample_values) - 1
calculated_t <- as.numeric(test_result$statistic)
critical_t <- qt(alpha, df = degrees_of_freedom)

cat("\n=== Decision using p-value ===\n")

if (test_result$p.value < alpha) {
  cat("Decision: Reject H0\n")
  cat("Conclusion: The population mean is significantly less than 60.\n")
} else {
  cat("Decision: Fail to reject H0\n")
  cat("Conclusion: There is not enough evidence that the mean is less than 60.\n")
}

cat("\n=== Decision using critical t-value ===\n")
cat("Calculated t-value :", round(calculated_t, 3), "\n")
cat("Critical t-value   :", round(critical_t, 3), "\n")
cat("Degrees of freedom :", degrees_of_freedom, "\n")
cat("Alpha              :", alpha, "\n")

if (calculated_t < critical_t) {
  cat("Decision: Reject H0\n")
  cat("Reason: calculated t < critical t for left-tailed test\n")
} else {
  cat("Decision: Fail to reject H0\n")
  cat("Reason: calculated t >= critical t for left-tailed test\n")
}
