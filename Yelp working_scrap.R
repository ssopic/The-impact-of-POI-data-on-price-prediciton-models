#Helper function
################
#####The function that transforms the list format into a dataframe(not mine but we use it as a helper a lot)
rm(yelp_httr_parse)
yelp_httr_parse <- function(x) {
   parse_list <- list(
      id = x$id, 
      name = x$name, 
      rating = x$rating, 
      review_count = x$review_count, 
      latitude = x$coordinates$latitude, 
      longitude = x$coordinates$longitude, 
      address1 = x$location$address1, 
      city = x$location$city, 
      state = x$location$state, 
      distance = x$distance)
   
   parse_list <- lapply(parse_list, FUN = function(x) ifelse(is.null(x), "", x))
   
   df <- data_frame(
      id=parse_list$id,
      name=parse_list$name, 
      rating = parse_list$rating, 
      review_count = parse_list$review_count, 
      latitude=parse_list$latitude, 
      longitude = parse_list$longitude, 
      address1 = parse_list$address1, 
      city = parse_list$city, 
      state = parse_list$state, 
      distance= parse_list$distance)
   df
}
#######################
setwd("C:\\Users\\silvi\\OneDrive\\Desktop\\THESIS\\Dataset Preprocessing")

#The authorization part
#https://www.yelp.com/developers/v3/manage_app
client_id <- "Y4_u-WcuAt5zB9Tqe-S2zg"
client_secret <-"V3YGUUN8O0tSBCzWZNnTtf0flJ6MimjvkM4giZ1McIkRcBcirTuKLfHKw_WmAIlrea3GwsbzY2B0rWmAJwtLfeGUCPjTlN_yZwqt0g7ahaAUdQoWMQjOC2W_BegiYHYx"
#The one that works
#https://rpubs.com/fitzpatrickm8/yelpapi
library(tidyverse)
library(httr)

#The login part; this should be kept same
res <- POST("https://api.yelp.com/oauth2/token",
            body = list(grant_type = "client_credentials",
                        client_id = client_id,
                        client_secret = client_secret))

token <- content(res)$access_token

#
#
yelp <- "https://api.yelp.com"
#Search term.I want to leave this empty unless crazy
term <- ""
#We do not use this because we are using the lat/long combination
#location <- "Cincinnati, OH"
#The categories. My idea is to aim for education and maybe restourants/sth tourist related so I can   find places that are touristy.
#I could also use bars to find places that have a good nightlife 
#category list 
#https://www.yelp.com/developers/documentation/v3/all_category_list
#
categories <- list("hotels")
term=""
limit <- 50
radius <- 4000
url <- modify_url(yelp, path = c("v3", "businesses", "search"),
                  query = list(term = term, 
               latitude="47.5112", 
               longitude="-122.257",        
               limit = limit,
               categories=categories,
               radius = radius
#This part does not work for me
#state="CA",   
#zip_code="98178",
                  ))

#This part should to be automatized.
# I need to change the url and add all of my own lat/long combinations. For the first step I could just use one zip-code
#Changing the url test 1
url
string <- as.character(url)

#We have 21613 lat/long couplings so we need a dataframe url repeated 21613 times

urlData <- as.data.frame(replicate(21613,url))
names(urlData) <- "URL"
urlData$URL <- as.character(urlData$URL)
library(stringr)
url
url_string_one <- as.character(str_split_fixed(url, "47.5112",2))
url_string_one[1]
KingCounty <- read.csv("kc_house_data.csv")
Longitude <- data_frame(KingCounty$long)
Longitude$url_string_one <- url_string_one[1]
Longitude$andlongitude <- "&longitude="
Longitude$latitude <- KingCounty$lat
Longitude$final <- as.character(str_split_fixed(url, "-122.257",2))[2]


FINALLISTOFURL <- data.frame(paste(Longitude$url_string_one, Longitude$latitude, Longitude$andlongitude, Longitude$`KingCounty$long`,Longitude$final))
names(FINALLISTOFURL) <- "url"
FINALLISTOFURL$url <- gsub(" ","",FINALLISTOFURL$url)
FINALLISTOFURL$url[c(1:15)]
write.csv(FINALLISTOFURL, "FINALLISTOFURL_all_hotels.csv")
set.seed(123)
FINALLISTOFURL <- FINALLISTOFURL[sample(1:nrow(FINALLISTOFURL)), ]
head(FINALLISTOFURL)
#My idea is that I use a for loop to go through this 

