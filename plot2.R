source("loadData.R")
source("savePlot.R")
pkgTest("lubridate")

# load the household data
householData <- loadData("household_power_consumption.txt")

# convert to date and to time, then concatenate, creating a datetime field
householData$DateTime <- dmy(householData$Date) + hms(householData$Time)

# plot!
plot(householData$DateTime, householData$Global_active_power, type = 'l', xlab = "Global Active Power (kilowatts)", ylab = "")

# save!
savePlot("plot2.png")