#' @title Boxplot of Residuals
#'
#' @description This function creates a boxplot displaying the distribution of residuals.
#'
#' @param residuals A numeric vector of residuals (difference between actual and predicted values)
#'
#' @examples
#' boston_data <- load_boston_data("path")
#' preprocessed_data <- preprocess_boston_data(boston_data)
#' actual_values <- preprocessed_data$test_data$medv
#' predicted_values <- predictions$pred_medv
#' residuals <- actual_values - predicted_values
#' boxplot_residuals(residuals)
#' @export
boxplot_residuals <- function(residuals) {
  boxplot(residuals, xlab = "Residuals", main = "Boxplot: Distribution of Residuals")
}
