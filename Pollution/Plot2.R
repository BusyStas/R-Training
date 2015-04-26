# Plot2.R
## Have total emissions from PM2.5 decreased in the Baltimore City, 
## Maryland (fips == "24510") from 1999 to 2008? Use the base plotting
## system to make a plot answering this question.

setwd("c:/users/stas/OneDrive/Code Projects/git/R-Training/Pollution")

d <- readRDS("summarySCC_PM25.rds")
#cc <- readRDS("Source_Classification_Code.rds")
## View(d[1:20,])
## View(cc[1:20,])

library(plyr)
options(scipen=999) ## disabling scientific notation in R
baltimor <- d[d$fips=="24510",]
y <- ddply(baltimor,~year,summarise,t=sum(Emissions))

png(filename="Plot2.png", width=480, height=480, units="px")
plot(y, type="l", xlab="Year", 
     main = "Total Emissions in Baltimore, MD from 1999 to 2008", 
     ylab = expression(paste("Total ", PM[2.5], " Emissions"))   ) 
dev.off()
