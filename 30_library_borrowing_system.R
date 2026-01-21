# Initialize a list of books and their borrowers
library_books <- list(
  "The Hobbit" = c("Alice","Bob"),
  "1984" = c("Charlie","Alice"),
  "Moby Dick" = c("Bob")
)

# Function to add a new book with borrowers
add_book <- function(book, borrowers) {
  library_books[[book]] <<- borrowers
}

# Function to remove a book
remove_book <- function(book) {
  library_books[[book]] <<- NULL
}

# Function to calculate total borrowers for each book
total_borrowers <- function() {
  sapply(library_books, length)
}

# Function to find book with highest and lowest borrowers
find_extremes <- function() {
  totals <- total_borrowers()
  highest <- names(which.max(totals))
  lowest <- names(which.min(totals))
  list(highest = highest, lowest = lowest)
}

# Example usage
add_book("Harry Potter", c("David","Emma","Alice"))
remove_book("Moby Dick")
print(total_borrowers())
print(find_extremes())