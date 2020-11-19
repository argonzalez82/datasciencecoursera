# corr <- function(directory, threshold = 0) {
          ##'directory' is a char vector of lengt 1 indicating
          ## the location of the CSV files

          ##'threshold' is a numeric vector of length 1 indicating the 
          ##'number of completely observed observations (on all
          ##'variables ) required to complete the correlation between
          ##'nitrate and sulfate; the default is 0
          ##'
          ##'## Return a numeric vector of correlations
          ##'## NOTE: Do not round the result!
          ##'
          ##'


library(plyr)
library(readr)
library(data.table)



  
  #set the path
  setwd("~/datasciencecoursera/specdata")
  
  
  #Reading the files and making a list of the files 
  mylist <- list.files(path, pattern = "*.csv", full.names = TRUE)
  
  #creating a dataframe using the complete function and the files in the dir.   
  df <- complete(path)
  ids <- df[df["nobs"] > threshold,]$id
  
  
  
  #setup the complete cases loop and correlation between sulfate and nitrate
  corr_num <- numeric()
      for(i in ids){
      mydata <- read.csv(mylist[i])
      df_complete <- mydata[complete.cases(mydata), ]
      corr_num <- c(corr_num, cor(df_complete$sulfate, df_complete$nitrate))
      
      return(corr_num)    
}              
 