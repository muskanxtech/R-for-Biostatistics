# ===========================================================
# File: 13_two_sample_independent_welch_t_test.R
# Repository: R-for-Biostatistics
# Author: Muskan Sharma
#
# Objective:
# Perform independent two-sample Welch's t-tests
# when population variances are not assumed equal.
#
# Concepts Covered:
# 1. Two-tailed Welch's t-test
# 2. Left-tailed Welch's t-test
# 3. Right-tailed Welch's t-test
# 4. p-value based decision
# 5. Critical t-value based decision
# ===========================================================


# -----------------------------------------------------------
# SECTION 1: Data
# -----------------------------------------------------------

group_x <- c(
  1.71, 1.65, 1.68, 1.69, 1.73, 1.50, 1.60, 1.73,
  1.68, 1.71, 1.65, 1.70, 1.62, 1.66, 1.66, 1.69
)

group_y <- c(
  1.77, 1.68, 1.76, 1.73, 1.73, 1.79, 1.74, 1.70,
  1.79, 1.73, 1.71, 1.79, 1.76, 1.77, 1.74, 1.80
)

alpha <- 0.05
confidence_level <- 0.95


# -----------------------------------------------------------
# SECTION 2: Two-tailed Welch's t-test
# H0: mean_x = mean_y
# H1: mean_x != mean_y
# -----------------------------------------------------------

result_two_tailed <- t.test(
  group_x,
  group_y,
  alternative = "two.sided",
  paired = FALSE,
  var.equal = FALSE,
  conf.level = confidence_level
)

print(result_two_tailed)

df <- as.numeric(result_two_tailed$parameter)
calculated_t <- as.numeric(result_two_tailed$statistic)
critical_t <- qt(1 - alpha / 2, df = df)

cat("\n=== Two-tailed Welch's t-test ===\n")

cat("\nDecision using p-value:\n")

if (result_two_tailed$p.value < alpha) {
  cat("Decision: Reject H0\n")
  cat("Conclusion: The two population means are significantly different.\n")
} else {
  cat("Decision: Fail to reject H0\n")
  cat("Conclusion: There is not enough evidence that the two means are different.\n")
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
# SECTION 3: Left-tailed Welch's t-test
# H0: mean_x = mean_y
# H1: mean_x < mean_y
# -----------------------------------------------------------

result_left_tailed <- t.test(
  group_x,
  group_y,
  alternative = "less",
  paired = FALSE,
  var.equal = FALSE,
  conf.level = confidence_level
)

print(result_left_tailed)

df <- as.numeric(result_left_tailed$parameter)
calculated_t <- as.numeric(result_left_tailed$statistic)
critical_t <- qt(alpha, df = df)

cat("\n=== Left-tailed Welch's t-test ===\n")

cat("\nDecision using p-value:\n")

if (result_left_tailed$p.value < alpha) {
  cat("Decision: Reject H0\n")
  cat("Conclusion: There is sufficient evidence that mean_x is less than mean_y.\n")
} else {
  cat("Decision: Fail to reject H0\n")
  cat("Conclusion: There is not enough evidence that mean_x is less than mean_y.\n")
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
# SECTION 4: Right-tailed Welch's t-test
# H0: mean_x = mean_y
# H1: mean_x > mean_y
# -----------------------------------------------------------

result_right_tailed <- t.test(
  group_x,
  group_y,
  alternative = "greater",
  paired = FALSE,
  var.equal = FALSE,
  conf.level = confidence_level
)

print(result_right_tailed)

df <- as.numeric(result_right_tailed$parameter)
calculated_t <- as.numeric(result_right_tailed$statistic)
critical_t <- qt(1 - alpha, df = df)

cat("\n=== Right-tailed Welch's t-test ===\n")

cat("\nDecision using p-value:\n")

if (result_right_tailed$p.value < alpha) {
  cat("Decision: Reject H0\n")
  cat("Conclusion: There is sufficient evidence that mean_x is greater than mean_y.\n")
} else {
  cat("Decision: Fail to reject H0\n")
  cat("Conclusion: There is not enough evidence that mean_x is greater than mean_y.\n")
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
