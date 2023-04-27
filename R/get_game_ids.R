get_game_ids <- function() {
  game_ids <- get_player_stats() %>%
    dplyr::select(
      game_date,
      game_id
    ) %>%
    unique()

  return(game_ids)
}
