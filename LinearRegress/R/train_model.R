#' @title Train a linear regression model on the Boston Housing dataset
#'
#' @description This function trains a linear regression model using the training set of the Boston Housing dataset.
#'
#' @param preprocessed_data A list containing the preprocessed_train_data and preprocessed_test_data
#' @return A list with the trained linear regression model and the training data
#' @examples
#' boston_data <- load_boston_data("path")
#' preprocessed_data <- preprocess_boston_data(boston_data)
#' train_result <- train_linear_regression(preprocessed_data$train_data)
#' @export
train_linear_regression <- function(train_data) {
  # Train the linear regression model
  model <- lm(medv ~ ., data = train_data)

  # Return the trained model and the training data
  return(list(model = model, train_data = train_data))
}
