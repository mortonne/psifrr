fr <- reticulate::import("psifr.fr")
#' Load a sample dataset
#'
#' @param study Study to load (options: "Morton2013")
#'
#' @return data.frame
#' @export
#'
#' @examples
#' data <- sample_data("Morton2013")
sample_data <- function(study) {
  fr$sample_data(study)
}
