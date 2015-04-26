# Plot3.R
## Of the four types of sources indicated by the type (point, 
## nonpoint, onroad, nonroad) variable, which of these four sources
## have seen decreases in emissions from 1999-2008 for Baltimore City?
## Which have seen increases in emissions from 1999-2008?
## Use the ggplot2 plotting system to make a plot answer this question.
setwd("c:/users/stas/OneDrive/Code Projects/git/R-Training/Pollution")

library(plyr)
library(ggplot2)
d <- readRDS("summarySCC_PM25.rds")
#cc <- readRDS("Source_Classification_Code.rds")
## View(d[1:20,])   ## View(cc[1:20,])

options(scipen=999) ## disabling scientific notation in R
baltimor <- d[d$fips=="24510",]
#y <- ddply(baltimor,~year,summarise,t=sum(Emissions))

png(filename="Plot3.png", width=480, height=480, units="px")
ggplot(baltimor, aes(year, Emissions, color = type))+ 
  geom_line(stat = "summary", fun.y = "sum")+
  ylab(expression(paste("Total ", PM[2.5], " Emissions")))+
  ggtitle("Total Emissions in Baltimore, MD from 1999 to 2008")
dev.off()
