#!/bin/bash -l
#SBATCH -A uppmax2022-2-5 -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 03:00:00
#SBATCH -J HTSeq_count_cabo8003
#SBATCH --mail-type=ALL
#SBATCH --mail-user carl.bogstedt.8003@student.uu.se

#Modules
module load bioinfo-tools
module load htseq

#Path
filepath=/home/cabo8003/Project/GenomeAnalysis/analysis/differential_expression/samtools_preprocessing_HTSeq
outputpath=/home/cabo8003/Project/GenomeAnalysis/analysis/differential_expression/HTSeq_count
annotpath=/home/cabo8003/Project/GenomeAnalysis/analysis/annotation/braker/durio_zibethinus1

for file in $filepath/*.bam
do
	base_file_name=$(basename "$file" .bam)
	htseq-count -o $outputpath/htseq_output_$base_file_name.sam -f bam -t CDS -r pos $file $annotpath/augustus.hints.gtf > htseq_count_$base_file_name.txt 
done


