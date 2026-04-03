# Step 1: Install and load packages
install.packages("ggplot2")
install.packages("plotly")

library(ggplot2)
library(plotly)

# Step 2: Load dataset
data("iris")
View(iris)

# Step 3: Create static scatter plot
p <- ggplot(iris, aes(x = Sepal.Width, y = Petal.Width, color = Species)) +
  geom_point() +
  labs(title = "Sepal Width vs Petal Width")

# Display static plot
p

# Step 4 & 5: Convert to interactive plot
ggplotly(p)

# Step 6: Create interactive plot using plot_ly
plot_ly(
  data = iris,
  x = ~Sepal.Width,
  y = ~Petal.Width,
  color = ~Species,
  type = "scatter",
  mode = "markers"
) %>%
  layout(
    title = "Iris Data Set Visualization",
    xaxis = list(title = "Sepal Width", ticksuffix = " cm"),
    yaxis = list(title = "Petal Width", ticksuffix = " cm")
  )