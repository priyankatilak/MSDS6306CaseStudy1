#read the Downloaded files in objects
GDP<-read.csv(".\\Data\\GDP.csv",sep=",",header=F, skip= 5)
Edstats_Country<-read.csv("C:\\Personal\\SMU\\SAS\\R\\R_REPO\\MSDS6306CaseStudy1\\Data\\Edstats_Country.csv",sep=",",header=T)

library(plyr)
#GDP data file cleanup\n
#giving new column names and ignoring empty rows for GDP table
colnames(GDP) <- c("CountryCode","Rank","Empty","CountryName","GDPA" )
keep_columns<-c("CountryCode","Rank","CountryName","GDPA")
GDP<-GDP[keep_columns]

# Calculating missing values and NAs before cleaning up GDP data
sum(is.na(GDP$CountryCode) | GDP$CountryCode=="")
sum(is.na(GDP$Rank) | GDP$Rank=="")
sum(is.na(GDP$GDPA) | GDP$GDPA =="")

#Cleaning GDP file data
GDP<-GDP[!(is.na(GDP$CountryCode) | GDP$CountryCode=="" | is.na(GDP$GDPA) | GDP$GDPA=="" | is.na(GDP$Rank) | GDP$Rank==""),]
#view 1st 5 rows of the dataframe
head(GDP)

#Cleaning Edstats_Country data file
colnames(Edstats_Country)[1] <- "CountryCode"
colnames(Edstats_Country)[2] <- "LongName"
colnames(Edstats_Country)[3] <- "IncomeGroup"

# Calculating missing values and NAs before cleaning up Edstats_Country data
sum(is.na(Edstats_Country$CountryCode) | Edstats_Country$CountryCode=="")
#sum(is.na(Edstats_Country$Income.Group) | Edstats_Country$Income.Group=="")

# Selecting the required columns only from Edstats_Country dataframe
library(sqldf)
Edstats_Country<-sqldf("select Edstats_Country.CountryCode,Edstats_Country.LongName, Edstats_Country.IncomeGroup from Edstats_Country ")
head(Edstats_Country)

