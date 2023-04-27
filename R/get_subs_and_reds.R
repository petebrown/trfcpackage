get_subs_and_reds <- function() {
  subs_and_reds <- readr::read_csv("https://raw.githubusercontent.com/petebrown/scrape-events/main/data/subs-and-reds.csv", show_col_types = FALSE)

  return(subs_and_reds)
}
