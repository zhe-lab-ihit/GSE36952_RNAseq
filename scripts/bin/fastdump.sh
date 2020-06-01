#!/bin/bash
screen
fastq-dump --split-files $(</home/michal/git/GSE36952_RNAseq/scripts/data/SRP012015.txt)