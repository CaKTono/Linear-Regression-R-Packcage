#' @title Heatmap of Correlation between Features
#'
#' @description This function creates a heatmap displaying the correlation between features in the given dataset.
#'
#' @param dataset A dataframe containing the dataset with features
#'
#' @examples
#' boston_data <- load_boston_data("path")
#' preprocessed_data <- preprocess_boston_data(boston_data)
#' heatmap_correlation(preprocessed_data$train_data)
#' @export
heatmap_correlation <- function(dataset) {
  correlation_matrix <- cor(dataset)
  melted_correlation_matrix <- melt(correlation_matrix)
  ggplot(data = melted_correlation_matrix, aes(x = Var1, y = Var2, fill = value)) +
    geom_tile() +
    scale_fill_gradient2(low = "blue", high = "red", mid = "white", midpoint = 0, limit = c(-1, 1), space = "Lab", name = "Correlation") +
    theme_minimal() +
    theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1)) +
    coord_fixed() +
    ggtitle("Heatmap: Correlation between Features") +
    xlab("") +
    ylab("")
}
