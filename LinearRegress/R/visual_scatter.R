#' @title Scatter plot of Actual vs. Predicted Values
#'
#' @description This function creates a scatter plot comparing actual and predicted values of the target variable.
#'
#' @param actual_values A numeric vector of actual target values
#' @param predicted_values A numeric vector of predicted target values
#'
#' @examples
#' boston_data <- load_boston_data("path")
#' preprocessed_data <- preprocess_boston_data(boston_data)
#' train_result <- train_linear_regression(preprocessed_data$train_data)
#' predictions <- make_predictions(preprocessed_data$test_data, train_result)
#' actual_values <- preprocessed_data$test_data$medv
#' predicted_values <- predictions$pred_medv
#' scatter_actual_vs_predicted(actual_values, predicted_values)
#' @export
scatter_actual_vs_predicted <- function(actual_values, predicted_values) {
  plot(actual_values, predicted_values, xlab = "Actual Values", ylab = "Predicted Values", main = "Scatter Plot: Actual vs. Predicted Values")
  abline(0, 1, col = "red") # Add a 45-degree line for reference
}
