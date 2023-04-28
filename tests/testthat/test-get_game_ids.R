test_that("get_game_ids() returns a DPLYR tibble containing game IDs and dates from Soccerbase (1997-)", {
  expect_is(get_game_ids(), "tbl_df")
})
