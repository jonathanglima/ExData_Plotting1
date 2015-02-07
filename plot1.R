source("loadData.R")
source("savePlot.R")

# load the household data
householData <- loadData("household_power_consumption.txt")

# plot my histogram
hist(householData$Global_active_power, main = "Global active power", xlab = "Global Active Power (kilowatts)", col = "red")

# save!
savePlot("plot1.png")