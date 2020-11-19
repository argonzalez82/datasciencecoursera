#R Programming Week 1 Quiz  Questions and Answers stored as Variables
  Question1 <- pollutantmean("specdata", "sulfate", 1:10)

  Question2 <- pollutantmean("specdata", "nitrate", 70:72)

  Question3 <- pollutantmean("specdata", "sulfate", 34)

  Question4 <- pollutantmean("specdata", "nitrate")
  
  Question5 <- cc <- complete("specdata", c(6, 10, 20, 34, 100, 200, 310))
  print(cc$nobs)
  
  
  Question6 <- cc2 <- complete("specdata", 54)
  print(cc2$nobs)
  
  
  Question7 <-  RNGversion("3.5.1")
                set.seed(42)
                cc3 <-complete("specdata", 332:1)
                use <- sample(332, 10)
                print(cc3[use, "nobs"])
                
                
  Question8 <- cr <- sort(corr("specdata"))
               RNGversion("3.5.1")
               setseed(868)
               out <- round(cr[sample(length(cr), 5)],4)
               print(out)
                              