#data <- for(i in 21613){
   
#GET(FINALLISTOFURL$url[i], add_headers('Authorization' = paste("bearer", client_secret,timeout(3600))))%>%
#      content(res)
#}

#test <- apply(FINALLISTOFURL, MARGIN = 1, GET(url, add_headers('Authorization' = paste("bearer", client_secret))))

#Maybe I can just pipe it in
#library(dplyr)
#test <- FINALLISTOFURL$url[1]%>%
 #  GET(add_headers('Authorization' = paste("bearer", client_secret)))%>%content()

#library(jsonlite)
#data <- GET("http://api.open-notify.org/astros.json") %>% 
#   `$`("content") %>% rawToChar() %>% fromJSON()

library(httr)
library(jsonlite)
library(dplyr)


#funkcija <- function(data=NULL){
#   res <- GET(FINALLISTOFURL$url, add_headers('Authorization' = paste("bearer", client_secret)))
#stop_for_status(res)
#content(res)
#}
#test <- funkcija(URLencode(as.character(FINALLISTOFURL$url)))
url
FINALLISTOFURL[1]
#lol I have whitespace

#fetchedList <- list()
#i=1
# Loop through pages of orders and collect them
# it seems like this works but it is taking a lot of time
# #There is a massive error in my url lists
# the issue is not with the loop anymore
# 
# ##########The final dataset, just change the category tag way above. 100 calls seems more than enough for the active category, it might be different 
Business_data_Total <- list()
for(i in 1:5000){
#Get the url through the number in the dataframe
   requestURL <- FINALLISTOFURL[i]
#Actually get thhe requested URL
   fetched <- GET(url = requestURL,
      add_headers('Authorization' = paste("bearer", client_secret))
   )
#The transformation and the helper function to parse it(helper found later in the text)
   Business <- content(fetched)
   Business_list <- lapply(Business$businesses, FUN = yelp_httr_parse)
   Business_data <- do.call("rbind", Business_list)
   Business_data_Total <- bind_rows(Business_data,Business_data_Total, .id = NULL)
print(i)
}
   
write.csv(Business_data_Total,"Business_data_Total.csv", row.names = FALSE)
#I want to check if there are duplicates
y <- duplicated(Business_data_Total$id)
sum(y)
summary(Business_data_Total)
FinalBusiness <- distinct(Business_data_Total[,-10])
Business_data_Total <- Business_data_Total
nlevels(as.factor(Business_data_Total$id))
library(dplyr)
test <- distinct(Business_data_Total[,-10])

#############
#This means that there are 1251 duplicated id's
#We can safely presume that we have all the gyms in the area
#=)
#To get price level data I need to use the business id's to get more information on them(ie price etc) which means I will have to redo the helper function by myself.
#Or I can just use the filter XD
#I also get rating data which might be useful
#ie bad schools, lousy parks,
#

#Further possible categories exist
#Fitness & Instruction (fitness, All) we can get gym data from here
#Beauty & Spas (beautysvc, All)
#Education (education, All) can also be subset based on adult, college, Specialty schools, 
#Event planning: caricatures (staple in many touristic areas) along with hotels
#Hotels (hotels, All)
#Bus stations
#Metro stations
#Train Stations
#Financial Services (financialservices, All) this might show where the business sector of the city is
#Food (food, All) groceries, farmers markets, 
#Health & Medical (health, All) watch out for this one, it contains various "medical" professionals, but also doctors, dentists, emergency rooms and such, 
#Real Estate (realestate, All) also might show where to find the business sector
#Hotels & Travel (hotelstravel, All)
#Airports (airports, All)
#Landmarks & Historical Buildings (landmarks, All)
#Restaurants (restaurants, All)

#Am I close to the school
#Am I close to a bad school
#Which actual features are important?
#
#Ball tree and a kd-tree algorithms for calculating distances between houses 
#part of scikit learn
#python geospatial library
#geopandas
#geoplot
#psycell
#Two different frameworks tensorflow and pytorch
#Jupyter notebooks
#use random forest
#
#
#



