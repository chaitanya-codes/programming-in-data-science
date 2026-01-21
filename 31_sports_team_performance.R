# Initialize a list of teams and their scores
team_scores <- list(
  "Team A" = c(90,85,88),
  "Team B" = c(78,82,79),
  "Team C" = c(88,92,90)
)

# Function to add a new team with scores
add_team <- function(team, scores) {
  team_scores[[team]] <<- scores
}

# Function to remove a team
remove_team <- function(team) {
  team_scores[[team]] <<- NULL
}

# Function to calculate average score for each team
average_scores <- function() {
  sapply(team_scores, mean)
}

# Function to rank teams based on average scores
rank_teams <- function() {
  sort(average_scores(), decreasing = TRUE)
}

# Example usage
add_team("Team D", c(95,90,93))
remove_team("Team B")
print(average_scores())
print(rank_teams())