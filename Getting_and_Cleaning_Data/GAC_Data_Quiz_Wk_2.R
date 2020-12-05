#Week 2 Quiz  
    


    #Question 1
    #Register an application with the Github API 
    #here https://github.com/settings/applications. 
    #Access the API to get information on your instructors repositories 
    #(hint: this is the url you want 
    #"https://api.github.com/users/jtleek/repos"). 
    #Use this data to find the time that the datasharing repo was created. 
    #What time was it created?
    #This tutorial may be useful 
    #(https://github.com/hadley/httr/blob/master/demo/oauth2-github.r). 
    #You may also need to run the code in the base R package and not R studio.


    #Following work was run in Base R not Rstudio just saving here to save work.     
    #Need the following package to use  oauth()

        install.packages("curl")
        install.packages("httr") #may need curl, openssl libraries first. 
        library(httr)
    
    # 1. Find OAuth settings for github:
    #    http://developer.github.com/v3/oauth/
        #oauth_endpoints("github")
    
    # 2. To make your own application, register at
    #    https://github.com/settings/developers. Use any URL for the homepage URL
    #    (http://github.com is fine) and  http://localhost:1410 as the callback url
    #
    #    Replace your key and secret below.
        #myapp <- oauth_app("github",
                       #key = "56b637a5baffac62cad9",
                       #secret = " "
                       #add secret code into source script and run in Base R locally
        #)
    
    # 3. Get OAuth credentials
        #github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)
    
    # 4. Use API
        #gtoken <- config(token = github_token)
        #req <- GET("https://api.github.com/rate_limit", gtoken)
        #stop_for_status(req)
        #content(req)
    
    # OR:
    #req <- with_config(gtoken, GET("https://api.github.com/rate_limit"))
    #stop_for_status(req)
    #content(req)
    
    #SOLUTIONS ABOVE USING GITHUB API ARE NO LONGER WORKING, 
    #GITHUB CHANGED THERE OAUTH PROCESS AFTER 11/13/2020
    
    
    #$ curl -u username:token https://api.github.com/user(sample command!)
        
        
    #curl -u argonzalez82:<ACTIVE_TOKEN> https://api.github.com/users/jtleek/repos 
    #<ACTIVE_TOKEN> gets replaced with active token but not including
    #in source so it doesn't get uploaded to github. 
        
    #Ran the above command in base R in the terminal and pulled the Repos 
    #as json data. and found the solution to question  1.
    #datasharing repo was created on 2013-11-07T13:25:07Z
        
    #expanded on question 1 to pull down the json data in RStudio 
        
    #Reusing the createFile function from GAC_Data Quiz wk 1 Quiz 
            
        createFile(fileName = "jtleekRepo.json")
                
        WK2_Q1_apiURL <- "https://api.github.com/users/jtleek/repos"
        
        download.file(WK2_Q1_apiURL,
                      destfile = "./data/jtleekRepo.json",
                      method ="curl")    
        
        
        
        
    #*************************************            
    
    

    
    #*****************************************
    
    
    
    #Question 2
    #The sqldf package allows for execution of SQL commands on R data frames. 
    #We will use the sqldf package to practice the queries we might send with 
    #the dbSendQuery command in RMySQL.
    
    #Download the American Community Survey data and load it into an R object called
    

    #https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv
    
    #Which of the following commands will select only the data for the probability weights 
    #pwgtp1 with ages less than 50?
    
        
    
    #Using the createFile function to create the new file for the downloaded data
        
        getwd()
        createFile(fileName = "WK2_Q2_survey_data.csv")
    
        Q2_csvURL <- https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv