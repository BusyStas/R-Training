KmerMatch <- function (str, kmer) {
  k <- nchar(kmer)
  idx <- rep(0,0) # empty array 
  for (i in k+1:nchar(str)-k) {
    t <- substr(str, i, i+k-1) 
    if (nchar(t)<k) return (idx) 
    if (t==kmer) {
      idx[length(idx)+1] <- i-1
      
    }
  }
  idx
}

