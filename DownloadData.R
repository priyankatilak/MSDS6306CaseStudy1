#setwd(.)
#getwd()
#download the data files
#Downloading GDP file from the WEB URL
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv",destfile = ".\\Data\\GDP.csv", mode = "w")

#Downloading Edstats_country file from the WEB URL
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv",destfile = ".\\Data\\Edstats_Country.csv", mode = "w")