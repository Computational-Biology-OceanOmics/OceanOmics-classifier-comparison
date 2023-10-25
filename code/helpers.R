precision <- function(TP, FP) {
  TP / (TP + FP )
}
recall <- function(TP, FN) {
  TP / (TP + FN)
}
f1 <- function(precision, recall) {
  2*precision * recall / (precision + recall)
}
f0.5 <- function(precision, recall) {
  ((1 + 0.5^2) * precision * recall) / (0.5^2 * precision + recall)
}
accuracy <- function(TP, FP, FN, TN) {
  (TN + TP) / (TN + TP + FP + FN)
}

my_save_plot <- function(plot, name) {
  ggsave(filename = paste0('results/figures/', name),
         plot = plot, dpi = 300, width = 10, height = (9/16)*10 )
}

my_save_table <- function(table, name) {
  writexl::write_xlsx(table, path = paste0('results/tables/', name, '.xlsx'))
}
