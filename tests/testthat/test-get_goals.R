test_that("get_goals() returns a DPLYR tibble containing goal data from Soccerbase (1997-)", {
  expect_is(get_goals(), "tbl_df")
})
