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
  fr <- reticulate::import("psifr.fr")
  fr$sample_data(study)
}


#' Create table format data from lists
#'
#' Convert study and recall lists to table format.
#'
#' @param subjects Subject identifier for each list.
#' @param study List of items for each study list.
#' @param recall List of recalled items for each study list.
#' @param lists List of list numbers. If not specified, lists for each subject
#'   will be numbered sequentially starting from one.
#' @param ... Additional arguments specify additional columns. Each must be a
#'   list where the first item indicates study list values and the second item
#'   indicates recall list values. If either item is NULL, that column will be
#'   undefined for that phase.
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
#'   subjects_list, study_lists, recall_lists,
#'   col1 = col1, col2 = col2
#' )
table_from_lists <- function(subjects, study, recall, lists = NULL, ...) {
  fr <- reticulate::import("psifr.fr")
  fr$table_from_lists(subjects, study, recall, lists, ...)
}


#' Check raw free recall data
#'
#' Run checks on raw (unmerged) free recall data.
#'
#' @param data Raw free recall data in standard format.
#'
#' @export
#' @examples
#' # Create data with a required column missing
#' raw <- data.frame(
#'   subject = list(1, 1),
#'   list = list(1, 1),
#'   position = list(1, 2),
#'   item = list("a", "b")
#' )
#'
#' # Checking this dataset will display an error
#' # check_data(raw)
check_data <- function(data) {
  fr <- reticulate::import("psifr.fr")
  fr$check_data(data)
}


#' Score standard free recall data
#'
#' Merge study and recall events that have the same subject, list, and item.
#'
#' @param data Free recall data in Psifr format. Must have subject, list,
#'   trial_type, position, and item columns.
#' @param merge_keys Columns to use to designate events to merge. Default is
#'   list(‘subject’, ‘list’, ‘item’), which will merge events related to the same
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
merge_free_recall <- function(data,
                              merge_keys = NULL,
                              list_keys = NULL,
                              study_keys = NULL,
                              recall_keys = NULL,
                              position_key = "position") {
  fr <- reticulate::import("psifr.fr")
  fr$merge_free_recall(
    data,
    merge_keys = merge_keys,
    list_keys = list_keys,
    study_keys = study_keys,
    recall_keys = recall_keys,
    position_key = position_key
  )
}


