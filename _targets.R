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
  # plot classifier complexity
  tar_render(classifier_complexity, 'code/classifier_complexity.Rmd'),
  # plotting ASVs per dataset
  tar_render(plot_asvs_per_dataset, 'code/asvs_per_data.Rmd'),
  # plotting classifier species hits - all of this stuff is for the internal presentation,
  # and to get a feel for the data
  tar_target(blast_hits, 'data/1-BLAST_all_results.tsv.gz', format='file'),
  tar_target(blast_hits_data, get_hits_data(blast_hits)),
  tar_target(subsambled_blast_hits_data, subsample_blast_hits(blast_hits_data)),
  tar_target(thirty_subsambled_blast_hits_data, subsample_blast_thirty_hits(blast_hits_data)),
  tar_target(kraken_hits, 'data/7-kraken_all_results.tsv.gz', format = 'file'),
  tar_target(kraken_hits_data, get_hits_data(kraken_hits)),
  tar_target(subsambled_kraken_hits_data, subsample_blast_hits(kraken_hits_data)),
  tar_target(thirty_subsampled_kraken_hits_data, subsample_blast_thirty_hits(kraken_hits_data)),
  tar_target(plot_report, 'code/kraken_blast_plots.Rmd'),
  tar_target(nbc_hits, 'data/8-NBC_all_results.tsv.gz', format='file'),
  tar_target(nbc_hits_data, get_hits_data(nbc_hits)),
  tar_target(subsampled_nbc_hits_data, subsample_nbc_hits(nbc_hits_data)),
  tar_target(thirty_subsampled_nbc_hits_data, subsample_nbc_hits_thirty(nbc_hits_data)),
  tar_render(investigate_nbc, 'code/investigate_nbc.Rmd'),
  # truth set
  tar_target(truth_set, '/home/pbayer/Data/make_12s_16s_simulated_reads/9-assignSpeciesToASVs/truthsets_with_lineages.tsv', format='file'),
  tar_target(truth_set_data, get_truth_data(truth_set)),
  tar_render(truth_set_investigation, 'code/truth_set_check.Rmd'),
  # time to merge all results
  tar_files(all_results, 'data/' |> list.files(full.names = TRUE, pattern = 'tsv.gz$')),
  tar_target(merged_all_results, load_and_merge_all_results(all_results))
)
