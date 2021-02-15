library(dplyr)

setwd("C:\\Users\\silvi\\OneDrive\\Desktop\\THESIS\\Dataset Preprocessing\\Business datasets")
KingCounty <- read.csv("C:/Users/silvi/OneDrive/Desktop/THESIS/Dataset Preprocessing/kc_house_data.csv")
names(KingCounty)
BusinessData <- read.csv("financialservices.csv")
#I have too much observations, it probably do the distinct part properly. I am removing the X and the disitance variables so I can properly spot the duplicates
names(BusinessData)
BusinessData <- distinct(BusinessData[,-c(1,11)])

nlevels(as.factor(BusinessData$id))

nlevels(as.factor(BusinessData$id))

#Distance matrix
#ALL calculated rows turn into columns so we should keep just a few
library(geosphere)
#length(BusinessData$id)
#The distance between the first house and all of the restaurants
library(tidyverse)
#Full value
#length()
dataframe <- data.frame(matrix(ncol=nrow(KingCounty),nrow=nrow(BusinessData)))

for(d in 1:nrow(KingCounty)){
      
      
      #The inner loop is done, this will fill out the distances between the first house and ALL of the restaurants
      distances=vector()
      #Full length
      #
      for(i in 1:nrow(BusinessData)){
            DistFirstHouse <- distm(
                  y=c(KingCounty$long[d],
                      KingCounty$lat[d]),
                  x=c(BusinessData$longitude[i],                             BusinessData$latitude[i]),
                  fun=distGeo)
            distances[i] <- DistFirstHouse 
      }
      dataframe[d] <- distances
      print(paste0("Progress=",d," out of ",nrow(KingCounty)))
      ##This should show the progress bar better
}
write.csv(dataframe, "Financial_services_distance.csv")      
#After this I could start with the summation statistics
#Count the number of POI's within a certain mileage   
#
#Warning message:
#In 1:KingCounty$id :
#     numerical expression has 21613 elements: only the first used
#     it says to use nrow and not length? But that dooesnt make sense
#lol
#I did not run a loop exit part so it just runs until it gets to it and then just adds na's
#super lucky, we just need to cut out the na's

#     First I need to remove the first observation because it is just t from cretting the table and then I need to remove those that are after 21614
distance[,1]
distance[,21614]
distance[,21615]

distance <- distance[,c(2:21614)]
names(distance) <- KingCounty$id
write.csv(dataframe, "bars_distance.csv")

#Getting some data on the distances
x <- as.vector(as.matrix(distance))
hist(x)
#it seems that we have some large outliers so lets just select values till 200,000, and from 200000
hist(x[x<200000])
hist(x[x>200000])
rm(x)
#while looking at the histograms I figure it would be best to just select up to 50.000
sum(distance$'7129300520'>100)
#We need to do the above for each column of the dataset

#First split, restaurant count below 1km
minus1000 <- data.frame(matrix(ncol=21613,nrow=1))
for (i in 1:length(names(distance))){
      minus1000[i] <- sum(distance[,i]<1000)
      print(i)
}
x <- as.vector(as.matrix(minus1000))
hist(x)
max(x)
min(x)

#Second split, minus2000
minus2000 <- data.frame(matrix(ncol=21613,nrow=1))
for (i in 1:length(names(distance))){
      minus2000[i] <- sum(distance[,i]<2000)
      print(i)
}
x <- as.vector(as.matrix(minus2000))
hist(x)
max(x)
min(x)

#Third split, minus10000
minus10000 <- data.frame(matrix(ncol=21613,nrow=1))
for (i in 1:length(names(distance))){
      minus10000[i] <- sum(distance[,i]<10000)
      print(i)
}
x <- as.vector(as.matrix(minus10000))
hist(x)
max(x)
min(x)

#fourth split, minus20000
minus20000 <- data.frame(matrix(ncol=21613,nrow=1))
for (i in 1:length(names(distance))){
      minus20000[i] <- sum(distance[,i]<20000)
      print(i)
}
x <- as.vector(as.matrix(minus20000))
hist(x)
max(x)
min(x)

minus30000 <- data.frame(matrix(ncol=21613,nrow=1))
for (i in 1:length(names(distance))){
      minus30000[i] <- sum(distance[,i]<30000)
      print(i)
}
x <- as.vector(as.matrix(minus30000))
hist(x)
max(x)
min(x)

minus40000 <- data.frame(matrix(ncol=21613,nrow=1))
for (i in 1:length(names(distance))){
      minus40000[i] <- sum(distance[,i]<40000)
      print(i)
}
x <- as.vector(as.matrix(minus40000))
hist(x)
max(x)
min(x)

#I have no idea how to split the data that makes sense
#Therefore lets just add random distributions of it into the thing and let the model decide

KingCounty$minus100 <- t(minus100)
KingCounty$minus1000 <- t(minus1000)
KingCounty$minus10000 <- t(minus10000)
KingCounty$minus2000 <- t(minus2000)
KingCounty$minus20000 <- t(minus20000)
KingCounty$minus30000 <- t(minus30000)
KingCounty$minus40000 <- t(minus40000)
typeof(KingCounty$minus100)
names(KingCounty)
write.csv(KingCounty, "KingCounty1.csv")



#The tree model test
library(rpart)
attach(KingCounty)
x <- rpart(price~., data=KingCounty,method="anova" )
print(x)
plot(x)
summary(x)
text(x)
rsq.rpart(x)

