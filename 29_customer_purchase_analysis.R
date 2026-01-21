# Initialize a list of customers and their purchases
customer_purchases <- list(
  Alice = c(200,150,300),
  Bob = c(100,80,150),
  Charlie = c(250,300,100)
)

# Function to add a new customer and purchases
add_customer <- function(name, purchases) {
  customer_purchases[[name]] <<- purchases
}

# Function to remove a customer
remove_customer <- function(name) {
  customer_purchases[[name]] <<- NULL
}

# Function to calculate total purchase for each customer
total_purchases <- function() {
  sapply(customer_purchases, sum)
}

# Function to find customer with highest and lowest total purchase
find_extremes <- function() {
  totals <- total_purchases()
  highest <- names(which.max(totals))
  lowest <- names(which.min(totals))
  list(highest = highest, lowest = lowest)
}

# Example usage
add_customer("David", c(400,200))
remove_customer("Bob")
print(total_purchases())
print(find_extremes())