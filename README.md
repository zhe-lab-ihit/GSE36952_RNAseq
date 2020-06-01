# Transcriptome wide analysis of classically and alternatively activated macrophages

## Summary

The goal of this analyis is to perform differential gene analysis between human M1- and M2-like macrophages. This will allow to identify M1 and M2 gene signatures for GSEA.

## Analysis

1. Raw fastq files have been downloaded from [GEO](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE36952) by running bash [script](scripts/bin/fastdump.sh). Metada has been retrieved by running R [script](scripts/bin/importGEOdata.R). Raw files were stored in /home/michal/data/GEO/GSE36952.
2. RNA-seq [nf-core](https://github.com/nf-core/rnaseq) data analysis pipeline incuding QC analysis, trimming, mapping to the genome (GRCh37) and generating gene count table was run using following bash [script](scripts/bin/nextflow.sh). Nextlow output was saved to /home/michal/data/nextflow/GSE3695.
3. Following [R script](x) was used to retrieve gene counts and generate summarized experiment object.
4. The report containing differential gene analysis was prepared in [R markdown](x). M1/M2 gene sets were saved to [csv file]().

