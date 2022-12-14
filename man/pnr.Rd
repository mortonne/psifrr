% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fr.R
\name{pnr}
\alias{pnr}
\title{Probability of Nth recall}
\usage{
pnr(data, item_query = NULL, test_key = NULL, test = NULL)
}
\arguments{
\item{data}{Merged study and recall data. List length is assumed to be the
same for all lists within each subject.}

\item{item_query}{Query string to select items to include in the pool of
possible recalls to e examined.}

\item{test_key}{Name of column with labels to use when testing transitions
for inclusion.}

\item{test}{Function that takes in previous and current item values and
returns TRUE for transitions that should be included.}
}
\value{
Results with subject, output, input, prob, actual, and possible
columns. The prob column for output x and input y indicates the probability
of recalling input position y at output position x. The actual and possible
columns give the raw tallies for how many times an event actually occurred
and how many times it was possible given the recall sequence.
}
\description{
Probability of recall by serial position and output position.
}
\examples{
raw <- sample_data("Morton2013")
data <- merge_free_recall(raw)
recall <- pnr(data)
head(recall)
}
