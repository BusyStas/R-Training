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
png(filename="plot2.png", width=480, height=480, units="px", pointsize=12, type="windows", antialias="none")

plot(d$Global_active_power ~ d$Datetime, type = "l",ylab = "Global Active Power (kilowatts)", xlab = "")

dev.off() ## close the file
