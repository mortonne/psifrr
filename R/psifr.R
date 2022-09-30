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


#' Create table format data from list format data.
#'
#' Convert study and recall lists to table format.
#'
#' @param subjects Subject identifier for each list.
#' @param study List of items for each study list.
#' @param recall List of recalled items for each study list.
#' @param lists List of list numbers. If not specified, lists for each subject
#'   will be numbered sequentially starting from one.
#'
#' @return Data in table format.
#' @export
#'
#' @examples
#' # Create standard columns from list data.
#' subjects_list <- list(1, 1, 2, 2)
#' study_lists <- list(
#'   list("a", "b"), list("c", "d"), list("e", "f"), list("g", "h")
#' )
#' recall_lists <- list(list("b"), list("d", "c"), list("f", "e"), list())
#' table_from_lists(subjects_list, study_lists, recall_lists)
#'
#' # Include non-standard columns named col1 and col2.
#' subjects_list <- list(1, 1)
#' study_lists <- list(list("a", "b"), list("c", "d"))
#' recall_lists <- list(list("b"), list("d", "c"))
#' col1 <- list(list(list(1, 2), list(1, 2)), list(list(2), list(2, 1)))
#' col2 <- list(list(list(1, 1), list(2, 2)), NULL)
#' table_from_lists(
#'   subjects_list, study_lists, recall_lists, col1 = col1, col2 = col2
#' )
table_from_lists <- function(...) {
  fr$table_from_lists(...)
}


#' Score free recall data
#'
#' Merge study and recall events that have the same subject, list, and item.
#'
#' @param data Free recall data in Psifr format. Must have subject, list,
#'   trial_type, position, and item columns.
#' @param merge_keys Columns to use to designate events to merge. Default is
#'   [‘subject’, ‘list’, ‘item’], which will merge events related to the same
#'   item, but only within list.
#' @param list_keys Columns that apply to both study and recall events.
#' @param study_keys Columns that only apply to study events.
#' @param recall_keys Columns that only apply to recall events.
#' @param position_key Column indicating the position of each item in either
#'   the study list or the recall sequence.
#'
#' @return Merged information about study and recall events. Each row
#'   corresponds to one unique input/output pair.
#' @export
#'
#' @examples
#' raw <- sample_data("Morton2013")
#' data <- merge_free_recall(raw)
merge_free_recall <- function(data, ...) {
  fr$merge_free_recall(data, ...)
}


#' Score study and recall events
#'
#' Merge separated study and recall events that have the same subject, list,
#' and item.
#'
#' @param study Information about all study events.
#'   Should have one row for each study event.
#' @param recall Information about all recall events.
#'   Should have one row for each recall attempt.
#' @param merge_keys Columns to use to designate events to merge.
#'   Default is list(‘subject’, ‘list’, ‘item’), which will merge events
#'   related to the same item, but only within list.
#' @param list_keys Columns that apply to both study and recall events.
#' @param study_keys Columns that only apply to study events.
#' @param recall_keys Columns that only apply to recall events.
#' @param position_key Column indicating the position of each item in either
#'   the study list or the recall sequence.
#'
#' @return Merged information about study and recall events. Each row
#'   corresponds to one unique input/output pair.
#' @export
#' @examples
#' study <- data.frame(
#'   subject = c(1, 1), list = c(1, 1), position = c(1, 2), item = c("a", "b")
#' )
#' recall <- data.frame(subject = 1, list = 1, position = 1, item = "b")
#' merge_lists(study, recall)
merge_lists <- function(...) {
  fr$merge_lists(...)
}


#' Filter free recall data
#'
#' Filter raw or scored data to get a subset of trials or study/recall pairings.
#'
#' @param data Raw or merged data to filter.
#' @param subjects Subject or subjects to include.
#' @param lists List or lists to include.
#' @param trial_type Trial type to include.
#' @param positions Position or positions to include.
#' @param inputs Input position or positions to include.
#' @param outputs Output position or positions to include.
#'
#' @return The filtered subset of data.
#'
#' @export
#' @examples
#' # Filter data to get study events for subject 1
#' subjects_list <- list(1, 1, 2, 2)
#' study_lists <- list(
#'   list("a", "b"), list("c", "d"), list("e", "f"), list("g", "h")
#' )
#' recall_lists <- list(list("b"), list("d", "c"), list("f", "e"), list())
#' raw <- table_from_lists(subjects_list, study_lists, recall_lists)
#' filter_data(raw, subjects = 1, trial_type = "study")
#'
#' # Filtered scored data to get subject 2
#' data <- merge_free_recall(raw)
#' filter_data(data, subjects = 2)
filter_data <- function(data, ...) {
  fr$filter_data(data, ...)
}


#' Reset list index
#' 
#' Reset list numbering to be sequential starting from one.
#' 
#' @param df Raw or merged data. Must have subject and list fields.
#' 
#' @return Data with a renumbered list field, starting from 1.
#' 
#' @export
#' @examples
#' # Data where the list number does not start at 1
#' subjects_list <- list(1, 1)
#' study_lists <- list(list('a', 'b'), list('c', 'd'))
#' recall_lists <- list(list('b'), list('c', 'd'))
#' list_nos <- list(3, 4)
#' raw <- table_from_lists(
#'   subjects_list, study_lists, recall_lists, lists = list_nos
#' )
#' raw
#' 
#' # Reset the list number
#' reset_list(raw)
reset_list <- function(data) {
  fr$reset_list(data)
}
