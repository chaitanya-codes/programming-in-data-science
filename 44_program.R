# Step 1:
install.packages("ggplot2")
library(ggplot2)

# Step 2:
data <- data.frame(
  a = 1:10,
  b = rnorm(10),
  label = letters[11:20]
)

print(data)

# Step 3.1.1: Scatter plot
ggplot(data = data, aes(x = a, y = b)) +
  geom_point() +
  labs(title = "Scatter Plot", x = "X-axis", y = "Y-axis")

# Step 3.1.2: Scatter plot with color
ggplot(data = data, aes(x = a, y = b)) +
  geom_point(color = "forestgreen", size = 3) +
  labs(title = "Scatter Plot with Color Customization", x = "X-axis", y = "Y-axis")

# Step 3.1.3: Scatter plot with labels
ggplot(data = data, aes(x = a, y = b)) +
  geom_point(color = "forestgreen", size = 3) +
  geom_text(aes(label = label), vjust = -1, color = "blue") +
  labs(title = "Scatter Plot with Text Labels", x = "X-axis", y = "Y-axis")

# Step 3.1.4: Scatter plot with smooth line
ggplot(data = data, aes(x = a, y = b)) +
  geom_point(color = "forestgreen", size = 3) +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Scatter Plot with Smooth Line", x = "X-axis", y = "Y-axis")

# Step 3.2: Line plot
ggplot(data = data, aes(x = a, y = b)) +
  geom_line(color = "red", linewidth = 1) +
  labs(title = "Line Plot", x = "X-axis", y = "Y-axis")

# Step 3.3: Bar plot
ggplot(data = data, aes(x = factor(a), y = b)) +
  geom_bar(stat = "identity", fill = "blue") +
  labs(title = "Bar Plot", x = "Category (a)", y = "Values")