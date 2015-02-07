source("pkgTest.R")

# load the file through read.csv2.sql, so the memory's not used in excess
loadData <- function(data) {
  pkgTest("sqldf")
  
  sql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
  read.csv2.sql(data, sql)
}