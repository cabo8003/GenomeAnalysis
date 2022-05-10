#Install packages
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install("DESeq2")

browseVignettes("DESeq2")
install.packages("tidyverse")
install.packages('pheatmap')

#Load libraries
library(DESeq2)
library(tidyverse)
library(gplots)
library(RColorBrewer)
library(genefilter)

#Read HTseq-count files
SRR6040094_counts <- read.delim("htseq_count_sorted_STAR_output_SRR6040094_scaffold_06.txt", header = FALSE)
SRR6040095_counts <- read.delim("htseq_count_sorted_STAR_output_SRR6040095_scaffold_06.txt", header = FALSE)
SRR6040097_counts <- read.delim("htseq_count_sorted_STAR_output_SRR6040097_scaffold_06.txt", header = FALSE)

SRR6156066_counts <- read.delim("htseq_count_sorted_STAR_output_SRR6156066_scaffold_06.txt", header = FALSE)
SRR6156067_counts <- read.delim("htseq_count_sorted_STAR_output_SRR6156067_scaffold_06.txt", header = FALSE)
SRR6156069_counts <- read.delim("htseq_count_sorted_STAR_output_SRR6156069_scaffold_06.txt", header = FALSE)

#Name columns. MSK = Musang King, MT = Monthong
names(SRR6040094_counts)[2]<- "MSK_2"
names(SRR6040095_counts)[2]<- "MSK_1"
names(SRR6040097_counts)[2]<- "MSK_3"

names(SRR6156066_counts)[2] <- "MT_2"
names(SRR6156067_counts)[2] <- "MT_3"
names(SRR6156069_counts)[2] <- "MT_1"

#Merge data
data_counts <- merge(SRR6040094_counts, SRR6040095_counts, by = "V1")
data_counts <- merge(data_counts, SRR6040097_counts, by = "V1")
data_counts <- merge(data_counts, SRR6156066_counts, by = "V1")
data_counts <- merge(data_counts, SRR6156067_counts, by = "V1")
data_counts <- merge(data_counts, SRR6156069_counts, by = "V1")

#Name column
names(data_counts)[1] <- "gene"

#Remove unecessary information (first 5 rows)
data_counts <- data_counts[-c(1:5),]

#Creating dataframes (as per "Deseq2 manual" instructions)
condition <- c("Musang_King", "Musang_King", "Musang_King", "Monthong", "Monthong", "Monthong")
names <- data_counts[,-1]
col_data <- data.frame(row.names=colnames(names), condition)
data_counts <- data.frame(row.names=data_counts[,1], MSK_2=data_counts[2], 
                          MSK_1=data_counts[3], MSK_3=data_counts[4], 
                          MT_2=data_counts[5], MT_3=data_counts[6], 
                          MT_1=data_counts[7] )

#Deseq2
ddsFullCountTable <- DESeqDataSetFromMatrix(
  countData = data_counts,
  colData = col_data,
  design = ~ condition)

dds <- DESeq(ddsFullCountTable)

#Principal component analysis
rl_dds <- rlog(dds) #Transform data (regularized-logarithm transformation) as per Deseq2 instructions
plotPCA(rl_dds,intgroup=c("condition", "sizeFactor"))

#Heatmap
topVarGenes <- head(order(rowVars(assay(rl_dds)), decreasing = TRUE), 10)

heatmap.2( assay(rl_dds)[topVarGenes, ], scale = "row",
           trace="none", dendrogram="column",
           col = colorRampPalette(rev(brewer.pal(9, "RdBu")))(255), margins = c(6,10))
