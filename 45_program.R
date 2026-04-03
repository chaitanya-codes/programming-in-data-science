# Step 1: Install and load package
install.packages("ggplot2")
library(ggplot2)

# Load dataset
data("midwest", package = "ggplot2")
View(midwest)

# Step 2: Scatter plot with trend line
ggplot(midwest, aes(x = percollege, y = percadultpoverty)) +
  geom_point(color = "blue", alpha = 0.6) +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "College Education vs Adult Poverty",
       x = "Percent College Educated",
       y = "Percent Adult Poverty")

# Step 3: Bar chart
state_pop <- aggregate(poptotal ~ state, data = midwest, sum)

ggplot(state_pop, aes(x = state, y = poptotal)) +
  geom_col(fill = "blue") +
  labs(title = "Total Population by State",
       x = "State",
       y = "Total Population")

# Step 4: Hexagonal heatmap
ggplot(midwest, aes(x = percollege, y = percadultpoverty)) +
  geom_hex() +
  labs(title = "Hexbin Plot of Education vs Poverty")

# Step 5: Shared aesthetic mapping
ggplot(midwest, aes(x = percollege, y = percadultpoverty)) +
  geom_point() +
  geom_smooth(method = "lm") +
  geom_point(aes(y = percchildbelowpovert), color = "green") +
  labs(title = "Shared and Overridden Aesthetics")

# Step 6: Color mapping by state
ggplot(midwest, aes(x = percollege, y = percadultpoverty, color = state)) +
  geom_point() +
  labs(title = "Color Mapping by State")

# Step 7: Custom color and transparency
ggplot(midwest, aes(x = percollege, y = percadultpoverty)) +
  geom_point(color = "red", alpha = 0.3) +
  labs(title = "Customized Scatter Plot")