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
#' head(data)
sample_data <- function(study) {
  fr$sample_data(study)
}


#' Score free recall data 
#' 
#' Merge study and recall events that have the same subject, list, and item.
#'
#' @param data Free recall data in Psifr format. Must have subject, list, trial_type, position, and item columns.
#' @param merge_keys Columns to use to designate events to merge. Default is [‘subject’, ‘list’, ‘item’], which will merge events related to the same item, but only within list.
#' @param list_keys Columns that apply to both study and recall events.
#' @param study_keys Columns that only apply to study events.
#' @param recall_keys Columns that only apply to recall events.
#' @param position_key Column indicating the position of each item in either the study list or the recall sequence.
#'
#' @return Merged information about study and recall events. Each row corresponds to one unique input/output pair.
#' @export
#'
#' @examples
#' raw <- sample_data("Morton2013")
#' data <- merge_free_recall(raw)
merge_free_recall <- function(data, ...) {
  fr$merge_free_recall(data, ...)
}
