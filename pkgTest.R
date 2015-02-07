# verify if the required package is installed, if it's not installed, install and try to load
pkgTest <- function(x) {
  if (!require(x,character.only = TRUE)) {
    install.packages(x,dep=TRUE)
    
    if(!require(x,character.only = TRUE)) {
      stop("Package not found")
    } else {
      library(x)
    }
  }
}