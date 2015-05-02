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

KmerFinder <- function (str, k) {
  kmers = c("")
  
}