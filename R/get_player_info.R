get_player_info <- function() {
  player_info <- readr::read_csv("https://raw.githubusercontent.com/petebrown/scrape-player-info/main/data/player-info.csv", show_col_types = FALSE)

  return(player_info)
}
