test_that("get_player_info() returns a DPLYR tibble containing player info from Soccerbase (1997-)", {
  expect_is(get_player_info(), "tbl_df")
})
