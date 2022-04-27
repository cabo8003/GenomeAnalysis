#!/bin/bash -l
#SBATCH -A uppmax2022-2-5 -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 0:30:00
#SBATCH -J samtools_merge_cabo8003
#SBATCH --mail-type=ALL
#SBATCH --mail-user carl.bogstedt.8003@student.uu.se

#Modules
module load bioinfo-tools
module load samtools

#Path
bampath=/home/cabo8003/Project/GenomeAnalysis/analysis/transcriptome_assembly/samtools_preprocessing_trinity

#samtools merge

samtools merge $bampath/merged_STAR_output.bam $bampath/STAR_output_SRR6040092_scaffold_06.bam $bampath/STAR_output_SRR6040093_scaffold_06.bam $bampath/STAR_output_SRR6040094_scaffold_06.bam $bampath/STAR_output_SRR6040095_scaffold_06.bam $bampath/STAR_output_SRR6040096_scaffold_06.bam $bampath/STAR_output_SRR6040097_scaffold_06.bam $bampath/STAR_output_SRR6156066_scaffold_06.bam $bampath/STAR_output_SRR6156067_scaffold_06.bam $bampath/STAR_output_SRR6156069_scaffold_06.bam

