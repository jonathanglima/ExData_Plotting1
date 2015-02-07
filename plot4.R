source("loadData.R")
source("savePlot.R")
pkgTest("lubridate")

# load the household data
householData <- loadData("household_power_consumption.txt")

# convert to date and to time, then concatenate, creating a datetime field
householData$DateTime <- dmy(householData$Date) + hms(householData$Time)

# create a 2x2 grid of plots
par(mfrow=c(2,2))

# top left plot
plot(householData$DateTime, householData$Global_active_power, type = 'l', xlab = "Global Active Power (kilowatts)", ylab = "")

# top right plot
plot(householData$DateTime, householData$Voltage, type = 'l', xlab = "datetime", ylab = "Voltage")

# bottom left plot, with it's lines
plot(householData$DateTime, householData$Sub_metering_1, type = 'l', xlab = "Energy sub metering", ylab = "")
lines(householData$DateTime, householData$Sub_metering_2, col = "red")
lines(householData$DateTime, householData$Sub_metering_3, col = "blue")
legend('topright',legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"), lty='solid', cex=0.6, xpd = TRUE, bty = "n", x.intersp=0.5, y.intersp = 0.5)

# bottom right plot
plot(householData$DateTime, householData$Global_reactive_power, type = 'l', xlab = "datetime", ylab = "Global_reactive_power")

# save!
savePlot("plot4.png")