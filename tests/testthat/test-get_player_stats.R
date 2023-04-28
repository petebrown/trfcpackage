test_that("get_player_stats() returns a DPLYR tibble containing player stats from Soccerbase (1997-)", {
  expect_is(get_player_stats(), "tbl_df")
})
