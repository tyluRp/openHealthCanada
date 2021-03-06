#' Recent Recalls
#'
#' @description Returns a response with the 15 latest recalls in each category,
#' all, food, vehicles, health, and cps.
#'
#'  @param lang Either \code{en} for english or \code{fr} for french, defaults
#'  to \code{en}.
#'  @param tibble Logical \code{TRUE} or \code{FALSE} to return a tibble,
#'  defaults to \code{TRUE}.
#'
#'  @example
#'  x <- recent_recalls()
#'  str(x, max.level = 1)
#'
#'  @export
recent_recalls <- function(lang = "en", tibble = TRUE) {
  request <- parse_recent_recalls(lang)
  results <- jsonlite::fromJSON(request)[["results"]]

  if (tibble)
    lapply(results, tibble::as_tibble)
  else
    results
}
