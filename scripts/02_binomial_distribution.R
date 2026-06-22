# ===========================================================
# File: 02_binomial_distribution.R
# Repository: R-for-Biostatistics
# Author: Muskan Sharma
#
# Objective:
# Demonstrate the binomial distribution in R using
# pbinom(), qbinom(), dbinom(), and rbinom().
#
# Concepts Covered:
# 1. Cumulative probability
# 2. Quantiles
# 3. Exact probability
# 4. Random simulation
# 5. Binomial distribution plots
# ===========================================================


# -----------------------------------------------------------
# SECTION 1: Set binomial parameters
# -----------------------------------------------------------

# n = number of trials
# p = probability of success in each trial

n_trials <- 12
prob_success <- 0.5


# -----------------------------------------------------------
# SECTION 2: Cumulative probability using pbinom()
# -----------------------------------------------------------

# Question:
# What is the probability of getting at most 4 successes
# in 12 trials, when probability of success is 0.5?

x_successes <- 4

cumulative_probability <- pbinom(
  q = x_successes,
  size = n_trials,
  prob = prob_success
)

print("Probability of getting at most 4 successes:")
print(cumulative_probability)


# -----------------------------------------------------------
# SECTION 3: Quantile using qbinom()
# -----------------------------------------------------------

# Question:
# For cumulative probability 0.8,
# what is the corresponding number of successes?

given_probability <- 0.8

quantile_value <- qbinom(
  p = given_probability,
  size = n_trials,
  prob = prob_success
)

print("Number of successes corresponding to cumulative probability 0.8:")
print(quantile_value)


# -----------------------------------------------------------
# SECTION 4: Exact probability using dbinom()
# -----------------------------------------------------------

# Question:
# What is the probability of getting exactly 4 successes
# in 12 trials?

exact_probability <- dbinom(
  x = x_successes,
  size = n_trials,
  prob = prob_success
)

print("Probability of getting exactly 4 successes:")
print(exact_probability)


# -----------------------------------------------------------
# SECTION 5: Random values using rbinom()
# -----------------------------------------------------------

# Generate 10 random observations from Binomial(n = 12, p = 0.5)

random_values <- rbinom(
  n = 10,
  size = n_trials,
  prob = prob_success
)

print("Random binomial values:")
print(random_values)


# -----------------------------------------------------------
# SECTION 6: Plot cumulative binomial distribution
# -----------------------------------------------------------

x_values <- seq(0, n_trials)

cumulative_values <- pbinom(
  q = x_values,
  size = n_trials,
  prob = prob_success
)

print("Cumulative binomial probabilities:")
print(cumulative_values)

plot(
  x_values,
  cumulative_values,
  type = "p",
  pch = 20,
  main = "Cumulative Binomial Distribution",
  xlab = "Number of Successes",
  ylab = "Cumulative Probability"
)


# -----------------------------------------------------------
# SECTION 7: Plot binomial probability distribution
# -----------------------------------------------------------

probability_values <- dbinom(
  x = x_values,
  size = n_trials,
  prob = prob_success
)

print("Binomial probability values:")
print(probability_values)

plot(
  x_values,
  probability_values,
  type = "p",
  pch = 20,
  main = "Binomial Probability Distribution",
  xlab = "Number of Successes",
  ylab = "Probability"
)


# -----------------------------------------------------------
# SECTION 8: Plot binomial distribution as vertical lines
# -----------------------------------------------------------

plot(
  x_values,
  probability_values,
  type = "h",
  lwd = 2,
  main = "Binomial Distribution as Line Plot",
  xlab = "Number of Successes",
  ylab = "Probability"
)


# -----------------------------------------------------------
# SECTION 9: Simulate binomial distribution
# -----------------------------------------------------------

# Generate 10,000 observations from Binomial(n = 12, p = 0.5)

simulated_values <- rbinom(
  n = 10000,
  size = n_trials,
  prob = prob_success
)

frequency_table <- table(simulated_values)

print("Frequency table of simulated binomial values:")
print(frequency_table)

plot(
  frequency_table,
  main = "Simulated Binomial Distribution",
  xlab = "Number of Successes",
  ylab = "Frequency"
)


# -----------------------------------------------------------
# END OF SCRIPT
# -----------------------------------------------------------
