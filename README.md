
<!-- README.md is generated from README.Rmd. Please edit that file -->

# psifrr <img src="man/figures/logo.png" width="150px" align="right" />

<!-- badges: start -->
<!-- badges: end -->

Analysis and visualization of free recall data.

psifrr relies on the
[Psifr](https://psifr.readthedocs.io/en/stable/index.html) Python
package, which is called from R using the `reticulate` package.

## Installation

First, install `remotes`:

``` r
install.packages("remotes")
```

Next, install psifrr with:

``` r
remotes::install_github("mortonne/psifrr")
```

## Quickstart

To calculate a serial position curve for each participant in a sample
dataset:

``` r
library(psifrr)
raw <- sample_data("Morton2013")
data <- merge_free_recall(raw)
recall <- spc(data)
```

See the [psifrr website](https://mortonne.github.io/psifrr/index.html)
for full documentation and a list of available analyses.

## Importing data

Generally the best way to get your data into shape for analysis in Psifr
is to create a CSV (or TSV) file with one row for each event in the
experiment, including study events (i.e., item presentations) and all
recall attempts (including repeats and intrusions). See [importing
data](https://psifr.readthedocs.io/en/latest/guide/import.html) for
details.

## Citation

If you use Psifr, please cite the paper:

Morton, N. W., (2020). Psifr: Analysis and visualization of free recall
data. Journal of Open Source Software, 5(54), 2669,
<https://doi.org/10.21105/joss.02669>
