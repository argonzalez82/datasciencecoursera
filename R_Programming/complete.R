#Week 2 R Programming _ Programming Assignment 
#Part 2 calculate complete cases.  


#Assignment Directions

##'directory' is a character vector of length 1 
##indicating the location of the CSV files

##'id' is an integer vector indicating the monitor 
## ID numbers to be used 

##Return a data frame of the form:
## id nobs
## 1 117
## 2 1041
#
#ID is the monitor ID number and 'nobs' is the number
#of complete cases.

library(plyr)
library(readr)



complete <- function(directory, id = 1:332) {
  #set the path
  setwd("~/datasciencecoursera")
  path = directory
  
  #Directory with the csv files
  #Home/CentOS_Laptop/datasciencecoursera/specdata
    
  
  #get the file List in that directory
  file.list <- list.files(path, full.names = T) 
  
  
  #Sapply to loop thru csv files and import data
  counts <- sapply(id, function(i) {
    dat <- read.csv(file.list[i])
    sum(complete.cases(dat))  #added the complete cases in selected file
  })
  data.frame(id=id, nobs = counts)
}
  
  