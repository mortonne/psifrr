fr <- reticulate::import("psifr.fr")


#' Load a sample dataset
#' 
#' Load one of the included sample datasets.
#'
#' @param study Study to load (options: "Morton2013").
#'
#' @return A data.frame with data from the specified `study`.
#' @export
#'
#' @examples
#' data <- sample_data("Morton2013")
sample_data <- function(study) {
  fr$sample_data(study)
}
