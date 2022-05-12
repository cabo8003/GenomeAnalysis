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
SRR6040092_counts <- read.delim("htseq_count_sorted_STAR_output_SRR6040092_scaffold_06.txt", header = FALSE)
SRR6040093_counts <- read.delim("htseq_count_sorted_STAR_output_SRR6040093_scaffold_06.txt", header = FALSE)
SRR6040096_counts <- read.delim("htseq_count_sorted_STAR_output_SRR6040096_scaffold_06.txt", header = FALSE)

SRR6040094_counts <- read.delim("htseq_count_sorted_STAR_output_SRR6040094_scaffold_06.txt", header = FALSE)
SRR6040095_counts <- read.delim("htseq_count_sorted_STAR_output_SRR6040095_scaffold_06.txt", header = FALSE)
SRR6040097_counts <- read.delim("htseq_count_sorted_STAR_output_SRR6040097_scaffold_06.txt", header = FALSE)


#Name columns. MSK = Musang King
names(SRR6040092_counts)[2]<- "leaf"
names(SRR6040093_counts)[2]<- "root"
names(SRR6040096_counts)[2]<- "stem"

names(SRR6040094_counts)[2]<- "aril_2"
names(SRR6040095_counts)[2]<- "aril_1"
names(SRR6040097_counts)[2]<- "aril_3"

#Merge data
data_counts <- merge(SRR6040092_counts, SRR6040093_counts, by = "V1")
data_counts <- merge(data_counts, SRR6040096_counts, by = "V1")
data_counts <- merge(data_counts, SRR6040094_counts, by = "V1")
data_counts <- merge(data_counts, SRR6040095_counts, by = "V1")
data_counts <- merge(data_counts, SRR6040097_counts, by = "V1")

#Name column
names(data_counts)[1] <- "gene"

#Remove unecessary information (first 5 rows)
data_counts <- data_counts[-c(1:5),]

#Creating dataframes (as per "Deseq2 manual" instructions)
condition <- c("non_fruit", "non_fruit", "non_fruit", "fruit", "fruit", "fruit")
names <- data_counts[,-1]
col_data <- data.frame(row.names=colnames(names), condition)
data_counts <- data.frame(row.names=data_counts[,1], leaf=data_counts[2], 
                          root=data_counts[3], stem=data_counts[4], 
                        aril_2=data_counts[5], aril_1=data_counts[6], 
                        aril_3=data_counts[7] )

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
           col = colorRampPalette(rev(brewer.pal(9, "RdBu")))(255), margins = c(5,10))

