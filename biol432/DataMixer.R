#1: load data
MData <- read.csv("~/Desktop/432 Github/biol432/measurements.csv")
library(dplyr)

#2: create Volume column
#assume Limb Width is the diameter of a perfectly circular leg 
#end goal: put everything in cm^3


#fill Limb.Volume column, correcting Limb.Width units, but ignoring Limb.Length unit issues for now
for (i in 1:length(MData$unitsW)){
  if(MData$unitsW[i] == "mm"){ 
    MData$Limb.Volume[i] <- pi*(((MData$Limb.Width[i])*10/2)^2)*MData$Limb.Length[i]
  } else{
    MData$Limb.Volume[i] <- pi*(((MData$Limb.Width[i])/2)^2)*MData$Limb.Length[i]
  }
}

#okay, now correct the Limb.Length unit issue, but dividing final volume by 10 if Limb.Length was in mm
for (i in 1:length(MData$unitsL)){
  if(MData$unitsL[i] == "mm"){ #the 2 is again the 'second factor', mm. Alphabetical.
    MData$Limb.Volume[i] <- ((MData$Limb.Volume[i])/10)
  }
}

#create units column for Limb.Volume
MData$unitsV[1:10] <- "cm^3"
  
  