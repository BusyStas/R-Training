# Plot1.R
## Have total emissions from PM2.5 decreased in the United States
## from 1999 to 2008? Using the base plotting system, make a plot
## showing the total PM2.5 emission from all sources for each 
## of the years 1999, 2002, 2005, and 2008.
## Upload a PNG file containing your plot addressing this question.

d <- readRDS("summarySCC_PM25.rds")
## View(d[1:20,])

library(plyr)
options(scipen=999) ## disabling scientific notation in R
y <- ddply(d,~year,summarise,t=sum(Emissions))

png(filename="Plot1.png", width=480, height=480, units="px")
plot(y, type="l", xlab="Year", 
     main = "Total Emissions in the United States from 1999 to 2008", 
     ylab = expression(paste("Total ", PM[2.5], " Emissions"))   ) 
dev.off()


