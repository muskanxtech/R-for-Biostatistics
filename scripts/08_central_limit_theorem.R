# ===========================================================
# File: 08_central_limit_theorem.R
# Repository: R-for-Biostatistics
# Author: Muskan Sharma
#
# Objective:
# Demonstrate the Central Limit Theorem using:
# 1. Normal distribution
# 2. Uniform distribution
#
# Concepts Covered:
# 1. Random sampling
# 2. Sample mean
# 3. Sampling distribution
# 4. Central Limit Theorem
# ===========================================================


# -----------------------------------------------------------
# SECTION 1: CLT using normal distribution
# -----------------------------------------------------------

population_mean <- 30
population_sd <- 4
sample_size <- 16
num_simulations <- 10000

population_values <- rnorm(
  n = num_simulations,
  mean = population_mean,
  sd = population_sd
)

sample_means <- c()

for (i in 1:num_simulations) {
  sample_values <- sample(
    population_values,
    size = sample_size,
    replace = TRUE
  )
  
  sample_means <- c(sample_means, mean(sample_values))
}

par(mfrow = c(2, 1))

hist(
  population_values,
  breaks = 30,
  col = "lightblue",
  xlim = c(15, 50),
  main = "Population Distribution: Normal",
  xlab = "X values"
)

hist(
  sample_means,
  breaks = 30,
  col = "lightcoral",
  xlim = c(15, 50),
  main = "Sampling Distribution of Mean: Normal",
  xlab = "Sample Means"
)


# -----------------------------------------------------------
# SECTION 2: CLT using uniform distribution
# -----------------------------------------------------------

# Uniform distribution:
# f(x) = 1 / (b - a)
# mean = (a + b) / 2
# sd = sqrt((b - a)^2 / 12)

lower_limit <- 2
upper_limit <- 8
sample_size <- 16
num_simulations <- 10000

uniform_values <- runif(
  n = num_simulations,
  min = lower_limit,
  max = upper_limit
)

uniform_sample_means <- c()

for (i in 1:num_simulations) {
  sample_values <- runif(
    n = sample_size,
    min = lower_limit,
    max = upper_limit
  )
  
  uniform_sample_means <- c(uniform_sample_means, mean(sample_values))
}

par(mfrow = c(2, 1))

hist(
  uniform_values,
  breaks = 30,
  col = "lightblue",
  xlim = c(1, 10),
  main = "Population Distribution: Uniform",
  xlab = "X values"
)

hist(
  uniform_sample_means,
  breaks = 30,
  col = "lightcoral",
  xlim = c(1, 10),
  main = "Sampling Distribution of Mean: Uniform",
  xlab = "Sample Means"
)


# -----------------------------------------------------------
# SECTION 3: Summary statistics
# -----------------------------------------------------------

print("Mean of uniform population values:")
print(mean(uniform_values))

print("SD of uniform population values:")
print(sd(uniform_values))

print("Mean of uniform sample means:")
print(mean(uniform_sample_means))

print("SD of uniform sample means:")
print(sd(uniform_sample_means))


# -----------------------------------------------------------
# SECTION 4: Interpretation
# -----------------------------------------------------------

cat("\n")
cat("Central Limit Theorem Interpretation\n")
cat("------------------------------------\n")
cat("When sample size is sufficiently large,\n")
cat("the distribution of sample means becomes approximately normal,\n")
cat("even if the original population is not normally distributed.\n\n")

cat("The standard deviation of sample means is called Standard Error.\n")
cat("Standard Error = Population SD / sqrt(sample size)\n")


# Reset plotting layout
par(mfrow = c(1, 1))


# -----------------------------------------------------------
# END OF SCRIPT
# -----------------------------------------------------------
