#!/bin/bash -l
#SBATCH -A uppmax2022-2-5 -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 24:00:00
#SBATCH -J canu_genome_assembly_cabo8003
#SBATCH --mail-type=ALL
#SBATCH --mail-user carl.bogstedt.8003@student.uu.se

#Modules
module load bioinfo-tools
module load canu

#Command
canu \
 -p canu_pacbio_assembly_scaffold_06_220330 -d /home/cabo8003/Project/GenomeAnalysis/analysis/canu_genome_assembly \
 genomeSize=26.5m \
 corThreads=4 useGrid=False \
 -pacbio-raw /home/cabo8003/Project/GenomeAnalysis/raw_data/pacbio_dna/SRR6037732_scaffold_06.fq.gz
