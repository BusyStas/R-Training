## Function makeCacheMatrix retuns a wrapper list
## Function "set(y)" updates the matrix that we operate with; and drops cache
## Function "get" returns the matrix that we deal with
## Function "setSolve(inversedMatrix)" puts already inversed matrix into the cache
## Function "getSolve" returns the cached inversed matrix if there is one

## Creaet a list with 4 functions
makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    if (ncol(y) != nrow(y)) {
      stop ("You can this class for a square matrix only.")
    }
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setSolve <- function(inversedMatrix) m <<- inversedMatrix
  getSolve <- function() m
  list(set=set, get=get, setSolve=setSolve, getSolve=getSolve)
}


## Returns the inversed matrix if there is one (and calculates if not yet done)
cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  if (class(x) != "list") {
    if (class(x) == "matrix")
      stop("You should first use function makeCacheMatrix to wrap your matrix into a list")
    else
      stop("You should pass a wrapped matrix as a parameter")
  }
  m <- x$getSolve()
  if(!is.null(m)) {
      message("getting cached data")
      return(m)
    }
  data <- x$get()
  m <- solve(data, ...)
  x$setSolve(m)
  m
}
