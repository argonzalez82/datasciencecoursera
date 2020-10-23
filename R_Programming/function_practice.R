#different examples of basic functions from class

#basic adding function that add 2 numbers.
add2 <- function(x,y){
      x+y
}

add2(10, 90)

#This function takes a vector & returns a subset of
#everything above 10 
above10 <- function(x) {
        use <- x > 10
        x[use]
}

above <- function(x,n) {
      use<- x > n
      x[use]
  
}

#above function gives you an error if you dont 
#provide a value for n


#same function as above with default value for n
#using default helps prevent user error if n is 
#given a value 
above <- function(x,n = 10) {
  use<- x > n
  x[use]
  
}



#This function get a mean from a column
columnmean <- function(y){
  nc <- ncol(y)
  means  <- numeric(nc)
  for(i in 1:nc){
    means[i] <-mean(y[,i])
    
  }
  means
}




