wg.args <- commandArgs(trailingOnly = TRUE)

nPOP <- wg.args[1]

set.seed(666)

wg.table <- read.table(file="tmp/valid_samples.list", header=F, sep="\t", stringsAsFactors=F)

POP <- unique(wg.table$V6)

wg.table <- sort(wg.table[sample(nrow(wg.table), nPOP), 9])

write.table(wg.table, file=paste0("tmp/",POP,"_samples.rdm"), append=F, sep="\t", row.names=F, col.name=F)
