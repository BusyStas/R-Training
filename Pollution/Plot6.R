# Plot6.R
## Compare emissions from motor vehicle sources in Baltimore City
## with emissions from motor vehicle sources in Los Angeles County
## , California (fips == "06037"). Which city has seen
## greater changes over time in motor vehicle emissions?
setwd("c:/users/stas/OneDrive/Code Projects/git/R-Training/Pollution")

library(plyr) 
d <- readRDS("summarySCC_PM25.rds")
cc <- readRDS("Source_Classification_Code.rds")
vehicle <- cc[grepl(cc$Short.Name,pattern='vehicle',ignore.case=TRUE),]
## View(vehicle)  

options(scipen=999) ## disabling scientific notation in R
vehicle_in_baltimore <- d[d$SCC %in% vehicle$SCC & d$fips=="24510",] 
vehicle_in_los_angeles <- d[d$SCC %in% vehicle$SCC & d$fips=="06037",] 
y_baltimore <- ddply(vehicle_in_baltimore,~year,summarise,t=sum(Emissions))
y_los_angeles <- ddply(vehicle_in_los_angeles,~year,summarise,t=sum(Emissions))

png(filename="Plot6.png", width=480, height=480, units="px")
par(mfcol=c(1,2)) # two plots side by side
plot(y_baltimore, type="l", xlab="Year", 
     main = "Baltimore, MD",
     ylab = expression(paste("Total ", PM[2.5], " Emissions"))   ) 
plot(y_los_angeles, type="l", xlab="Year", 
     main = "Los Angeles, CA", 
     ylab = expression(paste("Total ", PM[2.5], " Emissions"))   ) 
dev.off()
