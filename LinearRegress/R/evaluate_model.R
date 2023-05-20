#' @title Evaluate Model Performance Using Mean Squared Error (MSE)
#'
#' @description This function calculates the Mean Squared Error (MSE) for the given predictions,
#' which is a measure of the model's performance. The MSE is the average of the squared
#' differences between the actual and predicted median values of the owner-occupied homes.
#'
#' @param predictions A named list with two elements: 'medv' containing the actual median values
#'                    and 'pred_medv' containing the predicted median values.
#'
#' @return A single numeric value representing the Mean Squared Error (MSE) of the predictions.
#'
#' @examples
#' boston_data <- load_boston_data("path")
#' preprocessed_data <- preprocess_boston_data(boston_data)
#' train_result <- train_linear_regression(preprocessed_data$train_data)
#' predictions <- make_predictions(preprocessed_data$test_data, train_result)
#' mse <- evaluate_model(predictions)
#' print(mse)
#' @export
evaluate_model <- function(predictions) {
  # Calculate the Mean Squared Error
  mse <- mean((predictions$medv - predictions$pred_medv)^2)

  # Return the Mean Squared Error
  return(mse)
}
