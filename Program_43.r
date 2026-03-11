# Step 1: Install and load jsonlite package
install.packages("jsonlite")   # run only once
library(jsonlite)

# Step 2: Set working directory to the folder containing inventory.json
setwd("C:/Users/kusha/OneDrive/Documents")

# Step 3: Read existing inventory from JSON file
inventory <- fromJSON("inventory.json")

# Step 4: Display current inventory
print("Current Inventory Data:")
print(inventory)

# Show structure and first few records
str(inventory)
head(inventory)

# Step 5: Create new product record
new_product <- data.frame(
  product_id = 104,
  name = "Wireless Mouse",
  category = "Electronics",
  price = 25.99,
  stock = 50
)

# Step 6: Append new product to inventory
updated_inventory <- rbind(inventory, new_product)

# Step 7: Convert updated data to JSON
json_data <- toJSON(updated_inventory, pretty = TRUE)

# Step 8: Write updated data to new JSON file
write(json_data, file = "updated_inventory.json")

# Step 9: Read updated JSON file
updated_data <- fromJSON("updated_inventory.json")

# Step 10: Display updated inventory
print("Updated Inventory Data:")
print(updated_data)