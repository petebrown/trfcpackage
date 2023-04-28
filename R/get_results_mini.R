#' Get Results Mini
#'
#' @return DPLYR tbl_df
#' @export
#'
#' @examples
#' results_mini <- get_results_mini()
#' @importFrom readr read_csv
get_results_mini <- function() {
  results_mini <- readr::read_csv("https://raw.githubusercontent.com/petebrown/league-position-tool/main/docs/input/results_mini.csv", show_col_types = FALSE)

  return(results_mini)
}
