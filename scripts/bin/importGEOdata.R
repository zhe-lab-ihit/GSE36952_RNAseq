#### LIBS ####
suppressPackageStartupMessages(library("futile.logger"))
suppressPackageStartupMessages(library("GEOquery"))
suppressPackageStartupMessages(library("dplyr"))
suppressPackageStartupMessages(library("stringr"))

#### MAIN ####
flog.threshold(DEBUG)

flog.debug("parsing metadata from GEO database")
myGEO <- "GSE36952"
destdir <- "/home/michal/data/GEO/GSE36952"
gds <- getGEO(myGEO, destdir = destdir)

flog.debug("getting metadata")
pdata <- lapply(gds, phenoData)
pdata <- lapply(pdata, pData)
pheno <- do.call(rbind, pdata)

flog.debug("download supplementary files")

# lapply(
#   pheno$geo_accession,
#   getGEOSuppFiles,
#   makeDirectory = FALSE,
#   baseDir = destdir
# )

