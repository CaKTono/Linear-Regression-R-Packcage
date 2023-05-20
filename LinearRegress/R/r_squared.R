#' @title Calculate the R-squared Value of a Linear Regression Model
#'
#' @description This function calculates and returns the R-squared value of a given linear regression model.
#'
#' @param model A linear regression model object created using lm()
#' @param test_data A dataframe containing the test dataset
#'
#' @return A single numeric value representing the R-squared value of the model
#'
#' @examples
#' boston_data <- load_boston_data("path")
#' preprocessed_data <- preprocess_boston_data(boston_data)
#' train_result <- train_linear_regression(preprocessed_data$train_data)
#' r_squared_value <- calculate_r_squared(train_result$model, preprocessed_data$test_data)
#' @export
calculate_r_squared <- function(model, test_data) {
  # Calculate the predicted values
  predictions <- predict(model, test_data)

  # Calculate the R-squared value
  actual_values <- test_data$medv
  r_squared <- 1 - (sum((actual_values - predictions)^2) / sum((actual_values - mean(actual_values))^2))

  return(r_squared)
}
