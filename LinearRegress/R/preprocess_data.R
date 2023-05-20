#' @title Preprocess the Boston Housing dataset
#'
#' @description This function preprocesses the Boston Housing dataset by removing rows with missing values, removing the 'ID' column,
#' centering, and scaling the predictor variables.
#'
#' @param data A list containing the training and testing datasets
#' @return A list containing the preprocessed training and testing datasets
#' @examples
#' boston_data <- load_boston_data("path/to/package")
#' preprocessed_data <- preprocess_boston_data(boston_data)
#' @export

preprocess_boston_data <- function(data) {
  # Remove rows with missing values
  clean_train_data <- data$train_data %>%
    drop_na()
  clean_test_data <- data$test_data %>%
    drop_na()
  actual_data <- data$actual_data %>%
    drop_na()

  # Find the row indices in actual_data that match test_data based on 'ID' column
  matched_rows <- match(clean_test_data$ID, actual_data$ID)

  # Filter actual_data to keep only the matched rows
  actual_data <- actual_data[matched_rows, ]

  # Remove the 'ID' column
  clean_train_data <- clean_train_data %>% select(-ID)
  clean_test_data <- clean_test_data %>% select(-ID)
  actual_data <- actual_data %>% select(-ID)

  # Define a recipe for preprocessing
  preprocessing_recipe <- recipe(medv ~ ., data = clean_train_data) %>%
    step_center(-all_outcomes()) %>%
    step_scale(-all_outcomes())

  # Prepare the recipe and apply it to the data
  preprocessor <- prep(preprocessing_recipe)
  train_data <- bake(preprocessor, clean_train_data)
  test_data <- bake(preprocessor, actual_data)

  return(list(train_data = train_data, test_data = test_data))
}
