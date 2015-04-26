# Plot2.R
## Have total emissions from PM2.5 decreased in the Baltimore City, 
## Maryland (fips == "24510") from 1999 to 2008? Use the base plotting
## system to make a plot answering this question.

d <- readRDS("summarySCC_PM25.rds")
cc <- readRDS("Source_Classification_Code.rds")
View(d[1:20,])

library(plyr)
y <- ddply(d,~year,summarise,t=format(sum(Emissions),scientific=FALSE))
#y <- format(y, scientific=FALSE)

png(filename="Plot1.png", width=480, height=480, units="px")
plot(y, type="l", xlab="Year", 
     main = "Total Emissions in the United States from 1999 to 2008", 
     ylab = expression(paste("Total ", PM[2.5], " Emissions"))   ) 
dev.off()
