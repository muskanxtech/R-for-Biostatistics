# ===========================================================
# File: 03_coin_toss_analysis.R
# Repository: R-for-Biostatistics
# Author: Muskan Sharma
#
# Objective:
# Analyze experimental coin toss data and compare observed
# frequencies with expected binomial frequencies.
#
# Concepts Covered:
# 1. Reading CSV data
# 2. Frequency table
# 3. Experimental vs theoretical distribution
# 4. Binomial probability
# 5. Data visualization
# ===========================================================


# -----------------------------------------------------------
# SECTION 1: Read coin toss data
# -----------------------------------------------------------

# The CSV file should be present in the working directory
# or inside the data/ folder.
coin_data <- read.csv(
  "coin_toss_experiment_MSc15_BDB3_2025.csv",
  header = TRUE
)

# View first few rows
head(coin_data)


# -----------------------------------------------------------
# SECTION 2: Create frequency table
# -----------------------------------------------------------

# num_success = number of heads obtained in 10 coin tosses
observed_table <- table(coin_data$num_success)

print("Observed frequency table:")
print(observed_table)


# -----------------------------------------------------------
# SECTION 3: Convert frequency table to data frame
# -----------------------------------------------------------

observed_df <- as.data.frame(observed_table)

print("Observed data frame:")
print(observed_df)


# -----------------------------------------------------------
# SECTION 4: Prepare possible values of X
# -----------------------------------------------------------

# Since 10 coins are tossed, possible number of heads = 0 to 10
x_values <- 0:10

# Convert observed table into a complete frequency vector for 0 to 10
observed_frequency <- as.numeric(observed_table[as.character(x_values)])

# Replace NA values with 0
observed_frequency[is.na(observed_frequency)] <- 0

print("Observed frequencies from 0 to 10 heads:")
print(observed_frequency)


# -----------------------------------------------------------
# SECTION 5: Plot observed distribution
# -----------------------------------------------------------

plot(
  x_values,
  observed_frequency,
  type = "h",
  lwd = 2,
  xlim = c(0, 10),
  xlab = "Number of Heads",
  ylab = "Frequency",
  main = "Observed Distribution of Heads in 10 Coin Tosses"
)


# -----------------------------------------------------------
# SECTION 6: Calculate theoretical binomial probabilities
# -----------------------------------------------------------

# For a fair coin:
# n = 10 tosses
# p = 0.5 probability of heads

binomial_probability <- dbinom(
  x = x_values,
  size = 10,
  prob = 0.5
)

print("Theoretical binomial probabilities:")
print(binomial_probability)


# -----------------------------------------------------------
# SECTION 7: Convert probabilities to expected frequencies
# -----------------------------------------------------------

# Expected frequency = total experiments * theoretical probability
expected_frequency <- nrow(coin_data) * binomial_probability

print("Expected frequencies:")
print(expected_frequency)


# -----------------------------------------------------------
# SECTION 8: Compare observed and expected frequencies
# -----------------------------------------------------------

plot(
  x_values,
  observed_frequency,
  type = "h",
  lwd = 2,
  xlab = "Number of Heads",
  ylab = "Frequency",
  main = "Observed vs Expected Coin Toss Distribution"
)

points(
  x_values,
  expected_frequency,
  pch = 19
)

lines(
  x_values,
  expected_frequency,
  type = "b"
)

legend(
  "topright",
  legend = c("Observed Frequency", "Expected Frequency"),
  lty = c(1, 1),
  pch = c(NA, 19)
)


# -----------------------------------------------------------
# SECTION 9: Simulate coin toss experiment
# -----------------------------------------------------------

# Simulate 600 experiments
# Each experiment has 10 coin tosses
simulated_coin_tosses <- rbinom(
  n = 600,
  size = 10,
  prob = 0.5
)

print("First few simulated values:")
print(head(simulated_coin_tosses))

simulated_table <- table(simulated_coin_tosses)

print("Simulated frequency table:")
print(simulated_table)


# -----------------------------------------------------------
# END OF SCRIPT
# -----------------------------------------------------------
