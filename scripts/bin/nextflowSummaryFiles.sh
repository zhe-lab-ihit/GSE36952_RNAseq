#!/bin/bash

nextflow_outdir="/home/michal/data/nextflow/GSE3695"
repo_data="/home/michal/git/GSE36952_RNAseq/scripts/data"

cp $nextflow_outdir/MultiQC/*.html $repo_data
cp $nextflow_outdir/pipeline_info/*.html $repo_data
