# ===========================================================
# File: 04_poisson_distribution.R
# Repository: R-for-Biostatistics
# Author: Muskan Sharma
#
# Objective:
# Demonstrate the Poisson distribution in R using
# ppois(), qpois(), dpois(), and rpois().
#
# Concepts Covered:
# 1. Cumulative probability
# 2. Quantiles
# 3. Exact probability
# 4. Random simulation
# 5. Poisson distribution plots
# ===========================================================


# -----------------------------------------------------------
# SECTION 1: Cumulative probability using ppois()
# -----------------------------------------------------------

# Question:
# What is the probability of observing at most
# 4 events when the average number of events is 7?

x_events <- 4
mean_events <- 7

cumulative_probability <- ppois(
  q = x_events,
  lambda = mean_events
)

cumulative_probability <- round(cumulative_probability, digits = 5)

print("Cumulative Probability:")
print(cumulative_probability)


# -----------------------------------------------------------
# SECTION 2: Using round()
# -----------------------------------------------------------

rounded_value <- round(35.3826, digits = 2)

print("Rounded value:")
print(rounded_value)


# -----------------------------------------------------------
# SECTION 3: Quantile using qpois()
# -----------------------------------------------------------

# Question:
# Given cumulative probability = 0.79,
# find the corresponding number of events.

mean_events <- 8
given_probability <- 0.79

quantile_value <- qpois(
  p = given_probability,
  lambda = mean_events
)

print("Quantile value:")
print(quantile_value)


# -----------------------------------------------------------
# SECTION 4: Exact probability using dpois()
# -----------------------------------------------------------

# Probability of observing exactly 4 events

x_events <- 4
mean_events <- 7

exact_probability <- dpois(
  x = x_events,
  lambda = mean_events
)

print("Exact Probability:")
print(exact_probability)


# -----------------------------------------------------------
# SECTION 5: Generate random Poisson values
# -----------------------------------------------------------

mean_events <- 8

random_values <- rpois(
  n = 100,
  lambda = mean_events
)

print("Random Poisson values:")
print(random_values)


# -----------------------------------------------------------
# SECTION 6: Plot Poisson distribution (Mean = 5)
# -----------------------------------------------------------

mean_events <- 5

x_values <- seq(0, 3 * mean_events)

probability_values <- dpois(
  x = x_values,
  lambda = mean_events
)

print("Poisson probabilities (Mean = 5):")
print(probability_values)

plot(
  x_values,
  probability_values,
  type = "h",
  lwd = 2,
  main = "Poisson Distribution (Mean = 5)",
  xlab = "Number of Events",
  ylab = "Probability"
)


# -----------------------------------------------------------
# SECTION 7: Plot Poisson distribution (Mean = 12)
# -----------------------------------------------------------

mean_events <- 12

x_values <- seq(0, 3 * mean_events)

probability_values <- dpois(
  x = x_values,
  lambda = mean_events
)

print("Poisson probabilities (Mean = 12):")
print(probability_values)

plot(
  x_values,
  probability_values,
  type = "h",
  lwd = 2,
  main = "Poisson Distribution (Mean = 12)",
  xlab = "Number of Events",
  ylab = "Probability"
)

# As lambda increases, the distribution becomes
# more symmetric and approaches a normal distribution.


# -----------------------------------------------------------
# SECTION 8: Simulate Poisson distribution
# -----------------------------------------------------------

mean_events <- 8

simulated_values <- rpois(
  n = 10000,
  lambda = mean_events
)

frequency_table <- table(simulated_values)

print("Frequency Table:")
print(frequency_table)

plot(
  frequency_table,
  main = "Simulated Poisson Distribution",
  xlab = "Number of Events",
  ylab = "Frequency"
)


# -----------------------------------------------------------
# END OF SCRIPT
# -----------------------------------------------------------
