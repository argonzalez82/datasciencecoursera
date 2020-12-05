    install.packages("curl", "RCurl", "XML", "xml2")
    
    
  
    
    
  #checking current working directory
  #"/home/CentOS_Laptop/datasciencecoursera/Getting_and_Cleaning_Data"
      getwd()

  #creating a new folder and file to store the imported data
      dir.create("data")

  #setting the working directory to the new data directory to place
  #the new .csv in the directory.
  #Creating function since the steps in line 15 - 25
  #will be needed multiple times in other questions in the Quiz.   
    
    createFile <- function(fileName = "2006_m!icrodata_survey.csv" ) {
        setwd("/home/CentOS_Laptop/datasciencecoursera/Getting_and_Cleaning_Data/data")
    
    file.create(fileName)

  

  #setting directory back to main directory 
    setwd("/home/CentOS_Laptop/datasciencecoursera/Getting_and_Cleaning_Data")

  #verifiying files in directory
    return(list.files("./data"))
    
    }

  #Question 1:  Download from fileURL object into a .csv in the data dir.
  # http address is assigned to the fileURL object
    
    fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
    download.file(fileURL, 
                destfile = "./data/2006_microdata_survey.csv",
                method ="curl")


  #reading the survey data into R /
  #creating a table 

    surveyData <- read.table("./data/2006_microdata_survey.csv", 
                            sep = ",", 
                            header =TRUE)
    
    head(surveyData)
    
  #calculate how many houses cost over $1,000,000
  #variable definitions are in the codebook in the address below
  #performed the same steps as line 13 -20 using createFile function 
  #except creating a new .pdf
  #file for the code  
    
    createFile(fileName = "2006_survey_codeBook.pdf")
    
    code_bookURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf"
    
    download.file(code_bookURL,
                destfile = "./data/2006_survey_codeBook.pdf",
                method ="curl")

<<<<<<< Updated upstream
#housing cost, are in the variable labeled VAL , and 
#value #24 is for homes over $1,000,000
# Total sum is = 53 for homes in this price$ range   
print(homes_values_over_a_mil <- sum(na.exclude(surveyData$VAL > 23)))
=======
  #housing cost, are in the variable labeled VAL , and 
  #value #24 is for homes over $1,000,000
  # Total sum is = 53 for homes in this price$ range   
    homes_values_over_a_mil <- sum(na.exclude(surveyData$VAL > 23))
>>>>>>> Stashed changes

    homes_values_over_a_mil




###################################


  #Question 3 - Download and Load 
  #Excel spreadsheet on Natural Gas Aquisition Program
  #performed the same steps as line 13 -20 using the createFile function. 
  #to create a new .xlsx file in data and switch back the working directory

    createFile(fileName = "NaturalGasAquisitionProgram.xlsx")

    NatGasProgramURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"

    download.file(NatGasProgramURL,
              destfile = "./data/NaturalGasAquisitionProgram.xlsx",
              method ="curl")
      
  #"Read rows 18-23 and columns 7-15 into R and 
  #assign the result to a variable called: dat"
    
    install.packages("xlsx")    
    library(xlsx)

    rowIndex <- 18:23  
    colIndex <- 7:15
    dat <- read.xlsx("./data/NaturalGasAquisitionProgram.xlsx",
                     sheetIndex = 1,
                     rowIndex = rowIndex,
                     colIndex = colIndex)
    
  #second part of Question 3:
    zipsum <- sum(dat$Zip*dat$Ext,na.rm = T)

    
   
   
  #Question 4
  #Read the XML data on Baltimore restaurants from here:
  #https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml
  #How many restaurants have zipcode 21231?
   
    install.packages("XML", "RCurl")
    library(XML, RCurl)
  
  #Assign the XML website to variable xmlURL
    xmlURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
  
  #parse the xml and assign to doc variable use the sub() to remove "s" from https
  #since xml doesnt work https sites. 
    doc <- xmlTreeParse(sub("s", "", xmlURL), useInternal=TRUE)
    rootNode <- xmlRoot(doc)
    print(rootNode)
  
  #working on collecting zipcode node in order to complete the solution
  #1st attempt - outcome not really useable yet 
    zipCollect <- xpathApply(doc = rootNode, "//zipcode" )
    print(zipCollect)

  #2nd attempt outcome is useable     
    zipCollect2 <- xpathSApply(rootNode, "//zipcode[contains(text(), 
                             '21231')]", xmlValue) 
  
  
  #installing plyr package to use the count function plyr::count
    install.packages("plyr")
    library(plyr)

  #zipCollect2 is Character / changed to integer to count the 
  
    zipCount <- count(zipCollect2)
  


  
  #Question:5
  #The American Community Survey distributes downloadable data 
  #about United States communities. Download the 2006 microdata survey 
  #about housing for the state of 
  #Idaho using download.file() from here:
  
  #https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv
  
  #get working directory  / to verify current directory
    getwd()

  #Reusing CreateFile function from Question1 
  #creating a new to file in the data folder 
  #to place the download() from the url

    createFile(fileName = "2006_microdata_2.csv") 
  
  #Question 5:  Download from fileURL object into a .csv in the data dir.
  #http address is assigned to the fileURL object
  
    fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
    download.file(fileURL, 
                destfile = "./data/2006_microdata_2.csv",
                method ="curl")
  

  #reading the survey data into R /
  #creating a table using fread() 
  #data.table package is needed for the fread()  
  
    install.packages("data.table") 
    library(data.table)

  
    DT <- fread("./data/2006_microdata_2.csv", 
                                  sep = ",", 
                                header =TRUE,
                              verbose = TRUE)
  
    head(DT)  

  #second part of Question5 Testing different solution to 
#to find the fastest solution
  
<<<<<<< Updated upstream
  install.packages("rbenchmark")
  library(rbenchmark)
  
  Q5_Solution1 <- (DT[DT$SEX==1,]$pwgtp15);mean(DT[DT$SEX==2,]$pwgtp15)
  benchmark(Q5_Solution1)
 
  Q5_Solutions2 <- mean(DT$pwgtp15,by=DT$SEX)
  benchmark(Q5_Solutions2)
 
  Q5_Solution3 <- sapply(split(DT$pwgtp15,DT$SEX),mean)
  benchmark(Q5_Solution3)
 
  Q5_Solutions4 <- rowMeans(DT)[DT$SEX==1];rowMeans(DT)[DT$SEX==2]
  benchmark(Q5_Solution4)
 
  Q5_Solution5 <- DT[,mean(pwgtp15),by=SEX]
  benchmark(Q5_Solution5)
  
  Q5_Solution6 <- tapply(DT$pwgtp15,DT$SEX,mean)
  benchmark(Q5_Solution6)
 
 
=======
 Q5_Solution1 <- (DT[DT$SEX==1,]$pwgtp15);mean(DT[DT$SEX==2,]$pwgtp15)
  
    system.time(Q5_Solution1)
  
 Q5_Solution2 <- 
    system.time(Q5_Solution2) 
 
 Q5_Solution3 <- 
   system.time(Q5_Solution3) 
 
 Q5_Solution4 <- 
   system.time(Q5_Solution4) 
 
 Q5_Solution5 <- 
   system.time(Q5_Solution5) 
>>>>>>> Stashed changes
