library(targets)
library(tarchetypes)
source('code/functions.R')

tar_option_set(packages = c('tidyverse', 'ggdendro', 'ggvenn'))

list(
  # phylogeny of classifiers
  tar_target(classifier_distances, 'data/distances.csv', format='file'), # designate the file
  tar_target(classifier_data, get_classifier_data(classifier_distances)), # load the file
  tar_target(dendrogram, plot_dendrogram(classifier_data)), # make the plot
  tar_target(saved, save_plot(dendrogram)), # save the figure
  tar_render(report, 'code/report.Rmd'),
  # plotting ASVs per dataset
  tar_render(plot_asvs_per_dataset, 'code/asvs_per_data.Rmd'),
  # plotting classifier species hits
  tar_target(blast_hits, '/home/pbayer/Data/runClassifiers/1-BLAST/all_results.tsv', format='file'),
  tar_target(blast_hits_data, get_hits_data(blast_hits)),
  tar_target(subsambled_blast_hits_data, subsample_blast_hits(blast_hits_data)),
  tar_target(kraken_hits, '/home/pbayer/Data/runClassifiers/7-kraken/combined.tsv', format = 'file'),
  tar_target(kraken_hits_data, get_hits_data(kraken_hits)),
  tar_target(subsambled_kraken_hits_data, subsample_blast_hits(kraken_hits_data)),
  tar_target(plot_report, 'code/kraken_blast_plots.Rmd')

)