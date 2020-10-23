    install.packages("Rcurl", "curl", "XML", "xml2", "renv")

#checking current working directory
#"/home/CentOS_Laptop/datasciencecoursera/Getting_and_Cleaning_Data"
    getwd()

#creating a new folder and file to store the imported data
    dir.create("test")

#setting the working directory to the new data directory to place
#the new .csv in the directory.
#Creating function since the steps in line 15 - 25
#will be needed multiple times in other questions in the Quiz.   
    
createFile <- function(fileName = "2006_microdata_survey.csv" ) {
    setwd("/home/CentOS_Laptop/datasciencecoursera/Getting_and_Cleaning_Data/data")
    
    file.create(fileName)

#checkingfile in directory
    list.files("./data")

#setting directory back to main directory 
    setwd("/home/CentOS_Laptop/datasciencecoursera/Getting_and_Cleaning_Data")
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

#housing cost, are in the variable labeled VAL , and 
#value #24 is for homes over $1,000,000
# Total sum is = 53 for homes in this price$ range   
homes_values_over_a_mil <- sum(na.exclude(surveyData$VAL > 23))

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
    
                     

    