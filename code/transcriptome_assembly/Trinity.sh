#!/bin/bash -l
#SBATCH -A uppmax2022-2-5 -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 10:00:00
#SBATCH -J Trinity_cabo8003
#SBATCH --mail-type=ALL
#SBATCH --mail-user carl.bogstedt.8003@student.uu.se

#Modules
module load bioinfo-tools
module load trinity/2.4.0

#Command

Trinity --genome_guided_bam \
 /home/cabo8003/Project/GenomeAnalysis/analysis/transcriptome_assembly/samtools_preprocessing_trinity/sorted_merged_STAR_output.bam \
 --max_memory 100G --genome_guided_max_intron 10000 --CPU 4 --output /home/cabo8003/Project/GenomeAnalysis/analysis/transcriptome_assembly/Trinity


