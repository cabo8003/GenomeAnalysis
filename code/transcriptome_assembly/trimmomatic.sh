#!/bin/bash -l
#SBATCH -A uppmax2022-2-5 -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 01:00:00
#SBATCH -J trimmomatic_cabo8003
#SBATCH --mail-type=ALL
#SBATCH --mail-user carl.bogstedt.8003@student.uu.se

#Modules
module load bioinfo-tools
module load trimmomatic

#Commands 
java -jar /sw/apps/bioinfo/trimmomatic/0.36/rackham/trimmomatic-0.36.jar PE -threads 2 /home/cabo8003/Project/GenomeAnalysis/raw_data/transcriptome_rna/untrimmed/SRR6040095_scaffold_06.1.fastq.gz /home/cabo8003/Project/GenomeAnalysis/raw_data/transcriptome_rna/untrimmed/SRR6040095_scaffold_06.2.fastq.gz output_forward_paired_SRR6040095_scaffold_06.1.fastq.gz output_forward_unpaired_SRR6040095_scaffold_06.1.fastq.gz output_reverse_paired_SRR6040095_scaffold_06.2.fastq.gz output_reverse_unpaired_SRR6040095_scaffold_06.2.fasrq.gz LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36




