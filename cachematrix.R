## Put comments here that give an overall description of what your
## functions do

# This functions allow to calculate the inverse of a matrix.

## Write a short comment describing this function
#The first function allows to introduce a matrix, get again its value, and calculate the inverse.

makeCacheMatrix <- function(x = numeric()){
  m <- NULL
  setMatrix <- function(y){
    x <<- y
    m <<- NULL
  }
  getMatrix <- function() x
  cacheInverse <- function(mean) m <<- mean #This function stores the inverse in cache
  getInverse <- function() m
  
  list(setMatrix = setMatrix, getMatrix = getMatrix, cacheInverse = cacheInverse, getInverse=getInverse)
}



## Write a short comment describing this function
#The following function allows to calculate the inverse, but it will only be calculated
#if it had not being calculated previously.


cacheSolve <- function(x, ...) {
  m <- x$getInverse()
  if(!is.null(m)) {                  #This is only executed if the inverse had already beeing calculated.
    message("getting cached data")
    return(m)
  }
  data <- x$getMatrix()
  m <- solve(data, ...)
  x$cacheInverse(m)
  m
}
