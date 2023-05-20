library(testthat)
library(LinearRegress)

test_that("preprocess_boston_data removes rows with missing values, centers and scales data", {
  # Load the data
  boston_data <- load_boston_data("C:/Users/calvi/Documents/CUHK/course_content_new/Term_6/STA3005/Package development/LinearRegress/data")

  # Add a row with missing values to the dataset
  boston_data_with_na <- rbind(boston_data$actual_data, c(NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA))

  # Preprocess the data
  preprocessed_data <- preprocess_boston_data(boston_data_with_na)

  # Check that the row with missing values has been removed
  expect_equal(nrow(preprocessed_data$train_data) + nrow(preprocessed_data$test_data), nrow(boston_data_with_na) - 1)

  # Check that the data has been centered and scaled
  # Expect mean to be close to 0 and standard deviation to be close to 1
  for (column_name in colnames(preprocessed_data$train_data)) {
    if (column_name != "medv") {
      expect_true(abs(mean(preprocessed_data$train_data[[column_name]])) < 1e-9)
      expect_true(abs(sd(preprocessed_data$train_data[[column_name]]) - 1) < 1e-9)
    }
  }
})
