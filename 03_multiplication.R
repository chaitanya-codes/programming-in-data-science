# Function to multiply two numbers
mul_numbers <- function(a, b) {
  return(a * b)
}

# Testing the function with different inputs
result1 <- mul_numbers(5, 10)
result2 <- mul_numbers(-3, 7)
result3 <- mul_numbers(0, 0)
result4 <- mul_numbers(3.5, 2.1)

# Displaying the results
cat("Result of multiplying 5 and 10:", result1, "\n")
cat("Result of multiplying -3 and 7:", result2, "\n")
cat("Result of multiplying 0 and 0:", result3, "\n")
cat("Result of multiplying 3.5 and 2.1:", result4, "\n")