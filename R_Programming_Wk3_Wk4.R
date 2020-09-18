## running Rprof and System to experiment with Code


##Using system time / Elapsed time > User Time
system.time(readLines("http://www.jhsph.edu"))


## Using system.time() Elapsed time < User Time

hilbert <- function(n) {
    i <- 1:n
    i / outer(i - 1, i, "+")
}


x <- hilbert(1000)
print(x)

# Didnt work it was designed (svd) is for the mac
system.time(svd(x))


#using Rprof()on lm

Rprof()
## lm (y~x)
 

