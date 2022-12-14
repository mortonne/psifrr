% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fr.R
\name{sample_distances}
\alias{sample_distances}
\title{Load sample distances}
\usage{
sample_distances(study)
}
\arguments{
\item{study}{Study to load distances from (options: "Morton2013").}
}
\value{
A matrix with item-item distances for the specified \code{study}.
}
\description{
Load semantic distances between pairs of items.
}
\examples{
d <- sample_distances("Morton2013")
items <- d$items
distances <- d$distances
}
