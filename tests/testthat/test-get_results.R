test_that("get_results() returns a DPLYR tibble containing results from 1921", {
  expect_is(get_results(), "tbl_df")
})
