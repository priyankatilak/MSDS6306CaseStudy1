################################
#--------Priyanka Tilak--------#
#--------MSDS6306CaseStudy1----#
#--------Created 18 March 2017-#
################################

##libraries required
#install.packages("downloader")
#install.packages("plyr")
#install.packages("dplyr")
#install.packages("ggplot")

cat("Part 1: Introduction to the Project
Using Gross Domestic Product data and Educational data for 190 countries. We are analysing GDP of the contries, different income group for the country and their
contribution in million US dollars of Gross domestic product. Given data also includes other than just world contries but also different geographical region. 
As we are only intrested in 190 countries, we will fiter out the regions form the given data and build our analysis for contries only.\n")

cat("Set the present directory as working directory\n")
setwd(".")
cat("view present working directory\n")
getwd()
library(ggplot2)
cat("Downloading the data from Internet sources\n")
source("DownloadData.R")
source("TidyigData.R")
source("MergeData.R")
