## Load text file into a data frame
rawdata <- read.csv("household_power_consumption.txt", header = T, sep = ';', na.strings = "?", nrows = 2075259, check.names = F, stringsAsFactors = F, comment.char = "", quote = '\"')
rawdata$Date <- as.Date(rawdata$Date, format = "%d/%m/%Y")

## We will only be using data from the dates 2007-02-01 and 2007-02-02
d <- subset(rawdata, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(rawdata) ## remove from memory

## Converting dates (concatenate date and time into a single variable)
datetime <- paste(as.Date(d$Date), d$Time)
d$Datetime <- as.POSIXct(datetime)

## Must be initiated before you start plotting:
png(filename="plot4.png", width=480, height=480, units="px", pointsize=12, type="windows", antialias="none")

## Subsequent figures will be drawn by rows
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))

with(d, {
  plot(Global_active_power ~ Datetime, type = "l", 
       ylab = "Global Active Power", xlab = "")
  plot(Voltage ~ Datetime, type = "l", ylab = "Voltage", xlab = "datetime")
  plot(Sub_metering_1 ~ Datetime, type = "l", ylab = "Energy sub metering", xlab = "")
  lines(Sub_metering_2 ~ Datetime, col = 'Red')
  lines(Sub_metering_3 ~ Datetime, col = 'Blue')
  legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, bty = "n",
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power ~ Datetime, type = "l", 
       ylab = "Global_rective_power", xlab = "datetime")
})

dev.off() ## close the file

