# ---------------------------------------------------------
# Load required library
# ---------------------------------------------------------
library(ggplot2)

# ---------------------------------------------------------
# Load iris dataset
# ---------------------------------------------------------
data(iris)

# Display first few rows
head(iris)

# ---------------------------------------------------------
# Summary statistics
# ---------------------------------------------------------
summary(iris)

# ---------------------------------------------------------
# Display dataset structure
# ---------------------------------------------------------
str(iris)

# ---------------------------------------------------------
# Basic plot of Sepal Length over row index (time)
# ---------------------------------------------------------
plot(iris$Sepal.Length,
     type="l",
     main="Sepal Length over Time",
     xlab="Observation Index",
     ylab="Sepal Length")

# ---------------------------------------------------------
# Handle missing data (remove NA rows)
# ---------------------------------------------------------
iris_clean <- na.omit(iris)

# Display first rows of cleaned dataset
head(iris_clean)

# ---------------------------------------------------------
# Scatter Plot: Sepal Length vs Petal Length
# ---------------------------------------------------------
ggplot(iris_clean, aes(x=Sepal.Length, y=Petal.Length)) +
  geom_point(color="blue") +
  geom_smooth(method="lm", color="red") +
  labs(title="Scatter Plot of Sepal Length vs Petal Length",
       x="Sepal Length",
       y="Petal Length")

# ---------------------------------------------------------
# Create bins for Sepal Length
# ---------------------------------------------------------
iris_clean$Sepal_bin <- cut(iris_clean$Sepal.Length,
                            breaks=c(0,5,6,7,Inf),
                            labels=c("Below5","5-5.9","6-6.9","7+"))

# ---------------------------------------------------------
# Boxplot of Petal Length for Sepal Length bins
# ---------------------------------------------------------
ggplot(iris_clean, aes(x=Sepal_bin, y=Petal.Length)) +
  geom_boxplot(fill="orange") +
  labs(title="Petal Length Distribution across Sepal Length Bins",
       x="Sepal Length Category",
       y="Petal Length")