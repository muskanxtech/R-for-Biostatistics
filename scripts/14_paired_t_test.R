# ===========================================================
# File: 14_paired_t_test.R
# Repository: R-for-Biostatistics
# Author: Muskan Sharma
#
# Objective:
# Perform paired t-tests for dependent samples.
#
# Concepts Covered:
# 1. Paired two-tailed t-test
# 2. Paired left-tailed t-test
# 3. Paired right-tailed t-test
# 4. p-value based decision
# 5. Critical t-value based decision
# ===========================================================


# -----------------------------------------------------------
# SECTION 1: Data
# -----------------------------------------------------------

before <- c(12, 10, 16, 2, 12, 18, 11, 16, 16, 10, 14, 21, 9, 19, 20)
after  <- c(11, 10, 11, 3, 9, 13, 8, 14, 16, 10, 12, 22, 9, 16, 18)

alpha <- 0.01
confidence_level <- 0.99


# -----------------------------------------------------------
# SECTION 2: Two-tailed paired t-test
# H0: mean_difference = 0
# H1: mean_difference != 0
# -----------------------------------------------------------

result_two_tailed <- t.test(
  before,
  after,
  alternative = "two.sided",
  paired = TRUE,
  conf.level = confidence_level
)

print(result_two_tailed)

df <- as.numeric(result_two_tailed$parameter)
calculated_t <- as.numeric(result_two_tailed$statistic)
critical_t <- qt(1 - alpha / 2, df = df)

cat("\n=== Two-tailed Paired t-test ===\n")

cat("\nDecision using p-value:\n")

if (result_two_tailed$p.value < alpha) {
  cat("Decision: Reject H0\n")
  cat("Conclusion: The mean difference is significantly different from 0.\n")
} else {
  cat("Decision: Fail to reject H0\n")
  cat("Conclusion: There is not enough evidence that the mean difference differs from 0.\n")
}

cat("\nDecision using critical t-value:\n")
cat("Calculated t-value :", round(calculated_t, 3), "\n")
cat("Critical t-value   : ±", round(critical_t, 3), "\n")
cat("Degrees of freedom :", round(df, 3), "\n")
cat("Alpha              :", alpha, "\n")

if (abs(calculated_t) > critical_t) {
  cat("Decision: Reject H0\n")
  cat("Reason: |calculated t| > critical t\n")
} else {
  cat("Decision: Fail to reject H0\n")
  cat("Reason: |calculated t| <= critical t\n")
}


# -----------------------------------------------------------
# SECTION 3: Left-tailed paired t-test
# H0: mean_difference = 0
# H1: mean_difference < 0
# -----------------------------------------------------------

result_left_tailed <- t.test(
  before,
  after,
  alternative = "less",
  paired = TRUE,
  conf.level = confidence_level
)

print(result_left_tailed)

df <- as.numeric(result_left_tailed$parameter)
calculated_t <- as.numeric(result_left_tailed$statistic)
critical_t <- qt(alpha, df = df)

cat("\n=== Left-tailed Paired t-test ===\n")

cat("\nDecision using p-value:\n")

if (result_left_tailed$p.value < alpha) {
  cat("Decision: Reject H0\n")
  cat("Conclusion: There is sufficient evidence that the mean difference is less than 0.\n")
} else {
  cat("Decision: Fail to reject H0\n")
  cat("Conclusion: There is not enough evidence that the mean difference is less than 0.\n")
}

cat("\nDecision using critical t-value:\n")
cat("Calculated t-value :", round(calculated_t, 3), "\n")
cat("Critical t-value   :", round(critical_t, 3), "\n")
cat("Degrees of freedom :", round(df, 3), "\n")
cat("Alpha              :", alpha, "\n")

if (calculated_t < critical_t) {
  cat("Decision: Reject H0\n")
  cat("Reason: calculated t < critical t for left-tailed test\n")
} else {
  cat("Decision: Fail to reject H0\n")
  cat("Reason: calculated t >= critical t for left-tailed test\n")
}


# -----------------------------------------------------------
# SECTION 4: Right-tailed paired t-test
# H0: mean_difference = 0
# H1: mean_difference > 0
# -----------------------------------------------------------

result_right_tailed <- t.test(
  before,
  after,
  alternative = "greater",
  paired = TRUE,
  conf.level = confidence_level
)

print(result_right_tailed)

df <- as.numeric(result_right_tailed$parameter)
calculated_t <- as.numeric(result_right_tailed$statistic)
critical_t <- qt(1 - alpha, df = df)

cat("\n=== Right-tailed Paired t-test ===\n")

cat("\nDecision using p-value:\n")

if (result_right_tailed$p.value < alpha) {
  cat("Decision: Reject H0\n")
  cat("Conclusion: There is sufficient evidence that the mean difference is greater than 0.\n")
} else {
  cat("Decision: Fail to reject H0\n")
  cat("Conclusion: There is not enough evidence that the mean difference is greater than 0.\n")
}

cat("\nDecision using critical t-value:\n")
cat("Calculated t-value :", round(calculated_t, 3), "\n")
cat("Critical t-value   :", round(critical_t, 3), "\n")
cat("Degrees of freedom :", round(df, 3), "\n")
cat("Alpha              :", alpha, "\n")

if (calculated_t > critical_t) {
  cat("Decision: Reject H0\n")
  cat("Reason: calculated t > critical t for right-tailed test\n")
} else {
  cat("Decision: Fail to reject H0\n")
  cat("Reason: calculated t <= critical t for right-tailed test\n")
}


# -----------------------------------------------------------
# END OF SCRIPT
# -----------------------------------------------------------
