#installing swirl package and checking version (2.4.5 version installed)
install.packages("swirl")
packageVersion("swirl")
#installing curl package to correct curl::new_handle error 
install.packages("curl")
packageVersion("curl")
install.packages("RCurl")


library(swirl)
install_from_swirl("R Programming", dev = FALSE, mirror = "github")

