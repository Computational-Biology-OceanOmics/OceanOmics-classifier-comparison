library(targets)
library(crew)
library(tarchetypes)
source('code/functions.R')

tar_option_set(
  controller = crew_controller_local(workers = 4)
)

tar_option_set(packages = c('tidyverse', 'ggdendro', 'ggvenn', 'tidyr'))

list(
  # phylogeny of classifiers
  tar_target(classifier_distances, 'data/distances.csv', format = 'file'),
  tar_target(classifier_data, get_classifier_data(classifier_distances)),
  tar_target(dendrogram, plot_dendrogram(classifier_data)),
  tar_target(saved, my_save_plot(dendrogram, 'classifier_dendrogram.png')),
  # plot classifier complexity
  tar_render(classifier_complexity, 'code/classifier_complexity.Rmd'),
  # plotting ASVs per dataset
  tar_render(plot_asvs_per_dataset, 'code/asvs_per_data.Rmd'),
  # plotting classifier species hits - all of this stuff is for the internal presentation,
  # and to get a feel for the data
  tar_target(blast_hits, 'data/1-BLAST_all_results.tsv.gz', format = 'file'),
  tar_target(blast_hits_data, get_hits_data(blast_hits)),
  tar_target(subsambled_blast_hits_data, subsample_blast_hits(blast_hits_data)),
  tar_target(thirty_subsambled_blast_hits_data, subsample_blast_thirty_hits(blast_hits_data)),
  tar_target(kraken_hits, 'data/7-Kraken_all_results.subsetConfidence.tsv.gz', format = 'file'),
  tar_target(kraken_hits_data, get_hits_data(kraken_hits)),
  tar_target(subsambled_kraken_hits_data, subsample_blast_hits(kraken_hits_data)),
  tar_target(thirty_subsampled_kraken_hits_data, subsample_blast_thirty_hits(kraken_hits_data)),
  tar_target(plot_report, 'code/kraken_blast_plots.Rmd'),
  tar_target(nbc_hits, 'data/8-NBC_all_results.tsv.gz', format = 'file'),
  tar_target(nbc_hits_data, get_hits_data(nbc_hits)),
  tar_target(subsampled_nbc_hits_data, subsample_nbc_hits(nbc_hits_data)),
  tar_target(thirty_subsampled_nbc_hits_data, subsample_nbc_hits_thirty(nbc_hits_data)),
  # truth set
  tar_target(truth_set, 'data/truth/truthsets_with_lineages.tsv.gz', format = 'file'),
  tar_target(truth_set_data, get_truth_data(truth_set)),
  tar_render(truth_set_investigation, 'code/truth_set_check.Rmd'),
  # time to merge all results
  tar_files_input(all_results, 'data/' |> list.files(full.names = TRUE, pattern = 'tsv.gz$')),
  tar_target(merged_all_results, get_hits_data(all_results)),
  # now finally, compare all data and truth sets
  tar_render(final_outcomes_100, 'code/100_species_final_checks.Rmd'),
  tar_render(final_outcomes_rottnest, 'code/rottnest_species_final_checks.Rmd'),
  tar_render(final_outcomes_negative_bacteria, 'code/negative_bacteria_final_checks.Rmd'),
  # make a table where we mean/median all F1s etc. across all query datasets,
  tar_target(correctness_table, assess_correctness(merged_all_results, truth_set_data)),
  tar_target(counted_correctness, count_correctness(correctness_table)),
  tar_target(save_correct_table, my_save_table(counted_correctness, 'Counted_correctness')),
  tar_target(median_f1_table, make_mean_median_f1_table(correctness_table)),
  tar_target(saved_median_f1_table, my_save_table(median_f1_table, 'Median_F1_table')),
  tar_target(correctness_figure, plot_correctness(counted_correctness)),
  tar_target(save_correct, my_save_plot(correctness_figure, 'correctness.png')),
  tar_target(big_species_table, make_big_table(correctness_table)),
  # count the kinds of errors
  tar_target(error_types_table, make_error_types_table(correctness_table)),
  tar_target(saved_error_types, my_save_table(error_types_table, 'Error_types_table')),
  tar_target(error_types_figure, make_error_types_figure(error_types_table)),
  tar_target(saved_errors, my_save_plot(error_types_figure, 'error_types.png'))
  
)
