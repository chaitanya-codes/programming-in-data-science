
# Program: Data Manipulation and Analysis using Starwars Dataset

# Load required libraries
library(dplyr)
library(ggplot2)

# Load the built-in starwars dataset from dplyr package
data(starwars)

# Display the first few rows of the dataset
head(starwars)

# Generate summary statistics for numerical columns
summary(starwars$height)
summary(starwars$mass)

# Display the structure of the dataset
str(starwars)

# Filter dataset to include only Human characters
human_data <- starwars %>%
  filter(species == "Human")

# Create a new column called Lean Mass Index (LMI)
# Formula used: LMI = mass / (height in meters)^2
# Height is converted from cm to meters
human_data <- human_data %>%
  mutate(LMI = mass / (height/100)^2)

# Calculate average LMI grouped by homeworld
avg_lmi <- human_data %>%
  group_by(homeworld) %>%
  summarise(avg_LMI = mean(LMI, na.rm = TRUE))

# Display the grouped result
print(avg_lmi)

# Histogram Visualization
# Shows frequency distribution of LMI values
ggplot(human_data, aes(x = LMI)) +
  geom_histogram(binwidth = 2, fill = "skyblue", color = "black") +
  labs(title = "Histogram of LMI for Human Characters",
       x = "Lean Mass Index",
       y = "Frequency")

# Density Plot Visualization
# Shows smooth distribution of LMI
# Curves are grouped by homeworld
ggplot(human_data, aes(x = LMI, fill = homeworld)) +
  geom_density(alpha = 0.5) +
  labs(title = "Density Plot of LMI grouped by Homeworld",
       x = "Lean Mass Index",
       y = "Density")


# Create height bins for grouping characters
# Categories: Below150, 150-179, 180-209, 210+
human_data <- human_data %>%
  mutate(height_bin = cut(height,
                          breaks = c(0,150,180,210,Inf),
                          labels = c("Below150","150-179","180-209","210+")))

# Bar Chart showing average LMI for each height group
ggplot(human_data, aes(x = height_bin, y = LMI)) +
  stat_summary(fun = mean, geom = "bar", fill = "orange") +
  labs(title = "Average LMI by Height Category",
       x = "Height Category",
       y = "Average LMI")


