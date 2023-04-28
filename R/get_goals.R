#' Get Goals
#'
#' @return DPLYR tbl_df
#' @export
#'
#' @examples
#' goals_df <- get_goals()
#' @importFrom readr read_csv
get_goals <- function() {
  goals <- readr::read_csv("https://raw.githubusercontent.com/petebrown/scrape-goals/main/data/goals.csv", show_col_types = FALSE)

  return(goals)
}
