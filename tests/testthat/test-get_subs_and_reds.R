test_that("get_subs_and_reds() returns a DPLYR tibble containing substitutions and red cards from Soccerbase (1997-)", {
  expect_is(get_subs_and_reds(), "tbl_df")
})
