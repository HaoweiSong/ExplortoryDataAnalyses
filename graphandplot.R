#U.S. National Amebient Air Quality Standards
pollution<-read.csv("avgpm25.csv", colClasses = c("numeric", "character", "factor", "numeric", "numeric"))
head(pollution)
summary(pollution$pm25)

#one dimentional plots
boxplot(pollution$pm25,col = "blue")
hist(pollution$pm25, col="green")
abline(v=12,lwd=2)
abline(v=median(pollution$pm25), col="purple", lwd=5)
rug(pollution$pm25)
hist(pollution$pm25, col="green",breaks = 100)
rug(pollution$pm25)
barplot(table(pollution$region), col="wheat", main = "Number of Counties in Each Region")


#two dimentional plots
boxplot(pm25~region, data=pollution, col="red")
with(pollution,plot(latitude,pm25))

par(mfrow=c(1,2), mar=c(5,4,2,1))  #set drawing zone, Set or Query Graphical Parameters
with(subset(pollution, region=="west"), plot(latitude, pm25, main="West"))
with(subset(pollution, region=="east"), plot(latitude, pm25, main="East"))

#Base Plot
library(datasets)
data(cars)
with(cars,plot(speed,dist))

#the lattice system
library(lattice)
state<-data.frame(state.x77,region=state.region)
xyplot(Life.Exp ~Income|region, data=state, layout= c(4,1))

library(ggplot2)
data(mpg)
qplot(displ, hwy, data =mpg)
