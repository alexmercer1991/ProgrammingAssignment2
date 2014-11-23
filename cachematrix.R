# This function is used to return a list of functions. The puspose is to 
# store a martix and a cached value of the inverse of the matrix.

makeCacheMatrix <- function(x = numeric()) {
     cache <- NULL
     setMatrix <- function(y) {
          x <<- y
          cache <<- NULL
     }
     getMatrix <- function() {
          x
     }
     cacheInverse <- function(solve) {
          cache <<- solve
     }
     getInverse <- function() {
          cache
     }
     
     list(setMatrix = setMatrix, getMatrix = getMatrix, cacheInverse = cacheInverse, getInverse = getInverse)
}


# The following function calculates the inverse of the matrix created before

cacheSolve <- function(y, ...) {
     inverse <- y$getInverse()
     if(!is.null(inverse)) {
          message("getting cached data")
          return(inverse)
     }
     data <- y$getMatrix()
     inverse <- solve(data)
     y$cacheInverse(inverse)

     inverse
}