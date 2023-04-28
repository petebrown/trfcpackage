#' Get Player Info
#'
#' @return DPLYR tbl_df
#' @export
#'
#' @examples
#' player_info <- get_player_info()
#' @importFrom readr read_csv
get_player_info <- function() {
  player_info <- readr::read_csv("https://raw.githubusercontent.com/petebrown/scrape-player-info/main/data/player-info.csv", show_col_types = FALSE)

  return(player_info)
}
