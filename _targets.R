library(targets)
source('code/functions.R')
tar_option_set(packages = c('tidyverse', 'ggdendro'))
list(
  tar_target(classifier_distances, 'data/distances.csv', format='file'), # designate the file
  tar_target(classifier_data, get_classifier_data(classifier_distances)), # load the file
  tar_target(dendrogram, plot_dendrogram(classifier_data)), # make the plot
  tar_target(saved, save_plot(dendrogram) ) # save the figure
)