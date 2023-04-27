get_results <- function() {
  game_ids <- get_game_ids()
  results_mini <- get_results_mini()

  results_df <- readr::read_csv("https://raw.githubusercontent.com/petebrown/update-results/main/data/results_df.csv", show_col_types = FALSE) %>%
    dplyr::select(-
             c(home_team,
               away_team,
               home_goals,
               away_goals,
               source_url,
               stadium)
    ) %>%
    dplyr::left_join(game_ids, by = "game_date") %>%
    dplyr::inner_join(
      results_mini %>% select(game_date, pts), by = "game_date"
    ) %>%
    dplyr::rename(ssn_pts = pts)

  return(results_df)
}
