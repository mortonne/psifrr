% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fr.R
\name{pli_list_lag}
\alias{pli_list_lag}
\title{List lag of prior-list intrusions}
\usage{
pli_list_lag(data, max_lag)
}
\arguments{
\item{data}{Merged study and recall data. Lists must be numbered starting
from 1 and all lists must be included.}

\item{max_lag}{Maximum list lag to consider. The intial \code{max_lag} lists for
each subject will be excluded so that all considered lags are possible for
all included lists.}
}
\value{
Results with subject, list_lag, count, per_list, and prob columns.
Count indicates the number of intrusions with that list lag, while per_list
indicates the number of intrusions per list. The prob column indicates the
probability within each subject of a given included prior-list intrusion
occurring at that lag.
}
\description{
For intrusions of items from previous lists, the lag indicating how many
lists back the item was presented.
}
\examples{
raw <- sample_data("Morton2013")
data <- merge_free_recall(raw)
stats <- pli_list_lag(data, max_lag = 3)
head(stats)
}
