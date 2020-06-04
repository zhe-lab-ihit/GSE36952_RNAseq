#### LIBS ####
suppressPackageStartupMessages(library("futile.logger"))
suppressPackageStartupMessages(library("dplyr"))
suppressPackageStartupMessages(library("SummarizedExperiment"))


#### MAIN ####
flog.threshold(DEBUG)

flog.debug("get counts directory and metadata")

pheno <- readRDS("scripts/data/pheno.RDS")
nextflow_outdir <- "/home/michal/data/nextflow/GSE3695"

counts <- read.table(file.path(nextflow_outdir, "featureCounts", "merged_gene_counts.txt"), header = TRUE)

sra_table <- read.table("scripts/data/SRA_table.txt", header = TRUE, sep = "\t")

flog.debug("clean meta data and counts")

meta <- dplyr::inner_join(pheno, sra_table, by = c("geo_accession"="Sample_Name"))[,c(1,2,8,9,52,53,54)]
rownames(meta) <- meta$title
meta$group <- c(rep("M1", 3), rep("M2", 3))

colnames(counts) <- c("Geneid", "gene_name", "M2_3", "M2_2", "M1_2", "M2_1", "M1_1", "M1_3")
counts <- counts[,c(1,2,7,5,8,6,4,3)]
write.csv(counts, file = "scripts/data/featureCounts.csv")

flog.debug("store as summarized experiment")

rowData <- data.frame(gene_name = counts$gene_name, row.names = counts$Geneid)
rownames(counts) <- counts$Geneid
counts[,c(1,2)] <- NULL

se <- SummarizedExperiment(assays=list(counts=as.matrix(counts)),
                     rowData=rowData, colData=meta)
saveRDS(se, "scripts/data/se.RDS")
