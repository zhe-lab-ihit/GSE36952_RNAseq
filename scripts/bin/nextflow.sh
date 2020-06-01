#!/bin/bash
nextflow run nf-core/rnaseq --reads '/home/michal/data/GEO/GSE36952/*_{1,2}.fastq.gz' \
--genome GRCh37 \
-profile docker \
--max_memory '40.GB' \
--max_cpus 2 \
--pseudo aligner salmon \
--outdir /home/michal/data/nextflow/GSE3695 \
--email mpawlak@get2omics.com \
--star_index '/home/michal/data/genomes/GRCh37' \
--fasta '/home/michal/data/genomes/GRCh37/genome.fa' \
--gtf '/home/michal/data/genomes/GRCh37/genes.gtf' \
-name GSE36952_v5 \
-resume GSE36952_v4
