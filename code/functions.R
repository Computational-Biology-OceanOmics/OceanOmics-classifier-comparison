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

get_hits_data <- function(file) {
  read_tsv(file)
}

get_truth_data <- function(file) {
  df <- read_tsv(file, col_names = c('Query', 'Subject', 'OTU', 'taxids', 'lca_taxid', 'long_lineage', 'short_lineage')) |> 
    separate(short_lineage, into = c('domain', 'phylum', 'class', 'order', 'family', 'genus', 'species'), sep = ';')
  df[df == ''] <- 'dropped'
  df
}
  
subsample_blast_thirty_hits <- function(data) {
  data |> 
    filter(Subject %in% c('16S_v04_final.fasta_Taxonomies.CountedFams.txt_thirty_subset_8.fasta', 
                          '12s_v010_final.fasta_Taxonomies.CountedFams.txt_thirty_subset_8.fasta')) |> 
    filter(Query %in% c('make_12s_16s_simulated_reads_5-BetterDatabaseARTSimulation_runEDNAFLOW_16S_Lulu_RESULTS_dada2_asv.fa', 
                        'make_12s_16s_simulated_reads_5-BetterDatabaseARTSimulation_runEDNAFLOW_12S_Lulu_RESULTS_dada2_asv.fa')) |> 
    filter( (Subject == '12s_v010_final.fasta_Taxonomies.CountedFams.txt_thirty_subset_8.fasta' & 
               Query == 'make_12s_16s_simulated_reads_5-BetterDatabaseARTSimulation_runEDNAFLOW_12S_Lulu_RESULTS_dada2_asv.fa') | 
              ( Subject == '16S_v04_final.fasta_Taxonomies.CountedFams.txt_thirty_subset_8.fasta' &
                  Query == 'make_12s_16s_simulated_reads_5-BetterDatabaseARTSimulation_runEDNAFLOW_16S_Lulu_RESULTS_dada2_asv.fa'))
  
}

subsample_nbc_hits <- function(data) {
  data |> 
    filter(Subject %in% c('16S_v04_final.fasta', '12s_v010_final.fasta')) |> 
    filter(Query %in% c('make_12s_16s_simulated_reads_5-BetterDatabaseARTSimulation_runEDNAFLOW_16S_Lulu_RESULTS_dada2_asv.fa',
                        'make_12s_16s_simulated_reads_5-BetterDatabaseARTSimulation_runEDNAFLOW_12S_Lulu_RESULTS_dada2_asv.fa')) |> 
    filter( (Subject == '12s_v010_final.fasta' &
               Query == 'make_12s_16s_simulated_reads_5-BetterDatabaseARTSimulation_runEDNAFLOW_12S_Lulu_RESULTS_dada2_asv.fa') |
              (Subject == '16S_v04_final.fasta' &
                 Query == 'make_12s_16s_simulated_reads_5-BetterDatabaseARTSimulation_runEDNAFLOW_16S_Lulu_RESULTS_dada2_asv.fa'))
}

subsample_nbc_hits_thirty <- function(data) {
  data |> 
    filter(Subject %in% c('16S_v04_final.fasta_Taxonomies.CountedFams.txt_thirty_subset_4.fasta',
                           '12s_v010_final.fasta_Taxonomies.CountedFams.txt_thirty_subset_4.fasta')) |> 
    filter(Query %in% c('make_12s_16s_simulated_reads_5-BetterDatabaseARTSimulation_runEDNAFLOW_16S_Lulu_RESULTS_dada2_asv.fa',
                        'make_12s_16s_simulated_reads_5-BetterDatabaseARTSimulation_runEDNAFLOW_12S_Lulu_RESULTS_dada2_asv.fa')) |> 
    filter( (Subject == '12s_v010_final.fasta_Taxonomies.CountedFams.txt_thirty_subset_4.fasta' &
               Query == 'make_12s_16s_simulated_reads_5-BetterDatabaseARTSimulation_runEDNAFLOW_12S_Lulu_RESULTS_dada2_asv.fa') |
              (Subject == '16S_v04_final.fasta_Taxonomies.CountedFams.txt_thirty_subset_4.fasta' &
                 Query == 'make_12s_16s_simulated_reads_5-BetterDatabaseARTSimulation_runEDNAFLOW_16S_Lulu_RESULTS_dada2_asv.fa')) 
}

subsample_blast_hits <- function(data) {
  data |> 
    filter(Subject %in% c('16S_v04_final.fasta', '12s_v010_final.fasta')) |> 
    filter(Query %in% c('make_12s_16s_simulated_reads_5-BetterDatabaseARTSimulation_runEDNAFLOW_16S_Lulu_RESULTS_dada2_asv.fa', 
                        'make_12s_16s_simulated_reads_5-BetterDatabaseARTSimulation_runEDNAFLOW_12S_Lulu_RESULTS_dada2_asv.fa')) |> 
    filter( (Subject == '12s_v010_final.fasta' & 
               Query == 'make_12s_16s_simulated_reads_5-BetterDatabaseARTSimulation_runEDNAFLOW_12S_Lulu_RESULTS_dada2_asv.fa') | 
              ( Subject == '16S_v04_final.fasta' &
                  Query == 'make_12s_16s_simulated_reads_5-BetterDatabaseARTSimulation_runEDNAFLOW_16S_Lulu_RESULTS_dada2_asv.fa'))
}


load_and_merge_all_results <- function(files) {
  # files is a named list
  
  #all_results_ecfccd47                  all_results_3794a5bc                  all_results_0df11726                  all_results_c18f63bd 
  #"data//1-BLAST_all_results.tsv.gz"  "data//2-mmseqs2_all_results.tsv.gz"   "data//3-Qiime2_all_results.tsv.gz" "data//4-metabuli_all_results.tsv.gz" 
  #all_results_213d2d72                  all_results_f4773b3e                  all_results_429da257                  all_results_0e9a9698 
  #"data//5-vsearch_all_results.tsv.gz"   "data//6-mothur_all_results.tsv.gz"   "data//7-kraken_all_results.tsv.gz"      "data//8-NBC_all_results.tsv.gz" 
  
  # load it all into one 
}