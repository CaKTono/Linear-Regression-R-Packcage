#' @title Load Boston Housing dataset
#'
#' @description This function loads the Boston Housing dataset saved as a CSV file in the "data" directory.
#'
#' @param package_path The path to the package containing the Boston Housing dataset
#' @return A list containing two data.frames: train_data and test_data
#' @examples
#' boston_data <- load_boston_data("path")
#' @export

load_boston_data <- function(package_path) {
  # Define paths to the train and test datasets
  train_data_path <- file.path(package_path, "train.csv")
  test_data_path <- file.path(package_path, "test.csv")
  actual_data_path <- file.path(package_path, "boston_corrected.csv")
  # Read the datasets
  train_data <- read_csv(train_data_path)
  test_data <- read_csv(test_data_path)
  actual_data <- read_csv(actual_data_path)
  # Return the datasets as a list
  return(list(train_data = train_data, test_data = test_data, actual_data=actual_data))
}
