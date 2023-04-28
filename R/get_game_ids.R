#' Get Game IDs
#'
#' @include get_player_stats.R
#'
#' @return DPLYR tbl_df
#' @export
#'
#' @examples
#' game_ids <- get_game_ids()
#' @importFrom dplyr %>%
#' @importFrom dplyr select
#' @importFrom rlang .data
get_game_ids <- function() {
  game_ids <- trfcpackage::get_player_stats()

  game_ids <- game_ids %>%
    dplyr::select(
      .data$game_date,
      .data$game_id
    ) %>%
    unique()

  return(game_ids)
}
