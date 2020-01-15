#1: load data
MData <- read.csv("~/Desktop/432 Github/measurements.csv")
library(dplyr)

#2: create Volume column
#assume Limb Width is the diameter of a perfectly circular leg 
#end goal: calculate Volume in cm^3

#fill Limb.Volume column, correcting Limb.Width units, but ignoring Limb.Length unit issues for now
for (i in 1:length(MData$unitsW)){
  if(MData$unitsW[i] == "mm"){ 
    MData$Limb.Volume[i] <- pi*(((MData$Limb.Width[i])/10/2)^2)*MData$Limb.Length[i]
  } else{
    MData$Limb.Volume[i] <- pi*(((MData$Limb.Width[i])/2)^2)*MData$Limb.Length[i]
  }
}

#okay, now correct the Limb.Length unit issue, by dividing final volume by 10 if Limb.Length was in mm
for (i in 1:length(MData$unitsL)){
  if(MData$unitsL[i] == "mm"){ 
    MData$Limb.Volume[i] <- ((MData$Limb.Volume[i])/10)
  }
}

#create units column for Limb.Volume
MData$unitsV[1:10] <- "cm^3"
  

##part III
library(ggplot2)

#I need to convert Limb.Width and Limb.Length to same units again...

#initialize new vector
Limb.Width.cm <- 1:10

#add unit corrected values
for (i in 1:length(MData$unitsL)){
  if(MData$unitsL[i] == "mm"){
    Limb.Width.cm[i] <- ((MData$Limb.Width[i])/10) 
  } else {
    Limb.Width.cm[i] <- (MData$Limb.Width[i])
  }
}

#initialize new vector
Limb.Length.cm <- 1:10

#add unit corrected values
for (i in 1:length(MData$unitsL)){
  if(MData$unitsL[i] == "mm"){ 
    Limb.Length.cm[i] <- ((MData$Limb.Length[i])/10)
  } else {
    Limb.Length.cm[i] <- (MData$Limb.Length[i])
  }
}

#plot
qplot(x=Limb.Width.cm, y= Limb.Length.cm, xlab= "Limb Width (cm)", 
      ylab= "Limb Length (cm)", main= "Limb Dimension Comparison Across Species",
      alpha = (I(0.5))) +
  theme_classic()
  