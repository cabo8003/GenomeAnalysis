#!/bin/bash -l
#SBATCH -A uppmax2022-2-5 -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 08:00:00
#SBATCH -J Braker_annotation_cabo8003
#SBATCH --mail-type=ALL
#SBATCH --mail-user carl.bogstedt.8003@student.uu.se

#Modules
module load bioinfo-tools
module load braker/2.1.1_Perl5.24.1
module load augustus/3.2.3_Perl5.24.1
module load bamtools/2.5.1
module load blast/2.9.0+
module load GenomeThreader/1.7.0
module load samtools/1.8
module load GeneMark/4.33-es_Perl5.24.1

#Paths
bampath=/home/cabo8003/Project/GenomeAnalysis/analysis/transcriptome_assembly/samtools_preprocessing_trinity
genpath=/home/cabo8003/Project/GenomeAnalysis/analysis/genome_assembly/pilon_correction

#Command
braker.pl --species=durio_zibethinus1 --genome=$genpath/pilon_corrected_assembly_scaffold_06_220412.fasta.masked \
	--bam=$bampath/STAR_output_SRR6040092_scaffold_06.bam,$bampath/STAR_output_SRR6040093_scaffold_06.bam,\
	$bampath/STAR_output_SRR6040094_scaffold_06.bam,$bampath/STAR_output_SRR6040095_scaffold_06.bam,\
	$bampath/STAR_output_SRR6040096_scaffold_06.bam,$bampath/STAR_output_SRR6040097_scaffold_06.bam,\
	$bampath/STAR_output_SRR6156066_scaffold_06.bam,$bampath/STAR_output_SRR6156067_scaffold_06.bam,\
	$bampath/STAR_output_SRR6156069_scaffold_06.bam --cores=4 --softmasking \
	--AUGUSTUS_CONFIG_PATH=/home/cabo8003/Project/GenomeAnalysis/code/annotation/augustus_config \
	--AUGUSTUS_BIN_PATH=/sw/bioinfo/augustus/3.4.0/snowy/bin \
	--AUGUSTUS_SCRIPTS_PATH=/sw/bioinfo/augustus/3.4.0/snowy/scripts \
	--GENEMARK_PATH=/sw/bioinfo/GeneMark/4.33-es/snowy 

