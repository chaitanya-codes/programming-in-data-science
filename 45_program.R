# Step 1: Install and load package
install.packages("ggplot2")
library(ggplot2)

# Load dataset
data("midwest", package = "ggplot2")
View(midwest)

# Step 2: Scatter Plot with trend line
ggplot(midwest, aes(x = percollege, y = percadultpoverty, color = state)) +
  geom_point(alpha = 0.6) +
  geom_smooth(method = "lm") +
  labs(title = "College Education vs Adult Poverty")

# Step 3: Bar Chart for total population by state
ggplot(midwest, aes(x = state, y = poptotal)) +
  geom_bar(stat = "identity", fill = "blue") +
  labs(title = "Population by State")

# Step 4: Hexagonal Heatmap
ggplot(midwest, aes(x = percollege, y = percadultpoverty)) +
  geom_hex() +
  labs(title = "Hexbin Plot of Education vs Poverty")

# Step 5: Shared Aesthetic Mapping
ggplot(midwest, aes(x = percollege)) +
  geom_point(aes(y = percadultpoverty)) +
  geom_point(aes(y = percchildbelowpovert), color = "green") +
  labs(title = "Multiple Poverty Indicators")

# Step 6: Custom color and transparency
ggplot(midwest, aes(x = percollege, y = percadultpoverty)) +
  geom_point(color = "red", alpha = 0.3) +
  labs(title = "Customized Scatter Plot")