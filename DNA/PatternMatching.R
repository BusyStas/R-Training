KmerMatch <- function (str, kmer) {
  k <- nchar(kmer)
  idxs <- ""
  idx <- rep(0,0) # empty array 
  for (i in k+1:nchar(str)-k) {
    t <- substr(str, i, i+k-1) 
    if (nchar(t)<k) return (idxs) 
    if (t==kmer) {
      idx[length(idx)+1] <- i-1
      idxs <- paste(idxs, i)
    }
  }
  idxs
}

