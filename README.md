
<!-- README.md is generated from README.Rmd. Please edit that file -->

# psifrr

<!-- badges: start -->
<!-- badges: end -->

Analysis and visualization of free recall data.

PsifrR is currently relies on the Psifr Python package. It calls Psifr
using the `reticulate` package.

## Installation

You can install the development version of psifrr from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("mortonne/psifrr")
```

## Example

To load a sample dataset:

``` r
library(psifrr)
raw <- sample_data("Morton2013")
```
