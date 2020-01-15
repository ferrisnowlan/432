#4: create Species vector
Species <- c("lynx", "rhino beetle", "manta ray", "newt", "scarlet macaw", "moose", "aardvark", "leprechaun", "angelfish", "black guillemot")

#5: create Limb.Width vector
set.seed(1)
Limb.Width <- rnorm(n=10, mean=10, sd=10)

#6: remove negative values
Limb.Width <- abs(Limb.Width)

#7: create 10 random mm or cm values
set.seed(2)
unitsW <- rbinom(10, 1, 0.5)

for (i in 1:length(unitsW)){  
  if(unitsW[i] == 1 ){
    unitsW[i] <- "mm"
  } 
  else{unitsW[i] <- "cm"
  }
}

#8: Repeat step 5 and 6 for a new object called Limb.Length, but with a mean and standard deviation of 100
set.seed(3)
Limb.Length <- rnorm(n=10, mean=100, sd=100)
Limb.Length <- abs(Limb.Length)

#9: repeat step 7 for unitsL
set.seed(4)
unitsL <- rbinom(10, 1, 0.5)

for (i in 1:length(unitsL)){  
  if(unitsL[i] == 1 ){
    unitsL[i] <- "mm"
  } 
  else{unitsL[i] <- "cm"
  }
}

#10: create dataframe

MyData <- data.frame(Species, Limb.Width, unitsW, Limb.Length, unitsL)

#11: save dataframe

write.csv(MyData,'measurements.csv')