#' Score separate study and recall events
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
merge_lists <- function(study,
                        recall,
                        merge_keys = NULL,
                        list_keys = NULL,
                        study_keys = NULL,
                        recall_keys = NULL,
                        position_key = "position") {
  fr <- reticulate::import("psifr.fr")
  fr$merge_lists(
    study,
    recall,
    merge_keys = merge_keys,
    list_keys = list_keys,
    study_keys = study_keys,
    recall_keys = recall_keys,
    position_key = position_key
  )
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
filter_data <- function(data,
                        subjects = NULL,
                        lists = NULL,
                        trial_type = NULL,
                        positions = NULL,
                        inputs = NULL,
                        outputs = NULL) {
  fr <- reticulate::import("psifr.fr")
  fr$filter_data(data, subjects, lists, trial_type, positions, inputs, outputs)
}


#' Reset list index
#'
#' Reset list numbering to be sequential starting from one.
#'
#' @param data Raw or merged data. Must have subject and list fields.
#'
#' @return Data with a renumbered list field, starting from 1.
#'
#' @export
#' @examples
#' # Data where the list number does not start at 1
#' subjects_list <- list(1, 1)
#' study_lists <- list(list("a", "b"), list("c", "d"))
#' recall_lists <- list(list("b"), list("c", "d"))
#' list_nos <- list(3, 4)
#' raw <- table_from_lists(
#'   subjects_list, study_lists, recall_lists,
#'   lists = list_nos
#' )
#' raw
#'
#' # Reset the list number
#' reset_list(raw)
reset_list <- function(data) {
  fr <- reticulate::import("psifr.fr")
  fr$reset_list(data)
}


#' Convert data to split format
#'
#' Convert study, recall, or all events to list format.
#'
#' @param data Free recall data in raw or merged format.
#' @param phase Phase of free recall ('study' or 'recall') to split. If ‘raw’,
#'   all trials will be included.
#' @param keys Data columns to include in the split data. If not specified, all
#'   columns will be included.
#' @param names Name for each column in the returned split data. Default is to
#'   use the same names as the input columns.
#' @param item_query Query string to select study trials to include.
#'
#' @return Data in split format. Each included column will be a key in the
#'   named list.
#'
#' @export
#' @examples
#' # Create raw and merged data
#' list_subject <- list(1, 1)
#' study <- list(list("absence", "hollow"), list("fountain", "piano"))
#' recall <- list(list("absence"), list("piano", "fountain"))
#' raw <- table_from_lists(list_subject, study, recall)
#' data <- merge_free_recall(raw)
#'
#' # Get study events split by list, just including the list and item fields.
#' split_lists(data, "study", keys = list("list", "item"))
#'
#' # Export recall events, split by list.
#' split_lists(data, "recall", keys = list("item"))
#'
#' # Raw events (i.e., events that haven’t been scored) can also be exported to
#' # list format.
#' split_lists(raw, "raw", keys = list("position"))
split_lists <- function(data, phase, keys = NULL, names = NULL, item_query = NULL) {
  fr <- reticulate::import("psifr.fr")
  fr$split_lists(
    data, phase,
    keys = keys, names = names, item_query = item_query, as_list = TRUE
  )
}


#' Create pool index
#'
#' Look up the indices of multiple items in a dataset from a larger pool.
#'
#' @param trial_items The item presented on each trial.
#' @param pool_items_list List of items in the full pool.
#'
#' @return Index of each item in the pool. Trials with items not in the pool
#'   will be NA.
#'
#' @export
#' @examples
#' trial_items <- list("b", "a", "z", "c", "d")
#' pool_items_list <- list("a", "b", "c", "d", "e", "f")
#' pool_index(trial_items, pool_items_list)
pool_index <- function(trial_items, pool_items_list) {
  match(trial_items, pool_items_list)
}


#' Create block index
#'
#' Get the index of each block in a list.
#'
#' @param list_labels Position labels that define the blocks.
#'
#' @return Block index of each position.
#'
#' @export
#' @examples
#' list_labels <- list(2, 2, 3, 3, 3, 1, 1)
#' block_index(list_labels)
block_index <- function(list_labels) {
  fr <- reticulate::import("psifr.fr")
  fr$block_index(list_labels)
}


#' Serial position curve
#'
#' Recall probability as a function of serial position in the list.
#'
#' @param data Merged study and recall data.
#'
#' @return Results with subject, input, and recall columns.
#'
#' @export
#' @examples
#' raw <- sample_data("Morton2013")
#' data <- merge_free_recall(raw)
#' recall <- spc(data)
#' head(recall)
spc <- function(data) {
  fr <- reticulate::import("psifr.fr")
  fr$spc(data)
}


#' Probability of Nth recall
#'
#' Probability of recall by serial position and output position.
#'
#' @param data Merged study and recall data. List length is assumed to be the
#'   same for all lists within each subject.
#' @param item_query Query string to select items to include in the pool of
#'   possible recalls to e examined.
#' @param test_key Name of column with labels to use when testing transitions
#'   for inclusion.
#' @param test Function that takes in previous and current item values and
#'   returns TRUE for transitions that should be included.
#'
#' @return Results with subject, output, input, prob, actual, and possible
#'   columns. The prob column for output x and input y indicates the probability
#'   of recalling input position y at output position x. The actual and possible
#'   columns give the raw tallies for how many times an event actually occurred
#'   and how many times it was possible given the recall sequence.
#'
#' @export
#' @examples
#' raw <- sample_data("Morton2013")
#' data <- merge_free_recall(raw)
#' recall <- pnr(data)
#' head(recall)
pnr <- function(data, item_query = NULL, test_key = NULL, test = NULL) {
  fr <- reticulate::import("psifr.fr")
  fr$pnr(data, item_query = item_query, test_key = test_key, test = test)
}


#' List lag of prior-list intrusions
#'
#' For intrusions of items from previous lists, the lag indicating how many
#' lists back the item was presented.
#'
#' @param data Merged study and recall data. Lists must be numbered starting
#'   from 1 and all lists must be included.
#' @param max_lag Maximum list lag to consider. The intial `max_lag` lists for
#'   each subject will be excluded so that all considered lags are possible for
#'   all included lists.
#'
#' @return Results with subject, list_lag, count, per_list, and prob columns.
#'   Count indicates the number of intrusions with that list lag, while per_list
#'   indicates the number of intrusions per list. The prob column indicates the
#'   probability within each subject of a given included prior-list intrusion
#'   occurring at that lag.
#'
#' @export
#' @examples
#' raw <- sample_data("Morton2013")
#' data <- merge_free_recall(raw)
#' stats <- pli_list_lag(data, max_lag = 3)
#' head(stats)
pli_list_lag <- function(data, max_lag) {
  fr <- reticulate::import("psifr.fr")
  fr$pli_list_lag(data, max_lag)
}


#' Lag conditional response probability
#'
#' Probability of recalling an item as a function of its lag from the previous
#' recall, conditional on it being available for recall.
#'
#' @param data Merged study and recall data.
#' @param lag_key Name of column to use when calculating lag between recalled
#'   items.
#' @param count_unique If TRUE, possible transitions of the same lag will only
#'   be incremented once per transition.
#' @param item_query Query string to select items to include in the pool of
#'   possible recalls to be examined.
#' @param test_key Name of column with labels to use when testing transitions
#'   for inclusion.
#' @param test Function that takes in previous and current item values and
#'   returns TRUE for transitions that should be included.
#'
#' @return Results with `subject`, `lag`, `prob`, `actual`, and `possible`
#'   columns. The `prob` column indicates conditional response probability. The
#'   `actual` column indicates the count of transitions actually made at a given
#'   lag. The `possible` column indicates the number of transitions that could
#'   have been made, given item availability (previously recalled items are
#'   excluded).
#'
#' @export
#' @examples
#' # All transitions included
#' raw <- sample_data("Morton2013")
#' data <- merge_free_recall(raw, study_keys = list("category"))
#' head(lag_crp(data))
#'
#' # Excluding the first three output positions (need to include non-recalled
#' # items specifically so they aren't excluded as possible items to recall)
#' head(lag_crp(data, item_query = "output > 3 or not recall"))
#'
#' # Including within-category transitions only
#' head(lag_crp(data, test_key = "category", test = function(x, y) x == y))
lag_crp <- function(data,
                    lag_key = "input",
                    count_unique = FALSE,
                    item_query = NULL,
                    test_key = NULL,
                    test = NULL) {
  fr <- reticulate::import("psifr.fr")
  fr$lag_crp(
    data,
    lag_key = lag_key,
    count_unique = count_unique,
    item_query = item_query,
    test_key = test_key,
    test = test
  )
}
