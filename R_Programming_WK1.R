#Load the wk1 quiz dataset into Rstudio
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
