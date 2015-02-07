source("loadData.R")
source("savePlot.R")
pkgTest("lubridate")

# load the household data
householData <- loadData("household_power_consumption.txt")

# convert to date and to time, then concatenate, creating a datetime field
householData$DateTime <- dmy(householData$Date) + hms(householData$Time)

# plot!
plot(householData$DateTime, householData$Sub_metering_1, type = 'l', xlab = "Energy sub metering", ylab = "")

# add submetering2 line
lines(householData$DateTime, householData$Sub_metering_2, col = "red")

# add submetering3 line
lines(householData$DateTime, householData$Sub_metering_3, col = "blue")

# add the legend
legend('topright',legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"), lty='solid', cex=0.75, x.intersp=0.1, y.intersp = 0.8)

# save!
savePlot("plot3.png")