## Question 3 from the Quiz
f <- function(x) {
  g <- function(y) {
    y + z
  }
  z <- 4
  x + g(x)
}


##Quiz Question #4 

x <- 5
y <- if(x < 3) {
  NA
} else {
  10
}

##Quiz Question #5

h <- function(x, y = NULL, d = 3L) {
  z <- cbind(x, d)
  if(!is.null(y))
    z <- z + y
  else
    z <- z + f
  g <- x + y / z
  if(d == 3L)
    return(g)
  g <- g + 10
  g
}


