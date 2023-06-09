% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/preprocess_data.R
\name{preprocess_boston_data}
\alias{preprocess_boston_data}
\title{Preprocess the Boston Housing dataset}
\usage{
preprocess_boston_data(data)
}
\arguments{
\item{data}{A list containing the training and testing datasets}
}
\value{
A list containing the preprocessed training and testing datasets
}
\description{
This function preprocesses the Boston Housing dataset by removing rows with missing values, removing the 'ID' column,
centering, and scaling the predictor variables.
}
\examples{
boston_data <- load_boston_data("path/to/package")
preprocessed_data <- preprocess_boston_data(boston_data)
}
