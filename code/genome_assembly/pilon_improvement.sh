#!/bin/bash -l
#SBATCH -A uppmax2022-2-5 -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 02:00:00
#SBATCH -J pilon_assembly_improvement_cabo8003
#SBATCH --mail-type=ALL
#SBATCH --mail-user carl.bogstedt.8003@student.uu.se

#Modules
module load bioinfo-tools
module load Pilon

#Commands
java -jar $PILON_HOME/pilon.jar --genome /home/cabo8003/Project/GenomeAnalysis/analysis/canu_genome_assembly/canu_pacbio_assembly_scaffold_06_220330.contigs.fasta --bam /home/cabo8003/Project/GenomeAnalysis/analysis/bwa_alignment/bwa_alignment_sorted.bam --output pilon_corrected_assembly_scaffold_06_220412 --outdir /home/cabo8003/Project/GenomeAnalysis/analysis/pilon_correction/ --threads 2 --diploid



