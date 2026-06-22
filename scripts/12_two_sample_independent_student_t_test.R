# ===========================================================
# File: 12_two_sample_independent_student_t_test.R
# Repository: R-for-Biostatistics
# Author: Muskan Sharma
#
# Objective:
# Perform independent two-sample Student's t-tests
# assuming equal population variances.
#
# Concepts Covered:
# 1. Two-tailed Student's t-test
# 2. Right-tailed Student's t-test
# 3. Left-tailed Student's t-test
# ===========================================================

group_x <- c(9.4, 10.8, 8.9, 9.6, 10, 13, 10, 13.5, 10, 9.5, 10, 9.75)
group_y <- c(11.6, 9.8, 13.2, 13.75, 12, 13.75, 12.5, 9.5, 12, 13.5, 12, 12)

alpha <- 0.10
confidence_level <- 0.90
degrees_of_freedom <- length(group_x) + length(group_y) - 2

# -----------------------------------------------------------
# Function for decision making
# -----------------------------------------------------------

make_decision <- function(test_result, alpha, test_type, df) {
  calculated_t <- as.numeric(test_result$statistic)
  
  cat("\n====================================\n")
  cat("Test type:", test_type, "\n")
  cat("====================================\n")
  print(test_result)
  
  cat("\nDecision using p-value:\n")
  if (test_result$p.value < alpha) {
    cat("Decision: Reject H0\n")
  } else {
    cat("Decision: Fail to reject H0\n")
  }
  
  cat("\nDecision using critical t-value:\n")
  
  if (test_type == "two.sided") {
    critical_t <- qt(1 - alpha / 2, df = df)
    cat("Calculated t:", round(calculated_t, 3), "\n")
    cat("Critical t  : ±", round(critical_t, 3), "\n")
    
    if (abs(calculated_t) > critical_t) {
      cat("Decision: Reject H0\n")
    } else {
      cat("Decision: Fail to reject H0\n")
    }
    
  } else if (test_type == "greater") {
    critical_t <- qt(1 - alpha, df = df)
    cat("Calculated t:", round(calculated_t, 3), "\n")
    cat("Critical t  :", round(critical_t, 3), "\n")
    
    if (calculated_t > critical_t) {
      cat("Decision: Reject H0\n")
    } else {
      cat("Decision: Fail to reject H0\n")
    }
    
  } else if (test_type == "less") {
    critical_t <- qt(alpha, df = df)
    cat("Calculated t:", round(calculated_t, 3), "\n")
    cat("Critical t  :", round(critical_t, 3), "\n")
    
    if (calculated_t < critical_t) {
      cat("Decision: Reject H0\n")
    } else {
      cat("Decision: Fail to reject H0\n")
    }
  }
}

# -----------------------------------------------------------
# Two-tailed test
# H0: mean_x = mean_y
# H1: mean_x != mean_y
# -----------------------------------------------------------

result_two_tailed <- t.test(
  group_x,
  group_y,
  alternative = "two.sided",
  paired = FALSE,
  var.equal = TRUE,
  conf.level = confidence_level
)

make_decision(result_two_tailed, alpha, "two.sided", degrees_of_freedom)

# -----------------------------------------------------------
# Right-tailed test
# H0: mean_x = mean_y
# H1: mean_x > mean_y
# -----------------------------------------------------------

result_right_tailed <- t.test(
  group_x,
  group_y,
  alternative = "greater",
  paired = FALSE,
  var.equal = TRUE,
  conf.level = confidence_level
)

make_decision(result_right_tailed, alpha, "greater", degrees_of_freedom)

# -----------------------------------------------------------
# Left-tailed test
# H0: mean_x = mean_y
# H1: mean_x < mean_y
# -----------------------------------------------------------

result_left_tailed <- t.test(
  group_x,
  group_y,
  alternative = "less",
  paired = FALSE,
  var.equal = TRUE,
  conf.level = confidence_level
)

make_decision(result_left_tailed, alpha, "less", degrees_of_freedom)

# -----------------------------------------------------------
# END OF SCRIPT
# -----------------------------------------------------------
