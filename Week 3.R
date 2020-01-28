##ALRIGHTTTTT LETS GET TO IT

#GOAL: Reproducability in Data Science
#Data science merges the study of computer science and stats to answer questions in other domains, ie business, biology, psychology)
#DS has grown in popularity fast due to increased collection and publication of data, now referred to as "Big Data"

#Big Data Issues: Volume, Velocity, Veracity, Variety
#Examples: pixels, user profiles, genome science
#on a single illumina high seq machine, you can generate 20GB of data in a day
#climate data, animal movement, omics, health records are Big Data in Biology

#Data Science Life Cycle
#Hypothesize, Collect, Correct (clean data), Explore (visualize), Model (stats), Report
#BIOL432 focuses on the Correct, Explore, and Reporting stages
#Hypothesis and Collect is related to your specific field, and Model is related to stats models.

install.packages("rmarkdown")
library(knitr)
library(rmarkdown)

fallo <- read.csv("~/Desktop/BIOL432/FallopiaData.csv")
str(fallo)

library(dplyr)
#Sasha said what??? something about names?

pot1 <- filter(fallo, PotNum == 1)
names(fallo)[12] <- "T_Biomass" #changes the twelfth column name
fallo <- rename(fallo, Biomass = T_Biomass) #dplyr way to change column name

x <- arrange(fallo, Nutrients, Biomass) #sort from lowest to highest
y <- arrange(fallo, Nutrients, desc(Biomass)) #sort from highest to lowest

x <- select(fallo, -PotNum) #minus is the ones that you don't want to keep

x <- select(fallo, Taxon, Scenario, Nutrients, PotNum, Pct_Fallopia, 
            everything()) #this reorders the dataset! 
            #You pick the beginning ones, then everything else is auto-added by everything()

x <- mutate(fallo, urtsil = Urtica + Silene) #this is better than base r because you don't need df$column, just column. 
select(x, urtsil)

#if you want to pull a column out of df that's a combo of other columns use
x <- transmute(fallo, urtsil = Urtica + Silene)

x <- mutate(fallo, urtsil = Urtica/(mean(Urtica))


TrtGrp <- group_by(fallo, Taxon, Scenario, Nutrients)
#A tibble is a special type of df that creates groups out of your df
#this TrtGrp is a tibble
forcolleague <- summarise(TrtGrp, Avg = mean(Biomass), SD = sd(Biomass))

write.csv(forcolleague, "~/Desktop/output/forcolleague.csv")

forcolleague <- group_by(fallo, Nutrients) 
summarise(forcolleague, Avg = mean(Biomass), SD = sd(Biomass))

#now we want to use a weighted mean, for dif species at each nutrient level

cool <- group_by(fallo, Nutrients, Taxon) 
summarise(cool, Avg = mean(Biomass), SD = sd(Biomass))

Y <- group_by(cool, Taxon)
summarise(Y, Avg = mean(Biomass), SD = sd(Biomass))
#in this cases, they turn out to be the same bc of good experimental design!
#but taking the mean of means is a good idea in a study with more mortality is a good idea

######### piping ############

cool <- group_by(fallo, Nutrients, Taxon, Scenario) 
summarise(cool, Avg = mean(Biomass), SD = sd(Biomass))

Y <- group_by(cool, Taxon, Scenario)
summarise(Y, Avg = mean(Biomass), SD = sd(Biomass))

Z <- group_by(cool, Taxon)
summarise(Z, Avg = mean(Biomass), SD = sd(Biomass))

##how do this with piping

 fallo %>% 
   group_by(Nutrients, Taxon, Scenario) %>% 
    group_by(Taxon, Scenario) %>% 
    group_by(Taxon) %>% 
    summarise(Avg = mean(Biomass), SD = sd(Biomass)) %>% 
    arrange(desc(Avg))

 #Missing data. Special code is NA 
 
 Vec <- c(1,2,3,NA,5,6,7) 
 length(Vec)
 Vec <- 10*Vec
 
 mean(Vec) #doesn't work because there is a NA
 mean(Vec, na.rm=TRUE) #gotta make sure that exclusion is better then 0 or replacement.
 
 is.na(Vec)
  
 Vec[is.na(Vec)] <- 0 #if you use an index that's a true/false, 
                      #you can then apply a function to only the ones that are true
 
 #Naughty Data: data that was written by non-data scientists, with readability at the forefront of their minds
 #good data: in general, each cell must contain one value.
 
#If you have merged cells in your excel sheet, it saves them as empty strings
 #it puts empty numbers as NA, but empty factors as "".
 
 #If you do an ANOVA on factors, it will include "" as an additional levels
 
 #For assignment this week,
 
 regular expressions
 
