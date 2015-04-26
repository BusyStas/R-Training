# Plot5.R
## How have emissions from motor vehicle sources
## changed from 1999-2008 in Baltimore City?
setwd("c:/users/stas/OneDrive/Code Projects/git/R-Training/Pollution")

library(plyr) 
d <- readRDS("summarySCC_PM25.rds")
cc <- readRDS("Source_Classification_Code.rds")
vehicle <- cc[grepl(cc$Short.Name,pattern='vehicle',ignore.case=TRUE),]
## View(vehicle)  

options(scipen=999) ## disabling scientific notation in R
vehicle_in_baltimore <- d[d$SCC %in% vehicle$SCC & d$fips=="24510",] 
y <- ddply(vehicle_in_baltimore,~year,summarise,t=sum(Emissions))

png(filename="Plot5.png", width=480, height=480, units="px")
plot(y, type="l", xlab="Year", 
     main = "Total Emissions from Vehicle related sourses \nin Baltimore, MD from 1999 to 2008", 
     ylab = expression(paste("Total ", PM[2.5], " Emissions"))   ) 
dev.off()
