ReverseCompliment <- function(x){
  a <- ""
  for (i in 1:nchar(x)) {
    c <- substr(x,nchar(x)-i+1,nchar(x)-i+1)
    if (c=="A" | c=="a") a<-paste(a,"T",sep="")
    if (c=="T" | c=="t") a<-paste(a,"A",sep="")
    if (c=="C" | c=="c") a<-paste(a,"G",sep="")
    if (c=="G" | c=="g") a<-paste(a,"C",sep="")
  }  
  a
}