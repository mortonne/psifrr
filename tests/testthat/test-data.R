test_that("sample data loads", {
  data <- sample_data("Morton2013")
  expect_equal(data[1, "item"], "TOWEL")
})
