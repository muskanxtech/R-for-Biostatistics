# ===========================================================
# File: 07_t_distribution.R
# Repository: R-for-Biostatistics
# Author: Muskan Sharma
#
# Objective:
# Demonstrate the Student's t-distribution in R using
# pt(), qt(), dt(), and rt().
#
# Concepts Covered:
# 1. Cumulative probability
# 2. Quantiles
# 3. Probability density
# 4. Random sampling
# 5. t-distribution curve
# 6. Effect of sample size
# ===========================================================


# -----------------------------------------------------------
# SECTION 1: Define sample size
# -----------------------------------------------------------

sample_size <- 12
degrees_of_freedom <- sample_size - 1


# -----------------------------------------------------------
# SECTION 2: Cumulative probability using pt()
# -----------------------------------------------------------

# Probability from -∞ to t = 1.5

t_value <- 1.5

cumulative_probability <- pt(
  q = t_value,
  df = degrees_of_freedom
)

print("Cumulative Probability:")
print(cumulative_probability)


# -----------------------------------------------------------
# SECTION 3: Quantile using qt()
# -----------------------------------------------------------

# Find the t-value corresponding to cumulative
# probability = 0.919

given_probability <- 0.919

quantile_t <- qt(
  p = given_probability,
  df = degrees_of_freedom
)

print("t-value:")
print(quantile_t)


# -----------------------------------------------------------
# SECTION 4: Probability density using dt()
# -----------------------------------------------------------

t_value <- 1.5

probability_density <- dt(
  x = t_value,
  df = degrees_of_freedom
)

print("Probability Density:")
print(probability_density)


# -----------------------------------------------------------
# SECTION 5: Generate random values using rt()
# -----------------------------------------------------------

random_values <- rt(
  n = 10000,
  df = degrees_of_freedom
)

print("First 20 random values:")
print(head(random_values, 20))


# -----------------------------------------------------------
# SECTION 6: Plot Student's t-distribution
# -----------------------------------------------------------

sample_size <- 13
degrees_of_freedom <- sample_size - 1

t_values <- seq(-10, 10, by = 0.1)

density_values <- dt(
  x = t_values,
  df = degrees_of_freedom
)

plot(
  t_values,
  density_values,
  type = "l",
  lwd = 2,
  col = "blue",
  main = "Student's t-Distribution",
  xlab = "t-value",
  ylab = "Probability Density"
)


# -----------------------------------------------------------
# SECTION 7: Probability within ±2
# -----------------------------------------------------------

sample_size <- 200
degrees_of_freedom <- sample_size - 1

t_value <- 2

probability_between <- pt(
  q = t_value,
  df = degrees_of_freedom
) -
pt(
  q = -t_value,
  df = degrees_of_freedom
)

print("Probability between -2 and +2:")
print(probability_between)


# -----------------------------------------------------------
# SECTION 8: Interpretation
# -----------------------------------------------------------

cat("\n")
cat("Important Notes\n")
cat("------------------------------\n")
cat("• Student's t-distribution is used when\n")
cat("  the population standard deviation is unknown.\n\n")
cat("• It has heavier tails than the normal distribution.\n\n")
cat("• As the sample size increases,\n")
cat("  the t-distribution approaches the standard\n")
cat("  normal distribution.\n")


# -----------------------------------------------------------
# END OF SCRIPT
# -----------------------------------------------------------
