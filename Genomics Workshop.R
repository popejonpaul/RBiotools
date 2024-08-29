#https://github.com/arkansas-research-platform/RBioTools/blob/91a28f0bc261617280a63ef0dbd4b712cbfb0200/getting-started.R
#R may require restart after some packages' installation
#Some optional or outdated packages included in comments

#install.packages("dc3net")
#install.packages("dc3")
# 
#install.packages("devtools")
# #install_github("dc3",username="hanna-ford")
#install.packages('r')
install.packages("rmarkdown")

install.packages(c("rlang","ape","Biostrings", "data.table", "fmsb", "gplots", "ggplot2","graphics","grid", "grImport", "gridExtra","methods","msa", "pheatmap","Rcpp", "RCurl", "rentrez", "seqinr","stats","stringr","utils"))
install.packages('XML')
#install.packages('grImport')
#rcurl entrez seqinr
install.packages(c("lattice","mgcv","nlme","survival"))
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager", repos ="http://cran.us.r-project.org")

BiocManager::install("msa", force = TRUE)
#BiocManager::install("pwalign",force=TRUE)
install.packages('installr')
library(msa)
library(installr)
#library(pwalign)

#BiocManager::install("Rsamtools")
#Set WD to directory of R project and RBiotools.zip. Download RBiotools_0.5.5.tar.gz from github.
setwd("C://Users//jonny//OneDrive//Documents//Jonathon Raney genomics workshop project//") #change this line as needed
install.packages("RBiotools_0.5.5.tar.gz", repos = NULL, type = "source")
library(RBiotools)

Chlamydia <- c(
  "CP006671.1",  # f/1-93     
  "CP006672.1",  # f/2-93
  "CP006673.1",  # f/6-94
  "CP006675.1",  # e/12-94
  "CP006676.1",  # d/13-96
  "CP006677.1",  # d/14-96
  "CP006678.1",  # la20-97
  "CP006679.1",  # j/27-97
  "CP006680.1",  # j/31-98
  "CP009923.1",  # l2b/cs19/08
  "CP009925.1",  # l2b/cs784/08
  "CP010567.1",  # e/cs1025/11
  "CP010569.1",  # f/cs847/08
  "CP010571.1"   # la/cs190/96
)

Gonorrhoeae <- c(
  "AP023069.1", # tum19854
  "CP012026.1", # fa19
  "CP012027.1", # fa6140
  "CP012028.1", # 35/02
  "CP016015.1", # 32867
  "CP016016.1", # 34530
  "CP016017.1", # 34769
  "CP020415.2", # fdaargos_20 ASM207353v2
  "CP020418.2", # fdaargos_20 ASM207361v2
  "CP020419.2" # fdaargos_20 ASM207365v2
)

#ape::read.GenBank(Chlamydia)
downloadGenBank(Chlamydia)

downloadGenBank(Gonorrhoeae)
dendrogram16S(Chlamydia)
dendrogram16S(Gonorrhoeae)
createAtlas(Chlamydia[1]) # here we index into the list to select the first item, AP012306.
createAtlas("CP006671.1") # here we hard code the accession ID from GenBank to create a genome atlas for an item not already in a list.
plotUsage(Chlamydia[1])
plotHeatMapCodon(Gonorrhoeae)

#test<-pairwiseAlignment(Chlamydia)
proteinGrouping <- runLinclust(Chlamydia)
plotBlastMatrix(proteinGrouping)
