a <- available.packages()
head(rownames(a),3)
a[1:10,]
find.package("devtools")
install.packages("devtools")
library(devtools)
find_rtools()

install.package("KernSmooth")

x<-1:1000
a <- 0.0
for (i in 1:100000) {
  coin <- rbinom(1,1,0.5)  
  a <- a + if (coin==1) 1 else -1
  #if (coin==1) {a <- a+1} else {a<-a-1}
  #print (coin)
  x[i]=a
}
a
plot(x)


y<-10
f <- function(x) {
  y<-2
  y^2 + g(x)
}

g <- function (x) {
  x*y
}

f(3)






pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers to be used
  ## Return the mean of the pollutant across all monitors list in the 'id' vector (ignoring NA values)
  
  i <- 1
  v <- c(1,NA,NA) 
  for(a in id) {
    filename = if (a<10) paste("00",a,sep="") else if (a<100) paste("0",a,sep="") else a
    t <- read.csv(paste(directory,filename,".csv",sep="")) 
    av <- t[,pollutant]
    for (j in 1:length(av)) {
      v[i] <- av[j]
      i <- i + 1
    }
  } 
  mean(v, na.rm=TRUE)
}

dir <- "C:/Users/Stas/OneDrive/Code Projects/R Workspace/specdata/"
x <- pollutantmean (dir, "sulfate",1:10)
x

pollutantmean (dir, "sulfate",1:10)
pollutantmean (dir, "nitrate",70:72)
pollutantmean (dir, "nitrate",23)
pollutantmean (dir, "nitrate")




options(digits = 4)

cr <- corr("specdata", 150)
head(cr)
summary(cr)




source("corr.R")
source("complete.R")
cr <- corr("specdata", 150)
head(cr) 
summary(cr) 

cr <- corr("specdata", 400)
head(cr) 
summary(cr)

cr <- corr("specdata", 5000)
summary(cr) 
length(cr) 

cr <- corr("specdata")
summary(cr)
length(cr) 

# 0.01 (1%) chance of someone having accident on non-rainy day
# 0.05 (5%) chance of having accident on rainy-day
# 0.10 - Probability of rain is 10%

0.01 * 0.90 + 0.05 * 0.10 ## probability of accident
# Probability that it rained on a given day
#    given that someone had a car accident on that day

0.01/0.014

p <- 0
for(i in 1:10) {
  p <- p + choose(10,i) * 0.07 ^ i * 0.93 ^ (10-i)
}
p


x <- load(url("http://bit.ly/dasi_gss_data"))
