# ===========================================================
# File: 06_height_weight_data_analysis.R
# Repository: R-for-Biostatistics
# Author: Muskan Sharma
#
# Objective:
# Analyze height and weight data by:
# 1. Reading a CSV file
# 2. Converting units
# 3. Computing Mean, Standard Deviation and Z-score
# 4. Plotting histograms
#
# Concepts Covered:
# 1. Data Import
# 2. Unit Conversion
# 3. Mean
# 4. Standard Deviation
# 5. Z-score
# 6. Histogram
# ===========================================================


# -----------------------------------------------------------
# SECTION 1: Read Dataset
# -----------------------------------------------------------

# Read height-weight dataset
data <- read.csv(
  file = "SOCR_height_weight_data.csv",
  header = TRUE
)

# Display dataset dimensions
print("Dimensions of Dataset:")
print(dim(data))

# Display column names
print("Column Names:")
print(colnames(data))


# -----------------------------------------------------------
# SECTION 2: Convert Units
# -----------------------------------------------------------

# Convert height from inches to centimeters
height_cm <- data$Height.Inches * 2.54

# Convert weight from pounds to kilograms
weight_kg <- data$Weight.Pounds * 0.453592

print("First few converted heights (cm):")
print(head(height_cm))

print("First few converted weights (kg):")
print(head(weight_kg))


# -----------------------------------------------------------
# SECTION 3: Plot Histograms
# -----------------------------------------------------------

hist(
  height_cm,
  breaks = 30,
  col = "lightblue",
  main = "Height Distribution",
  xlab = "Height (cm)"
)

hist(
  weight_kg,
  breaks = 30,
  col = "lightgreen",
  main = "Weight Distribution",
  xlab = "Weight (kg)"
)


# -----------------------------------------------------------
# SECTION 4: Calculate Mean and Standard Deviation
# -----------------------------------------------------------

mean_height <- mean(height_cm)
sd_height <- sd(height_cm)

mean_weight <- mean(weight_kg)
sd_weight <- sd(weight_kg)

print("Mean Height (cm):")
print(mean_height)

print("Standard Deviation of Height:")
print(sd_height)

print("Mean Weight (kg):")
print(mean_weight)

print("Standard Deviation of Weight:")
print(sd_weight)


# -----------------------------------------------------------
# SECTION 5: Calculate Z-scores
# -----------------------------------------------------------

# Z = (X - Mean) / Standard Deviation

z_height <- (height_cm - mean_height) / sd_height

z_weight <- (weight_kg - mean_weight) / sd_weight

print("First few Height Z-scores:")
print(head(z_height))

print("First few Weight Z-scores:")
print(head(z_weight))


# -----------------------------------------------------------
# SECTION 6: Compare Original and Standardized Data
# -----------------------------------------------------------

# Divide plotting window into four panels
par(mfrow = c(2, 2))

# Original Height Distribution
hist(
  height_cm,
  breaks = 30,
  col = "lightblue",
  main = "Height (cm)",
  xlab = "Height"
)

# Standardized Height Distribution
hist(
  z_height,
  breaks = 30,
  col = "blue",
  main = "Height Z-score",
  xlab = "Z-score"
)

# Original Weight Distribution
hist(
  weight_kg,
  breaks = 30,
  col = "lightcoral",
  main = "Weight (kg)",
  xlab = "Weight"
)

# Standardized Weight Distribution
hist(
  z_weight,
  breaks = 30,
  col = "red",
  main = "Weight Z-score",
  xlab = "Z-score"
)

# Reset plotting window
par(mfrow = c(1, 1))


# -----------------------------------------------------------
# SECTION 7: Summary Statistics
# -----------------------------------------------------------

cat("\n")
cat("Summary Statistics\n")
cat("------------------\n")

cat("Mean Height :", mean_height, "cm\n")
cat("SD Height   :", sd_height, "cm\n\n")

cat("Mean Weight :", mean_weight, "kg\n")
cat("SD Weight   :", sd_weight, "kg\n")


# -----------------------------------------------------------
# END OF SCRIPT
# -----------------------------------------------------------
