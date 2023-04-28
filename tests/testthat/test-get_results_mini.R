test_that("get_results_mini() returns a DPLYR tibble containing the mini versions of results from shiny-seasons repo", {
  expect_is(get_results_mini(), "tbl_df")
})
