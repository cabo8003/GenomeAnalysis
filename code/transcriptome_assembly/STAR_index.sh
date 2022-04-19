#!/bin/bash -l
#SBATCH -A uppmax2022-2-5 -M snowy
#SBATCH -p core
#SBATCH -n 8
#SBATCH -t 01:00:00
#SBATCH -J STAR_indexing_cabo8003
#SBATCH --mail-type=ALL
#SBATCH --mail-user carl.bogstedt.8003@student.uu.se

#Modules
module load bioinfo-tools
module load gcc/6.2.0 
module load star/2.5.2b

#Commands
STAR --runThreadN 8 \
 --runMode genomeGenerate \
 --genomeDir /home/cabo8003/Project/GenomeAnalysis/analysis/transcriptome_assembly/genome_indices/ \
 --genomeFastaFiles /home/cabo8003/Project/GenomeAnalysis/analysis/genome_assembly/pilon_correction/pilon_corrected_assembly_scaffold_06_220412.fasta



