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
  
subsample_nbc_hits <- function(data) {
  data |> 
    filter(Database %in% c('16S_v04_final.fasta_classifier.joblib', '12s_v010_final.fasta_classifier.joblib')) |> 
    filter(Query %in% c('../make_12s_16s_simulated_reads_5-BetterDatabaseARTSimulation_runEDNAFLOW_16S_Lulu_RESULTS_dada2_asv.fa',
                        '../make_12s_16s_simulated_reads_5-BetterDatabaseARTSimulation_runEDNAFLOW_12S_Lulu_RESULTS_dada2_asv.fa')) |> 
    filter( (Database == '12s_v010_final.fasta_classifier.joblib' &
               Query == '../make_12s_16s_simulated_reads_5-BetterDatabaseARTSimulation_runEDNAFLOW_12S_Lulu_RESULTS_dada2_asv.fa') |
              (Database == '16S_v04_final.fasta_classifier.joblib' &
                 Query == '../make_12s_16s_simulated_reads_5-BetterDatabaseARTSimulation_runEDNAFLOW_16S_Lulu_RESULTS_dada2_asv.fa')) |> 
    mutate(Query = str_replace_all(Query, '../', '')) |> 
    mutate(Database = str_replace_all(Database, '_classifier.joblib', '')) |> 
    rename(Subject = Database) |> 
    rename(OTU = ASV) |> 
    rename(species = Species)
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
