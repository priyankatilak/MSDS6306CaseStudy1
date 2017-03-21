#------------Question 1------------
#Merge the data based on the country shortcode. How many of the IDs match?

#merging 2 tables by CountryCode in to new data frame Merged_Table
Merged_Table<-merge(GDP,Edstats_Country, by="CountryCode")
#viewving 1st five records of the merged data frame "Merged_Table" 
head(Merged_Table)

#removing blank and "," values in GDPA and Rank column and making it as numeric column
Merged_Table$GDPA <- as.numeric(gsub(",","", Merged_Table$GDPA))
Merged_Table$Rank <- as.numeric(gsub(",","", Merged_Table$Rank))
#structure of the Merged_Table
str(Merged_Table)


#------------Question 2------------
#Sort the data frame in ascending order by GDP (so United States is last). What is the 13th country in the resulting data frame?
sortedMergeTable <- Merged_Table[ order(Merged_Table$GDPA), ]
head(sortedMergeTable)


#to create output file
sortedMergeTable<-sortedMergeTable[(!(is.na(sortedMergeTable$IncomeGroup) |sortedMergeTable$IncomeGroup =="")),]
write.csv(sortedMergeTable, file = ".\\Data\\sortedMergeTable.csv")


#to view 13th country
sortedMergeTable[13,3]



#------------Question 3------------
#What are the average GDP rankings for the High income: OECD and High income: nonOECD groups?
library(dplyr)
AvgRanking<-aggregate(sortedMergeTable$Rank,list(sortedMergeTable$IncomeGroup),mean)
#printing Average Ranking for different Income groups
print(AvgRanking)


#------------Question 4------------
#Show the distribution of GDP value for all the countries and color plots by income group. Use ggplot2 to create your plot.
library(ggplot2)
library(scales)
ggplot(sortedMergeTable,aes(x=IncomeGroup, y=GDPA,group_by(sortedMergeTable$IncomeGroup)))+ geom_bar(aes(fill=sortedMergeTable$IncomeGroup), stat = "identity") + scale_fill_brewer(palette = "Spectral") + theme( axis.text.x=element_text(angle=90)) +scale_y_continuous(labels = comma)



#------------Question 5------------
#Provide summary statistics of GDP by income groups.
library('dplyr')
summary(sortedMergeTable$GDPA, by=sortedMergeTable$IncomeGroup)

#Statistics for Lower Income group
lowerIncome<-sortedMergeTable[sortedMergeTable$IncomeGroup=="Low income",]
print(summary(lowerIncome$GDPA))

#Statistics for Lower Middle Income group
lowerMiddleIncome<-sortedMergeTable[sortedMergeTable$IncomeGroup=="Lower middle income",]
print(summary(lowerMiddleIncome$GDPA))


#Statistics for Upper Middle Income group
upperMiddleIncome<-sortedMergeTable[sortedMergeTable$IncomeGroup=="Upper middle income",]
print(summary(upperMiddleIncome$GDPA))


#Statistics for High Income group
highIncomeOECD<-sortedMergeTable[sortedMergeTable$IncomeGroup=="High income: OECD",]
print(summary(highIncomeOECD$GDPA))

#Statistics for High Income Income group
highIncomeNonOECD<-sortedMergeTable[sortedMergeTable$IncomeGroup=="High income: nonOECD",]
summary(highIncomeNonOECD$GDPA)



#------------Question 6------------
#Cut the GDP ranking into 5 separate quantile groups. Make a table versus Income.Group.
quantileGrps <-quantile(sortedMergeTable$Rank, probs=seq(0,1,0.2),na.rm=TRUE)
print(quantileGrps)
gdpQuantile <- cut(sortedMergeTable$Rank, breaks = quantileGrps)
#print(gdpQuantile)
sortedMergeTable$RankGroup <- gdpQuantile
tableIncGrpVsRnkGrp <- table(sortedMergeTable$IncomeGroup, sortedMergeTable$RankGroup)
tableIncGrpVsRnkGrp

#------------Question 6------------
#How many countries are Lower middle income but among the 38 nations with highest GDP?
lower_mid_inc_count <-sqldf("select count(*) from sortedMergeTable where IncomeGroup=='Lower middle income' and  Rank <39")
print(lower_mid_inc_count)
