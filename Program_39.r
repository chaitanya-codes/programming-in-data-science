# Install package if needed
install.packages("dplyr")

# Load library
library(dplyr)

# Create Customers Dataset
customers <- data.frame(
  CustomerID = c(1,2,3,4,5),
  Name = c("Alice","Bob","Charlie","David","Eva"),
  Email = c("alice@gmail.com","bob@gmail.com","charlie@gmail.com","david@gmail.com","eva@gmail.com")
)

# Create Purchases Dataset
purchases <- data.frame(
  CustomerID = c(1,2,2,4,6),
  PurchaseAmount = c(250,150,300,200,500),
  Date = c("2024-01-10","2024-01-11","2024-01-15","2024-01-20","2024-01-25")
)

# LEFT JOIN
left_result <- left_join(customers, purchases, by="CustomerID")
print("Left Join Result")
print(left_result)

# RIGHT JOIN
right_result <- right_join(customers, purchases, by="CustomerID")
print("Right Join Result")
print(right_result)

# INNER JOIN
inner_result <- inner_join(customers, purchases, by="CustomerID")
print("Inner Join Result")
print(inner_result)

# FULL JOIN
full_result <- full_join(customers, purchases, by="CustomerID")
print("Full Join Result")
print(full_result)