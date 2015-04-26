# Plot6.R
## Compare emissions from motor vehicle sources in Baltimore City
## with emissions from motor vehicle sources in Los Angeles County
## , California (fips == "06037"). Which city has seen
## greater changes over time in motor vehicle emissions?
setwd("c:/users/stas/OneDrive/Code Projects/git/R-Training/Pollution")

library(plyr)
library(ggplot2)
d <- readRDS("summarySCC_PM25.rds")
cc <- readRDS("Source_Classification_Code.rds")
vehicle <- cc[grepl(cc$Short.Name,pattern='vehicle',ignore.case=TRUE),]
## View(vehicle)  

options(scipen=999) ## disabling scientific notation in R
MD_vs_CA <- d[d$SCC %in% vehicle$SCC & (d$fips=="24510" | d$fips=="06037"),] 
y <- ddply(MD_vs_CA,~year,summarise,t=sum(Emissions))

png(filename="Plot6.png", width=480, height=480, units="px")
ggplot(MD_vs_CA, aes(year, Emissions, color = fips))+ 
  geom_line(stat = "summary", fun.y = "sum")+
  ylab(expression(paste("Total ", PM[2.5], " Emissions")))+
  ggtitle("Total Emissions in Baltimore, MD from 1999 to 2008")+
  scale_colour_discrete(name = "Group")
    , label = c("Los Angeles","Baltimore"))
dev.off()


