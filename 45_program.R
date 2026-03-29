# Step 1: Install ggplot2 (only once)
install.packages("ggplot2")

# Step 2: Load library
library(ggplot2)

# Step 3: Create dataset
plant_data <- data.frame(
  Plant_ID = c(1, 2, 3, 4, 5),
  Growth_Rate = c(3.2, 1.8, 2.6, 0.9, 3.8),
  Condition_Label = c("Sunny", "Shade", "Rainy", "Drought", "Cloudy")
)

# Step 4: Create scatter plot
ggplot(plant_data, aes(x = Plant_ID, y = Growth_Rate)) +
  geom_point(color = "dodgerblue", size = 4) +
  geom_text(aes(label = Condition_Label),
            vjust = 1.5,
            color = "darkorange") +
  labs(
    title = "Scatter Plot of Plant Growth Data",
    x = "Plant ID",
    y = "Growth Rate"
  ) +
  theme_minimal()