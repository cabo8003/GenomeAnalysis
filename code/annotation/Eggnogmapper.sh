#!/bin/bash -l
#SBATCH -A uppmax2022-2-5 -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 08:00:00
#SBATCH -J Eggnog_mapper_annotation_cabo8003
#SBATCH --mail-type=ALL
#SBATCH --mail-user carl.bogstedt.8003@student.uu.se

#Modules
module load bioinfo-tools
module load eggNOG-mapper

#Path
genpath=/home/cabo8003/Project/GenomeAnalysis/analysis/genome_assembly/pilon_correction 
outpath=/home/cabo8003/Project/GenomeAnalysis/analysis/annotation

#Command
emapper.py -i $genpath/pilon_corrected_assembly_scaffold_06_220412.fasta -o $outpath/eggnog_mapper -m diamond --itype genome --cpu 4

