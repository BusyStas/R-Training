# Plot4.R
## Across the United States, how have emissions
## from coal combustion-related sources
## changed from 1999-2008?
setwd("c:/users/stas/OneDrive/Code Projects/git/R-Training/Pollution")

library(plyr)
library(ggplot2)
d <- readRDS("summarySCC_PM25.rds")
cc <- readRDS("Source_Classification_Code.rds")
coal_combustion <- cc[grepl(cc$Short.Name,pattern='[c]omb+.+[c]oal',ignore.case=TRUE),]
## View(d[1:20,])   ## View(cc[1:20,])   ## View(coal[1:20,])

options(scipen=999) ## disabling scientific notation in R
#coal <- d[d$SCC %in% coal_combustion$SCC,] 
coal <- ddply(d[d$SCC %in% coal_combustion$SCC,],~year,summarise,t=sum(Emissions))

png(filename="Plot4.png", width=480, height=480, units="px")
plot(coal, type="l", xlab="Year", 
     main = "Total Emissions from coal combustion related sourses \nin the US from 1999 to 2008", 
     ylab = expression(paste("Total ", PM[2.5], " Emissions"))   ) 
dev.off()
