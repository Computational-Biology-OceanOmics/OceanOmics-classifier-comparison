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
