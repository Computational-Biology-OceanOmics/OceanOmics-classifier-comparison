get_classifier_data <- function(file) {
  read.csv(file, sep='\t', row.names=1)
}

plot_dendrogram <- function(data) {
  data |> 
    dist() |> 
    hclust(method = 'ward.D2') |> 
    ggdendrogram(rotate = TRUE, theme_dendro = TRUE, labels = TRUE)
}

save_plot <- function(plot) {
  ggsave(filename = 'figures/classifier_dendrogram.png',
          plot = plot, dpi = 300)
}