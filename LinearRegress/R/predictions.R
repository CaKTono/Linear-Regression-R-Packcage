#' @title Make predictions using the trained linear regression model
#'
#' @description This function makes predictions using the trained linear regression model and the testing set of the Boston Housing dataset.
#'
#' @param test_data A data.frame containing the testing set of the preprocessed Boston Housing dataset
#' @param model A list with the trained linear regression model and the training data
#' @return A data.frame with the predicted values and actual values
#' @examples
#' boston_data <- load_boston_data("path")
#' preprocessed_data <- preprocess_boston_data(boston_data)
#' train_result <- train_linear_regression(preprocessed_data$train_data)
#' predictions <- make_predictions(preprocessed_data$test_data, train_result)
#' @export
make_predictions <- function(test_data, model) {
  # Make predictions using the trained model
  predictions <- test_data %>%
    modelr::add_predictions(model$model, var = "pred_medv")

  # Return the data.frame with the predicted values and actual values
  return(predictions)
}
