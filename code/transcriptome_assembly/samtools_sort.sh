#!/bin/bash -l
#SBATCH -A uppmax2022-2-5 -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 0:30:00
#SBATCH -J samtools_sort_cabo8003
#SBATCH --mail-type=ALL
#SBATCH --mail-user carl.bogstedt.8003@student.uu.se

#Modules
module load bioinfo-tools
module load samtools

#Path
bampath=/home/cabo8003/Project/GenomeAnalysis/analysis/transcriptome_assembly/samtools_preprocessing_trinity

#samtools sort
samtools sort $bampath/merged_STAR_output.bam -o $bampath/sorted_merged_STAR_output.bam

