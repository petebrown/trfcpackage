get_player_stats <- function() {
  subs_and_reds <- get_subs_and_reds()

  player_stats <- readr::read_csv("https://raw.githubusercontent.com/petebrown/update-player-stats/main/data/players_df.csv", show_col_types = FALSE) %>%
    dplyr::rename(
      game_id = sb_game_id,
      player_id = sb_player_id,
    ) %>%
    dplyr::mutate(
      game_id = stringr::str_remove(game_id, "tpg"),
      game_id = as.numeric(game_id)
    ) %>%
    dplyr::select(
      player_id,
      player_name,
      game_id,
      game_date,
      pl_goals,
      yellow_cards,
      red_cards
    ) %>%
    dplyr::full_join(subs_and_reds, by = c("game_id", "player_id")) %>%
    dplyr::mutate(
      role = dplyr::case_when(
        is.na(min_on) ~ "starter",
        !is.na(min_on) ~ "sub"
      ),
      mins_played = dplyr::case_when(
        role == "starter" & is.na(min_off) & is.na(min_so) ~ 90,
        role == "starter" & !is.na(min_off) ~ min_off,
        role == "starter" & !is.na(min_so) ~ min_so,
        role == "sub" & is.na(min_off) & is.na(min_so) ~ 90 - min_on,
        role == "sub" & is.na(min_off) ~ min_off - min_on,
        role == "sub" & is.na(min_so) ~ min_so - min_on
      )
    )

  return(player_stats)
}
