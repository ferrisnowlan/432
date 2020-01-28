##reviewing arrays
array(c(1:64), dim=c(2,2,2,2,2,2)) #this uses all 1-64 in 4x4 grids. Add another 2, and you have all 64 repeated twice

##on to week 2 material! How to use GitHub with R
#use if then functions, or for functions (Shannon doesn't like for functions?)
#then get on to generating graphs/figures

https://git-scm.com #this is Git, the program used to sync files. Way of tracking everything you do

##Today we are using Git
##oh the tools/globalcode lets you change your theme
#"controlling the flow"

Xvec <- c(1:10, "string") #now this is all treated as characters

Xvec <- c(1:10)
X <- 10
X<- 3

if(X > 5){"high value"} #the () brackets are the "evaluate this", the {} is what to do if true. If false, nothing happens.
  
##leaving open brackets on the end of the line keeps the code running, helps R understand that the code is nested
if(X > 5){
  "high value"} else {
    print("low value")}

#need to avoid infinite loop, can do this using a for loop. The "for" sets the condition upon which the program keeps running

for (i in 1:10){
  print(i)
}
  

for (i in 1:10){
  print(i*10)
}


##instead of looping through the elements themselves, you can loop through locations
Xvec <- c(1:10, "string")


for (i in Xvec){  
  print(i)
}


#length tells you number of elements. 
for (i in 1:leng(Xvec)){  
  print(i)
  print(Xvec[i]) #makes it print the address, as well as the contained item
}


##now looking at a while loop. Good for simulation, if you are randomly going through something, or you want to maximize a probability function, or until your value plateaus

counter <- 0

while(counter < 100){
  print(counter)
}
## this is an infinite loop of printing zeros, because counter is always less than 100

while(counter < 100){
  print(counter)
  counter <- counter+1
}

#nest if statement in a for statement. Replace the number 5 with a different string
for (i in 1:length(Xvec)){  
  if(Xvec[i] == "5"){
    Xvec[i] <- "five"
  }
  print(i)
  print(Xvec[i])
}

##you can get a lot of mileage out of just 'for loops' and 'if else'
##but you could also write your own functions!
#x and n are user provided objects

MyFunction <- function(x,n){
 return(x[1:n])
}

c(1:10)
MyFunction(c(1:10),20)

#now take vector x, and return only the first ___ elements
##IF YOU USE RETURN, YOU CAN CREATE A NEW OBJECT WITH IT! If you use print, you can't do that!

shortx <- MyFunction(c(1:10),5)

##if you write the function name, no brackets, you can see what code it contains
##the lm function, for linear model, is a good example of a complex function

##try writing your own function

Newfunction <- if(
    rnorm(1, mean=5, sd =5) > 5){print("high")} else{print("low")}

cointoss <- function(seed){
  
  set.seed(seed) 
  
  rand.num <- runif(1)
  
  if(rand.num>0.5){
    print("Heads")
  } else {
      print("Tails")
  }
}

##good habit to create a readme file in each repository on Github and include all nec. info there

##now there is a different project set up that is linked to Github, see BIOL432/432

##now for ggplot

library(ggplot2)

MyData <- read.csv("~/Desktop/BIOL432/FallopiaData.csv")

qplot(x=Total, data= MyData) #qplot decides what to plot based on data type, no thinking required
qplot(x=Scenario, data=MyData)
qplot(x=Silene, y= Total, data=MyData)

qplot(x=Total, data= MyData, binwidth=3)

qplot(x=Silene, y= Total, data=MyData, size=Total) ##This is cool, I like this as a visualization technique
qplot(x=Silene, y= Total, data=MyData, size=I(1)) ##why does the "I" make it so much smaller? It's the 'identity'

##look at nice colours
qplot(x=Silene, y= Total, data=MyData, colour=Total) #gradient of coulers
qplot(x=Silene, y= Total, data=MyData, colour=Nutrients) #two colours
qplot(x=Silene, y= Total, data=MyData, colour=I("purple"))
qplot(x=Silene, y= Total, data=MyData, colour=I(rgb(1,1,0))) #mix your own colour with light theory

qplot(x=Total, data= MyData, colour=Nutrients)
qplot(x=Total, data= MyData, fill=Nutrients) #but histograms stacked on each other is not great
qplot(x=Total, data= MyData, fill=Nutrients, posit="dodge") #posit for position

qplot(x=Silene, y= Total, data=MyData, 
      colour=Total, size = I(5), alpha = (I(0.4))) ##alpha gives transparency

qplot(x=Silene, y= Fallopia, data=MyData, 
      colour=Total, size = I(5), alpha = (I(0.4)), shape = Nutrients) ##shape automatically gives legend

qplot(x=Silene, y= Fallopia, data=MyData,
      shape=I(21), size=I(4), colour=I("yellow"), fill=I("red"),
      xlab= "Silene Biomass", ylab= "Fallopia Biomass", main= "Biomass Comparison")

qplot(x=Silene, y= Fallopia, data=MyData) +
  theme_gray()

qplot(x=Silene, y= Fallopia, data=MyData) +
  theme_bw()

qplot(x=Silene, y= Fallopia, data=MyData) +
  theme_light()

qplot(x=Silene, y= Fallopia, data=MyData) +
  theme_classic() ##Colautti's favourite

qplot(x=Silene, y= Fallopia, data=MyData) +
  theme_linedraw()

qplot(x=Silene, y= Fallopia, data=MyData) +
  theme_minimal()

qplot(x=Nutrients, y= Fallopia, data=MyData, geom ="boxplot")

qplot(x=Total, data=MyData, geom ="density") #only works with a single numeric value

qplot(x=Total, data=MyData, geom ="density", facets=Nutrients~.) #cool, creates a different graph for each category of nutrients. If ~. is before Nutrients, Nutrients are in a row. If after, columns

qplot(x=Total, data=MyData, geom ="density", facets=Nutrients~Scenario)
