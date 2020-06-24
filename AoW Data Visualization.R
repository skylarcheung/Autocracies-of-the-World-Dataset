#Run lines 2-5 only if the packages are not already installed
#You can also cut and paste them in the console to run, for minimizing file size
install.packages("ggplot2")
install.packages("tidyverse")
install.packages("dplyr")
install.packages("data.table")

#Load packages each time you run the lines of code below
library(ggplot2)
library(dplyr)
library(tidyverse)
library(data.table)

#By now, you should have imported the AoW dataset
#If you haven't first click 'import dataset' on the upper right hand (environment tab)
#Select "from Excel"
#Click on the browse button and select the AoW dataset file
#In the lower left hand corner, there is a line that reads "Import Options"
  #Right underneath that line, change the name from 'dataset' to "DataSet'
    #Obeying case is VERY important, ignore.case = NOT TRUE with this code

#Now, let's read the rows and columns contained in the dataset (in this case, called DataSet)
summary(DataSet)

#Okay, time to use the dplyr package
#Let's first select the relevant columns
  #Format is like this: (dataset-name, column1, column2, so forth)
#<- arrow shows that we create a new data frame called 'Data'
  #in Data, only the relevant columns are included
Data <- select(DataSet, year, personal2, un_region, regime_r)
head(Data)

#Next, we selecting relevant rows from Data 
  #that read only "Single Party" in the regime_r column
#Again, <- shows that we reated another new data frame called "SinglePartyData"
SinglePartyData <- filter(Data, regime_r=="Single Party")

#Create new column for tally of personalist regimes by year, 
#also created new data frame called "TalliedSinglePartyData"
TalliedSinglePartyData <-SinglePartyData %>% group_by(personal2, year) %>% tally()

#Create new column for FREQUENCY of each personalist regime by year, 
#also created new data frame called "FrequencySinglePartyData"
FreqPartyData <-SinglePartyData %>%
  group_by (year, personal2) %>%
  summarise (n=n()) %>%
  mutate(percent = paste0(round(100 * n/sum(n), 0), ""))

#check the types of vectors in each column
#make sure that 'percent' is character—not numeric
sapply(FreqPartyData, mode)

#if numeric for whatever reason, run line of code below
#Here, we convert the 'percent' column's vectors to numeric
FreqPartyData$percent <- as.numeric(as.character(FrequencyPartyData1$percent))

#create graph of tallied data
#you can remove +geom_smooth() if you don't want the curved line
ggplot(TalliedSinglePartyData, aes(year, n, personal2 = personal2, color=personal2)) + 
  geom_point()+geom_smooth()

#create graph of relative frequency data
ggplot(FreqPartyData, aes(year, percent, personal2 = personal2, color=personal2)) + 
  geom_point()+geom_smooth()
