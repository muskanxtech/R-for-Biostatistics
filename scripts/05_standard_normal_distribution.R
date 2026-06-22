# ===========================================================
# File: 05_standard_normal_distribution.R
# Repository: R-for-Biostatistics
# Author: Muskan Sharma
#
# Objective:
# Demonstrate the Standard Normal (Unit Gaussian)
# distribution in R using pnorm(), qnorm(),
# dnorm(), and rnorm().
#
# Concepts Covered:
# 1. Cumulative probability
# 2. Quantiles (Z-score)
# 3. Probability density
# 4. Random sampling
# 5. Gaussian curve
# 6. Histogram of simulated data
# 7. Converting X to Z-score
# ===========================================================


# -----------------------------------------------------------
# SECTION 1: Cumulative probability using pnorm()
# -----------------------------------------------------------

# Probability from -∞ to Z = 1.72
z_score <- 1.72

cumulative_probability <- pnorm(z_score)

print("Probability from -∞ to Z = 1.72:")
print(cumulative_probability)


# Probability from -∞ to Z = -1.72
z_score <- -1.72

cumulative_probability <- pnorm(z_score)

print("Probability from -∞ to Z = -1.72:")
print(cumulative_probability)


# -----------------------------------------------------------
# SECTION 2: Area within standard deviation intervals
# -----------------------------------------------------------

# Area between -1σ and +1σ
one_sigma <- pnorm(1) - pnorm(-1)

print("Area within ±1 Standard Deviation:")
print(one_sigma)

# Area between -2σ and +2σ
two_sigma <- pnorm(2) - pnorm(-2)

print("Area within ±2 Standard Deviations:")
print(two_sigma)

# Area between -3σ and +3σ
three_sigma <- pnorm(3) - pnorm(-3)

print("Area within ±3 Standard Deviations:")
print(three_sigma)


# -----------------------------------------------------------
# SECTION 3: Quantile using qnorm()
# -----------------------------------------------------------

# Find Z-score corresponding to cumulative probability

given_probability <- 0.79

z_value <- qnorm(given_probability)

print("Z-score for cumulative probability 0.79:")
print(z_value)


given_probability <- 0.50

z_value <- qnorm(given_probability)

print("Z-score for cumulative probability 0.50:")
print(z_value)


# -----------------------------------------------------------
# SECTION 4: Probability density using dnorm()
# -----------------------------------------------------------

z_score <- 1.5

probability_density <- dnorm(z_score)

print("Probability density at Z = 1.5:")
print(probability_density)


z_score <- 0

probability_density <- dnorm(z_score)

print("Probability density at Z = 0:")
print(probability_density)


# -----------------------------------------------------------
# SECTION 5: Generate random values using rnorm()
# -----------------------------------------------------------

random_z <- rnorm(1)

print("One random value from Standard Normal Distribution:")
print(random_z)


# -----------------------------------------------------------
# SECTION 6: Plot Standard Normal Distribution
# -----------------------------------------------------------

z_values <- seq(-4, 4, by = 0.1)

density_values <- dnorm(z_values)

plot(
  z_values,
  density_values,
  type = "l",
  lwd = 2,
  col = "blue",
  main = "Standard Normal Distribution",
  xlab = "Z-score",
  ylab = "Probability Density"
)


# -----------------------------------------------------------
# SECTION 7: Histogram of simulated data
# -----------------------------------------------------------

# Generate 10,000 observations
random_values <- rnorm(10000)

hist(
  random_values,
  breaks = 30,
  col = "lightblue",
  main = "Histogram of 10,000 Standard Normal Values",
  xlab = "Z-score"
)


# Generate 500 observations
random_values <- rnorm(500)

hist(
  random_values,
  breaks = 30,
  col = "lightgreen",
  main = "Histogram of 500 Standard Normal Values",
  xlab = "Z-score"
)


# -----------------------------------------------------------
# SECTION 8: Convert X value to Z-score
# -----------------------------------------------------------

# Given:
# X = 49
# Mean = 39
# Standard Deviation = 3

x_value <- 49
population_mean <- 39
standard_deviation <- 3

# Probability using pnorm()
probability <- pnorm(
  q = x_value,
  mean = population_mean,
  sd = standard_deviation
)

print("Cumulative Probability:")
print(probability)

# Manual Z-score calculation
z_score <- (x_value - population_mean) / standard_deviation

print("Calculated Z-score:")
print(z_score)


# -----------------------------------------------------------
# SECTION 9: Empirical Rule (68-95-99.7 Rule)
# -----------------------------------------------------------

cat("\n")
cat("Empirical Rule for a Normal Distribution\n")
cat("----------------------------------------\n")
cat("Within ±1 SD  : Approximately 68%\n")
cat("Within ±2 SD  : Approximately 95%\n")
cat("Within ±3 SD  : Approximately 99.7%\n")


# -----------------------------------------------------------
# END OF SCRIPT
# -----------------------------------------------------------
