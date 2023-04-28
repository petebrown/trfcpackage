#' Get Player Stats
#'
#' @include get_subs_and_reds.R
#'
#' @return DPLYR tbl_df
#' @export
#'
#' @examples
#' player_stats <- get_player_stats()
#' @importFrom readr read_csv
#' @importFrom dplyr %>%
#' @importFrom dplyr rename
#' @importFrom dplyr mutate
#' @importFrom dplyr select
#' @importFrom dplyr full_join
#' @importFrom dplyr case_when
#' @importFrom stringr str_remove
get_player_stats <- function() {
  subs_and_reds <- trfcpackage::get_subs_and_reds()

  player_stats <- readr::read_csv("https://raw.githubusercontent.com/petebrown/update-player-stats/main/data/players_df.csv", show_col_types = FALSE) %>%
    dplyr::rename(
      game_id = .data$sb_game_id,
      player_id = .data$sb_player_id,
    ) %>%
    dplyr::mutate(
      game_id = stringr::str_remove(.data$game_id, "tpg"),
      game_id = as.numeric(.data$game_id)
    ) %>%
    dplyr::select(
      .data$player_id,
      .data$player_name,
      .data$game_id,
      .data$game_date,
      .data$pl_goals,
      .data$yellow_cards,
      .data$red_cards
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
