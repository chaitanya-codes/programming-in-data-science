# Step 1: Install and load package
install.packages("dplyr")
library(dplyr)

# Load dataset
data("starwars", package = "dplyr")
View(starwars)

# Step 2: Select required columns
data_selected <- starwars %>%
  select(name, species, height, mass, homeworld, gender)
View(data_selected)

# Step 3: Filter species with more than 2 characters
species_filtered <- data_selected %>%
  group_by(species) %>%
  filter(n() > 2)
View(species_filtered)

# Step 4: Create new columns
data_transformed <- species_filtered %>%
  mutate(
    height_m = height / 100,
    weight_category = case_when(
      mass < 50 ~ "Underweight",
      mass >= 50 & mass < 80 ~ "Normal",
      mass >= 80 ~ "Overweight",
      TRUE ~ NA_character_
    )
  )
View(data_transformed)

# Step 5: Average height for species-gender
avg_height <- data_transformed %>%
  group_by(species, gender) %>%
  summarize(avg_height = mean(height, na.rm = TRUE))
View(avg_height)

# Step 6: Top 3 species with highest average height
top_species <- avg_height %>%
  group_by(species) %>%
  summarize(mean_height = mean(avg_height, na.rm = TRUE)) %>%
  arrange(desc(mean_height)) %>%
  slice_head(n = 3)
View(top_species)