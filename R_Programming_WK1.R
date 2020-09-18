#Load the wk1 quiz dataset into Rstudio
system.time()
read.csv("hw1_data.csv")



#assign the dataset to mydata to perform addtional tasks
mydata<-read.csv("hw1_data.csv")

#sum of the NA 0r missing value entries in the Ozone column
sum(is.na(mydata$Ozone))

#calculating the mean of the  Ozone column without the NA columns

mean(na.exclude(mydata$Ozone))


#load the first 2 rows of the dataset 
head(mydata, 2)

#load the last 10 rows of the dataset
tail(mydata, 10)


#Removing NA Values example from WK1 lectures.
airquality[1:6, ]

#utilizing complete.cases to remove NA from columns 
#of the airquality dataframe

good <-complete.cases(airquality)
airquality[good, ][1:6, ]

#Question 18 in Wk1 Quiz 
# Subset from the dataframe ozone values > 31 /

mydata<-read.csv("hw1_data.csv")
new_dataset <- subset(mydata, Ozone > 31)
new_dataset
#Temp Values are above 90
newest_dataset <- subset(new_dataset, Temp > 90)
newest_dataset
#mean of the Solar.R column from this subset
mean(newest_dataset$Solar.R)

#Question  19 mean of "Temp" when "Month" is equal to 6?
mydata<-read.csv("hw1_data.csv")
Month6_dataset <- subset(mydata, Month == 6)
Month6_dataset
# mean of Temp from the new dataset
mean(Month6_dataset$Temp)



#Question 20 Month of May Maximum Ozone Value
mydata <- read.csv("hw1_data.csv")
Month_5_dataset <- subset(mydata, Month == 5)
Month_5_dataset
#removing NA values and getting max from Ozone Column
good <-complete.cases(Month_5_dataset)
max(Month_5_dataset$Ozone[good])

#Question 8
x <- list(2, "a", "b", TRUE)
class(x)
x[[1]]
class(x[[1]])

#Question 9
x <- 1:4
y <- 2:3
x+y
class(x+y)
