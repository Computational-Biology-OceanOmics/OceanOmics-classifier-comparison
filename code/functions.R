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

plot_blast_hits <- function(data) {
  data |> 
    mutate(species = case_when ( species != 'dropped' ~ 'hit',
                                 species == 'dropped' ~ 'dropped')) |> 
    group_by(Query, Subject, species) |> 
    count(species) |> 
    ggplot(aes(x= Query, y = n, fill = species))
    
}