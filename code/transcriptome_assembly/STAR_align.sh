#!/bin/bash -l
#SBATCH -A uppmax2022-2-5 -M snowy
#SBATCH -p core
#SBATCH -n 8
#SBATCH -t 01:00:00
#SBATCH -J STAR_aligning_cabo8003
#SBATCH --mail-type=ALL
#SBATCH --mail-user carl.bogstedt.8003@student.uu.se

#Modules
module load bioinfo-tools
module load gcc/6.2.0
module load star/2.5.2b

#Paths
data_path=/home/cabo8003/Project/GenomeAnalysis/raw_data/transcriptome_rna/trimmed_STAR_data

#Commands
STAR \
	--runThreadN 8 \
	--genomeDir /home/cabo8003/Project/GenomeAnalysis/analysis/transcriptome_assembly/genome_indices \
	--outFileNamePrefix /home/cabo8003/Project/GenomeAnalysis/analysis/transcriptome_assembly/STAR_align/STAR_output_SRR6040095_scaffold_06 \
	--readFilesCommand gunzip -c \
	--readFilesIn $data_path/output_forward_paired_SRR6040095_scaffold_06.1.fastq.gz,$data_path/output_reverse_paired_SRR6040095_scaffold_06.2.fastq.gz 

STAR \
        --runThreadN 8 \
        --genomeDir /home/cabo8003/Project/GenomeAnalysis/analysis/transcriptome_assembly/genome_indices \
        --outFileNamePrefix /home/cabo8003/Project/GenomeAnalysis/analysis/transcriptome_assembly/STAR_align/STAR_output_SRR6040092_scaffold_06 \
        --readFilesCommand gunzip -c \
        --readFilesIn $data_path/SRR6040092_scaffold_06.1.fastq.gz,$data_path/SRR6040092_scaffold_06.2.fastq.gz 

STAR \
        --runThreadN 8 \
        --genomeDir /home/cabo8003/Project/GenomeAnalysis/analysis/transcriptome_assembly/genome_indices \
        --outFileNamePrefix /home/cabo8003/Project/GenomeAnalysis/analysis/transcriptome_assembly/STAR_align/STAR_output_SRR6040093_scaffold_06 \
        --readFilesCommand gunzip -c \
        --readFilesIn $data_path/SRR6040093_scaffold_06.1.fastq.gz,$data_path/SRR6040093_scaffold_06.2.fastq.gz

STAR \
        --runThreadN 8 \
        --genomeDir /home/cabo8003/Project/GenomeAnalysis/analysis/transcriptome_assembly/genome_indices \
        --outFileNamePrefix /home/cabo8003/Project/GenomeAnalysis/analysis/transcriptome_assembly/STAR_align/STAR_output_SRR6040094_scaffold_06 \
        --readFilesCommand gunzip -c \
        --readFilesIn $data_path/SRR6040094_scaffold_06.1.fastq.gz,$data_path/SRR6040094_scaffold_06.2.fastq.gz 

STAR \
        --runThreadN 8 \
        --genomeDir /home/cabo8003/Project/GenomeAnalysis/analysis/transcriptome_assembly/genome_indices \
        --outFileNamePrefix /home/cabo8003/Project/GenomeAnalysis/analysis/transcriptome_assembly/STAR_align/STAR_output_SRR6040096_scaffold_06 \
        --readFilesCommand gunzip -c \
        --readFilesIn $data_path/SRR6040096_scaffold_06.1.fastq.gz,$data_path/SRR6040096_scaffold_06.2.fastq.gz 

STAR \
        --runThreadN 8 \
        --genomeDir /home/cabo8003/Project/GenomeAnalysis/analysis/transcriptome_assembly/genome_indices \
        --outFileNamePrefix /home/cabo8003/Project/GenomeAnalysis/analysis/transcriptome_assembly/STAR_align/STAR_output_SRR6040097_scaffold_06 \
        --readFilesCommand gunzip -c \
        --readFilesIn $data_path/SRR6040097_scaffold_06.1.fastq.gz,$data_path/SRR6040097_scaffold_06.2.fastq.gz 

STAR \
        --runThreadN 8 \
        --genomeDir /home/cabo8003/Project/GenomeAnalysis/analysis/transcriptome_assembly/genome_indices \
        --outFileNamePrefix /home/cabo8003/Project/GenomeAnalysis/analysis/transcriptome_assembly/STAR_align/STAR_output_SRR6156066_scaffold_06 \
        --readFilesCommand gunzip -c \
        --readFilesIn $data_path/SRR6156066_scaffold_06.1.fastq.gz,$data_path/SRR6156066_scaffold_06.2.fastq.gz 

STAR \
        --runThreadN 8 \
        --genomeDir /home/cabo8003/Project/GenomeAnalysis/analysis/transcriptome_assembly/genome_indices \
        --outFileNamePrefix /home/cabo8003/Project/GenomeAnalysis/analysis/transcriptome_assembly/STAR_align/STAR_output_SRR6156067_scaffold_06 \
        --readFilesCommand gunzip -c \
        --readFilesIn $data_path/SRR6156067_scaffold_06.1.fastq.gz,$data_path/SRR6156067_scaffold_06.2.fastq.gz 

STAR \
        --runThreadN 8 \
        --genomeDir /home/cabo8003/Project/GenomeAnalysis/analysis/transcriptome_assembly/genome_indices \
        --outFileNamePrefix /home/cabo8003/Project/GenomeAnalysis/analysis/transcriptome_assembly/STAR_align/STAR_output_SRR6156069_scaffold_06 \
        --readFilesCommand gunzip -c \
        --readFilesIn $data_path/SRR6156069_scaffold_06.1.fastq.gz,$data_path/SRR6156069_scaffold_06.2.fastq.gz 




