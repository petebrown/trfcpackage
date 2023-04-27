get_goals <- function() {
  goals <- readr::read_csv("https://raw.githubusercontent.com/petebrown/scrape-goals/main/data/goals.csv", show_col_types = FALSE)

  return(goals)
}
