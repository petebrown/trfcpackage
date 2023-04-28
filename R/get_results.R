#' Get Results
#'
#' @include get_game_ids.R
#' @include get_results_mini.R
#'
#' @return DPLYR tbl_df
#' @export
#'
#' @examples
#' results_df <- get_results()
#' @importFrom readr read_csv
#' @importFrom dplyr %>%
#' @importFrom dplyr select
#' @importFrom dplyr left_join
#' @importFrom dplyr inner_join
#' @importFrom dplyr rename
get_results <- function() {
  game_ids <- trfcpackage::get_game_ids()
  results_mini <- trfcpackage::get_results_mini()

  results_df <- readr::read_csv("https://raw.githubusercontent.com/petebrown/update-results/main/data/results_df.csv", show_col_types = FALSE) %>%
    dplyr::select(-
             c(.data$home_team,
               .data$away_team,
               .data$home_goals,
               .data$away_goals,
               .data$source_url,
               .data$stadium)
    ) %>%
    dplyr::left_join(game_ids, by = "game_date") %>%
    dplyr::inner_join(
      results_mini %>% dplyr::select(.data$game_date, .data$pts), by = "game_date"
    ) %>%
    dplyr::rename(ssn_pts = .data$pts)

  return(results_df)
}
