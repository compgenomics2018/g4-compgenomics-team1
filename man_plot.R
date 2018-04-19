library(qqman)

args <- commandArgs()
input <- args[6]
data <- read.table(input, header = TRUE)

print(data)

manhattan(data)
