#!/bin/bash -l
#SBATCH -A uppmax2022-2-5 -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 01:00:00
#SBATCH -J samtools_index_cabo8003
#SBATCH --mail-type=ALL
#SBATCH --mail-user carl.bogstedt.8003@student.uu.se

#Modules
module load bioinfo-tools
module load samtools

#Path
bampath=/home/cabo8003/Project/GenomeAnalysis/analysis/differential_expression/samtools_preprocessing_HTSeq

#samtools sort
for file in $bampath/*
do
        samtools index $file 
done


