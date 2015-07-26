## This code contains two functions :
## 'makeCacheMatrix.R' and 'cacheSolve.R'. The objective of this program is to construct a matrix and compute its inverse. We use lexical Scoping in the R language to preserve the state of a matrix and its inverse inside of an R object by cacheing the values. 

## This function constructs a matrix and cache's its inverse

makeCacheMatrix <- function(x = matrix()) {

  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setinverse <- function(solve) i <<- solve
  getinverse <- function() i
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}



## This function solves for the inverse of the above matrix, if it is not already computed. 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  i <- x$getinverse()  # get the inverse if it already exists
  if(!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  data <- x$get()     
  i<- solve(data)    
  x$setinverse(i)
  i
}

  
