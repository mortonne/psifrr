% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fr.R
\name{pool_index}
\alias{pool_index}
\title{Create pool index}
\usage{
pool_index(trial_items, pool_items_list)
}
\arguments{
\item{trial_items}{The item presented on each trial.}

\item{pool_items_list}{List of items in the full pool.}
}
\value{
Index of each item in the pool. Trials with items not in the pool
will be NA. Will be zero-indexed to work with Python functions.
}
\description{
Look up the indices of multiple items in a dataset from a larger pool.
}
\examples{
trial_items <- list("b", "a", "z", "c", "d")
pool_items_list <- list("a", "b", "c", "d", "e", "f")
pool_index(trial_items, pool_items_list)
}
