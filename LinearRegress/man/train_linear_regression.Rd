% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/train_model.R
\name{train_linear_regression}
\alias{train_linear_regression}
\title{Train a linear regression model on the Boston Housing dataset}
\usage{
train_linear_regression(train_data)
}
\arguments{
\item{preprocessed_data}{A list containing the preprocessed_train_data and preprocessed_test_data}
}
\value{
A list with the trained linear regression model and the training data
}
\description{
This function trains a linear regression model using the training set of the Boston Housing dataset.
}
\examples{
boston_data <- load_boston_data("path")
preprocessed_data <- preprocess_boston_data(boston_data)
train_result <- train_linear_regression(preprocessed_data$train_data)
}
