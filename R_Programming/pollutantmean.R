#Week 2 Programming Assignment

#pollutantmean <- function( directory, pollutant, id = 1:332){

#}

#The above function beginning is a sample, The comments below discuss
#each variable of the function.

#directory is where the specdata folder is stored 
#directory is = 
#/home/CentOS_Laptop/datasciencecoursera/data_files_for_projects/specdata 

#pollutant will be the desired pollutant for the function 
#either "sulfate" or "nitrate"

#id is the integer vector indicating the number of the monitor 
#for this function of extracting the mean 1:332 is for all monitors in the set

                  #mean(na.exclude(my_data$nitrate))
                  #print(mean)
#}

#sample line of code to get mean and remove NA values 
#mean(na.exclude(mydata$Ozone))

#Sample output from the Lesson for this function
#source("pollutantmean.R")
#pollutantmean("specdata", "sulfate", 1:10)
## [1] 4.064128

# Testing solution to read the multiple .csv files 
# Test was successful 09/18/2020

#mydir = "specdata"
#myfiles = list.files(path=mydir, pattern = "*.csv", full.names = TRUE)
#myfiles

#data_csv = ldply(myfiles, read_csv)
#data_csv





#install necessary packages and load the corresponding libraries
install.packages("plyr")

library(plyr)
library(readr)





#pollutantmean function tested successfully  09/18/2020

pollutantmean <- function(directory, pollutant, id = 1:332) {
  #set the path
  setwd("~/datasciencecoursera")
  path = directory
 
  #Directory with the csv files
  #Home/CentOS_Laptop/datasciencecoursera/specdata
  
  
  #get the file List in that directory
  fileList = list.files(path)
  
  #extract the file names and store as numeric for comparison
  file.names = as.numeric(sub("\\.csv$","",fileList))
  
  #select files to be imported based on the user input or default
  selected.files = fileList[match(id,file.names)]
  
  #import data
  Data = lapply(file.path(path,selected.files),read.csv)
  
  #convert into data frame
  Data = do.call(rbind.data.frame,Data)
  
  #calculate mean
  mean(Data[,pollutant],na.rm=TRUE)
  
}



