#!/bin/bash -l
#SBATCH -A uppmax2022-2-5 -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 02:00:00
#SBATCH -J bwa_alignment_cabo8003
#SBATCH --mail-type=ALL
#SBATCH --mail-user carl.bogstedt.8003@student.uu.se

#Modules
module load bioinfo-tools
module load bwa

#Paths
gen_asse_path=/home/cabo8003/Project/GenomeAnalysis/analysis/canu_genome_assembly
raw_dat_path=/home/cabo8003/Project/GenomeAnalysis/raw_data/illumina_dna

#Alignment
bwa mem $gen_asse_path/canu_pacbio_assembly_scaffold_06_220330.contigs.fasta $raw_dat_path/SRR6058604_scaffold_06.1P.fastq.gz $raw_dat_path/SRR6058604_scaffold_06.2P.fastq.gz > /home/cabo8003/Project/GenomeAnalysis/analysis/bwa_alignment/bwa_alignment.sam



