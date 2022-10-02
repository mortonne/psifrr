
<!-- README.md is generated from README.Rmd. Please edit that file -->

# psifrr <img src="man/figures/logo.png" width="150px" align="right" />

<!-- badges: start -->
<!-- badges: end -->

Analysis and visualization of free recall data.

psifrr relies on the
[Psifr](https://psifr.readthedocs.io/en/stable/index.html) Python
package, which is called from R using the `reticulate` package.

## Installation

First, install `devtools` and `reticulate`:

``` r
install.packages("reticulate")
install.packages("devtools")
```

Follow the `reticulate` package
[documentation](https://rstudio.github.io/reticulate/index.html) to set
up a Python environment.

Next, install the Psifr Python package:

``` r
py_install("git+https://github.com/mortonne/psifr.git@reticulate", pip=TRUE)
```

Finally, install psifrr from [GitHub](https://github.com/) with:

``` r
devtools::install_github("mortonne/psifrr")
```

## Working with free recall data

To load a sample dataset in [Psifr
format](https://psifr.readthedocs.io/en/stable/guide/import.html):

``` r
library(psifrr)
raw <- sample_data("Morton2013")
head(raw)
#>   subject list position trial_type       item item_number session list_type
#> 1       1    1        1      study      TOWEL         743       1      pure
#> 2       1    1        2      study      LADLE         631       1      pure
#> 3       1    1        3      study    THERMOS         735       1      pure
#> 4       1    1        4      study       LEGO         637       1      pure
#> 5       1    1        5      study   BACKPACK         521       1      pure
#> 6       1    1        6      study JACKHAMMER         621       1      pure
#>   category response response_time list_category
#> 1      obj        3         1.517           obj
#> 2      obj        3         1.404           obj
#> 3      obj        3         0.911           obj
#> 4      obj        3         0.883           obj
#> 5      obj        3         0.819           obj
#> 6      obj        1         1.212           obj
```

To analyze a dataset, we need to first score it by matching up study
items to recalled items. See [Scoring
data](https://psifr.readthedocs.io/en/stable/guide/score.html) for
details.

``` r
data <- merge_free_recall(raw)
```

We can use `filter_data` to a select one list for a sample of what the
results look like:

``` r
filter_data(data, subjects = 1, lists = 1)
#>    subject list          item input output study recall repeat intrusion
#> 0        1    1         TOWEL     1     13  TRUE   TRUE      0     FALSE
#> 1        1    1         LADLE     2    NaN  TRUE  FALSE      0     FALSE
#> 2        1    1       THERMOS     3    NaN  TRUE  FALSE      0     FALSE
#> 3        1    1          LEGO     4     18  TRUE   TRUE      0     FALSE
#> 4        1    1      BACKPACK     5     10  TRUE   TRUE      0     FALSE
#> 5        1    1    JACKHAMMER     6      7  TRUE   TRUE      0     FALSE
#> 6        1    1       LANTERN     7    NaN  TRUE  FALSE      0     FALSE
#> 7        1    1      DOORKNOB     8     11  TRUE   TRUE      0     FALSE
#> 8        1    1        SHOVEL     9      9  TRUE   TRUE      0     FALSE
#> 9        1    1        SHOVEL     9     19 FALSE   TRUE      1     FALSE
#> 10       1    1     WATER GUN    10    NaN  TRUE  FALSE      0     FALSE
#> 11       1    1 INK CARTRIDGE    11    NaN  TRUE  FALSE      0     FALSE
#> 12       1    1         PHONE    12     16  TRUE   TRUE      0     FALSE
#> 13       1    1    PAPER CLIP    13     17  TRUE   TRUE      0     FALSE
#> 14       1    1     MOUSETRAP    14     12  TRUE   TRUE      0     FALSE
#> 15       1    1       SPEAKER    15    NaN  TRUE  FALSE      0     FALSE
#> 16       1    1      CAR SEAT    16      5  TRUE   TRUE      0     FALSE
#> 17       1    1       BAYONET    17      3  TRUE   TRUE      0     FALSE
#> 18       1    1        MIRROR    18     15  TRUE   TRUE      0     FALSE
#> 19       1    1         STONE    19      8  TRUE   TRUE      0     FALSE
#> 20       1    1         WATCH    20      4  TRUE   TRUE      0     FALSE
#> 21       1    1          PILL    21      6  TRUE   TRUE      0     FALSE
#> 22       1    1     SMART CAR    22      2  TRUE   TRUE      0     FALSE
#> 23       1    1        REMOTE    23    NaN  TRUE  FALSE      0     FALSE
#> 24       1    1         CHAIN    24      1  TRUE   TRUE      0     FALSE
#> 25       1    1         CHAIN    24     14 FALSE   TRUE      1     FALSE
#>    prior_list prior_input
#> 0         NaN         NaN
#> 1         NaN         NaN
#> 2         NaN         NaN
#> 3         NaN         NaN
#> 4         NaN         NaN
#> 5         NaN         NaN
#> 6         NaN         NaN
#> 7         NaN         NaN
#> 8         NaN         NaN
#> 9         NaN         NaN
#> 10        NaN         NaN
#> 11        NaN         NaN
#> 12        NaN         NaN
#> 13        NaN         NaN
#> 14        NaN         NaN
#> 15        NaN         NaN
#> 16        NaN         NaN
#> 17        NaN         NaN
#> 18        NaN         NaN
#> 19        NaN         NaN
#> 20        NaN         NaN
#> 21        NaN         NaN
#> 22        NaN         NaN
#> 23        NaN         NaN
#> 24        NaN         NaN
#> 25        NaN         NaN
```

See [Managing
data](https://psifr.readthedocs.io/en/latest/api/fr.html#managing-data)
for a full list of functions that operate on free recall data.
