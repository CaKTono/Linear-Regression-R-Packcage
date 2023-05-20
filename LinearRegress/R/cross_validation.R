#' @title Perform k-Fold Cross-Validation on the Linear Regression Model
#'
#' @description This function performs k-Fold cross-validation on the linear regression model using
#' the provided training data. It calculates the Mean Squared Error (MSE) for each fold
#' and returns the average MSE across all folds.
#'
#' @param train_data A data.frame containing the preprocessed training set of the Boston Housing dataset
#' @param k An integer representing the number of folds for cross-validation
#'
#' @return A single numeric value representing the average Mean Squared Error (MSE) across all folds.
#'
#' @examples
#' boston_data <- load_boston_data("path")
#' preprocessed_data <- preprocess_boston_data(boston_data)
#' avg_mse <- cross_validate(preprocessed_data$train_data, 5)
#' print(avg_mse)
#' @export
cross_validate <- function(train_data, k) {
  # Create k-Fold cross-validation partitions
  control <- trainControl(method = "cv", number = k, savePredictions = TRUE)
  cv_results <- train(medv ~ ., data = train_data, method = "lm", trControl = control)

  # Calculate the Mean Squared Error for each fold
  mse_values <- cv_results$resample %>%
    dplyr::pull(RMSE) %>%
    (function(x) x^2)()

  # Calculate and return the average MSE across all folds
  avg_mse <- mean(mse_values)
  return(avg_mse)
}
