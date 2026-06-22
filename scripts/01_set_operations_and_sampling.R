# ===========================================================
# File: 01_set_operations_and_sampling.R
# Repository: R-for-Biostatistics
# Author: Muskan Sharma
#
# Objective:
# Demonstrate basic set operations, random sampling,
# permutations, and combinations in R.
#
# Concepts Covered:
# 1. Union
# 2. Intersection
# 3. Venn Diagram
# 4. Unique Elements
# 5. Random Sampling
# 6. DNA Sequence Generation
# 7. Coin Toss Simulation
# 8. Factorial
# 9. Permutations
# 10. Combinations
# ===========================================================


# -----------------------------------------------------------
# SECTION 1: Install and load required packages
# -----------------------------------------------------------

# Run install.packages() only once if the package is not installed
# install.packages("gplots")
# install.packages("gtools")

library(gplots)
library(gtools)


# -----------------------------------------------------------
# SECTION 2: Create sets
# -----------------------------------------------------------

set_A <- c(10, 20, 30, 40, 50, 60, 70)
set_B <- c(50, 60, 70, 80, 90, 100, 110)
set_C <- c(50, 60, 220, 300, 400)

print("Set A:")
print(set_A)

print("Set B:")
print(set_B)

print("Set C:")
print(set_C)


# -----------------------------------------------------------
# SECTION 3: Union of two sets
# -----------------------------------------------------------

union_AB <- union(set_A, set_B)

print("Union of Set A and Set B:")
print(union_AB)


# -----------------------------------------------------------
# SECTION 4: Intersection of two sets
# -----------------------------------------------------------

intersection_AB <- intersect(set_A, set_B)

print("Intersection of Set A and Set B:")
print(intersection_AB)


# -----------------------------------------------------------
# SECTION 5: Intersection of three sets
# -----------------------------------------------------------

intersection_ABC <- intersect(intersect(set_A, set_B), set_C)

print("Intersection of Set A, Set B, and Set C:")
print(intersection_ABC)


# -----------------------------------------------------------
# SECTION 6: Venn diagram
# -----------------------------------------------------------

# This creates a Venn diagram for Set A, Set B, and Set C
venn(
  list(
    Set_A = set_A,
    Set_B = set_B,
    Set_C = set_C
  )
)


# -----------------------------------------------------------
# SECTION 7: Unique elements
# -----------------------------------------------------------

# unique() removes duplicate values from a vector
unique_B <- unique(set_B)

print("Unique elements in Set B:")
print(unique_B)


# -----------------------------------------------------------
# SECTION 8: Random sampling from numbers
# -----------------------------------------------------------

number_vector <- seq(1, 100)

# Sample 20 elements randomly from 1 to 100 with replacement
random_sample_numbers <- sample(
  number_vector,
  size = 20,
  replace = TRUE
)

print("Random sample of 20 numbers from 1 to 100:")
print(random_sample_numbers)


# -----------------------------------------------------------
# SECTION 9: DNA sequence simulation
# -----------------------------------------------------------

dna_bases <- c("A", "T", "G", "C")

# Randomly sample 20 DNA bases with replacement
random_dna_bases <- sample(
  dna_bases,
  size = 20,
  replace = TRUE
)

print("Random DNA bases:")
print(random_dna_bases)

# Combine the sampled bases into one DNA sequence
dna_sequence <- paste(random_dna_bases, collapse = "")

print("Random DNA sequence:")
print(dna_sequence)


# -----------------------------------------------------------
# SECTION 10: Coin toss simulation
# -----------------------------------------------------------

coin_sides <- c("H", "T")

# Simulate 30 coin tosses
coin_tosses <- sample(
  coin_sides,
  size = 30,
  replace = TRUE
)

print("Simulated coin tosses:")
print(coin_tosses)

print("Number of Heads and Tails:")
print(table(coin_tosses))


# -----------------------------------------------------------
# SECTION 11: Factorial
# -----------------------------------------------------------

factorial_result <- factorial(7)

print("Factorial of 7:")
print(factorial_result)


# -----------------------------------------------------------
# SECTION 12: Permutations without repetition
# -----------------------------------------------------------

letters_vector <- c("A", "B", "C", "D")

permutations_without_repetition <- permutations(
  n = length(letters_vector),
  r = 3,
  v = letters_vector,
  repeats.allowed = FALSE
)

print("Permutations of 4 letters taken 3 at a time without repetition:")
print(permutations_without_repetition)


# -----------------------------------------------------------
# SECTION 13: Permutations with repetition
# -----------------------------------------------------------

permutations_with_repetition <- permutations(
  n = length(letters_vector),
  r = 3,
  v = letters_vector,
  repeats.allowed = TRUE
)

print("Permutations of 4 letters taken 3 at a time with repetition:")
print(permutations_with_repetition)


# -----------------------------------------------------------
# SECTION 14: Combinations without repetition
# -----------------------------------------------------------

combinations_without_repetition <- combinations(
  n = length(letters_vector),
  r = 3,
  v = letters_vector,
  repeats.allowed = FALSE
)

print("Combinations of 4 letters taken 3 at a time without repetition:")
print(combinations_without_repetition)


# -----------------------------------------------------------
# END OF SCRIPT
# -----------------------------------------------------------
