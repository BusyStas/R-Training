KmerFrequency <- function(str, kmer) {
  ss <- 0
  #kmer <- 'CATG'
  for (i in 1:nchar(str)) {
    t <- substr(str, 1, nchar(kmer))
    if (t==kmer) { ss <- ss + 1 }
    str <- substr(str, 2, nchar(str))
    if (nchar(str) < nchar(kmer)) break
    #print(paste(":",i, t, str))
  }
  ss
}
# KmerFrequency('ACGTTGCATGTCGCATGATGCATGAGAGCT', 'CATG')

KmerList <- function (str, k) {
  kmers <- data.frame()
  kmers[1,1] <- substr(str,1,k)
  kmers[1,2] <- 0
  names(kmers) <- c("kmer",'frequency')
  for (i in k+1:nchar(str)-k) {
    t <- substr(str, i, i+k-1)
    #if (nrow(kmers[kmers$kmer==t])==0) {
    #  kmers[nrow(kmers)+1,1]<-t
    #}
    if (nchar(t)<k) return (kmers)
    #print(paste(i,k,t))
    if (nrow(kmers[kmers$kmer==t,])==0) {
      kmers[nrow(kmers)+1,1]<-t
      kmers[nrow(kmers),2]<-1
    } else {
      kmers[kmers$kmer==t,2] <- kmers[kmers$kmer==t,2] + 1
    }
    #kmers[kmers$kmer==t,1] <- t
    #kmers[kmers$kmer==t,1] <- as.numeric(kmers[kmers$kmer==t,1])+1
  }
  kmers
}


