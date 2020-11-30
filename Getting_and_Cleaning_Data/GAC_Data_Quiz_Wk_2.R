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
    oauth_endpoints("github")
    
    # 2. To make your own application, register at
    #    https://github.com/settings/developers. Use any URL for the homepage URL
    #    (http://github.com is fine) and  http://localhost:1410 as the callback url
    #
    #    Replace your key and secret below.
    myapp <- oauth_app("github",
                       key = "56b637a5baffac62cad9",
                       secret = "8e107541ae1791259e9987d544ca568633da2ebf"
    )
    
    # 3. Get OAuth credentials
    github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)
    
    # 4. Use API
    gtoken <- config(token = github_token)
    req <- GET("https://api.github.com/rate_limit", gtoken)
    stop_for_status(req)
    content(req)
    
    # OR:
    req <- with_config(gtoken, GET("https://api.github.com/rate_limit"))
    stop_for_status(req)
    content(req)