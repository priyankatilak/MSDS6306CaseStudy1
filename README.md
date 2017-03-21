# MSDS6306CaseStudy1
Doing data Science - Case study 1

This document describes the Gross Domestic Product data and Educational data for 190 countries across the world. We are analyzing GDP of the countries, different income groups of these countries and their contribution in million US dollars of Gross domestic product in each country.

## Objective

* Merge the data based on the country short code. How many of the IDs match?

* Sort the data frame in ascending order by GDP (so United States is last). What is the 13th
  country in the resulting data frame? 
  
* What are the average GDP rankings for the "High income: OECD" and "High income:
  nonOECD" groups? 
  
* Show the distribution of GDP value for all the countries and color plots by income group. Use
  ggplot2 to create your plot.
  
* Provide summary statistics of GDP by income groups.

* Cut the GDP ranking into 5 separate quantile groups. Make a table versus Income.Group.
  How many countries are Lower middle income but among the 38 nations with highest
  GDP?
  
## Information about raw data files

* Both the raw data files are in Comma separated format (csv)

* GDP file has NAs, missing heading, missing rows, content which is not very informative

* Education information data files has NAs

* Filtering required to perform analysis on these files

## Information about Data files

* Raw files are downloaded in folder "Data

* "GDP" and "Edstats_Country" are downloaded Raw data files

* "StoredMergeTable" is a output file which is a result of cleaning, merging and analysis on raw data files
