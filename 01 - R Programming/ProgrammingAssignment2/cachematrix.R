## Matrix inversion is usually a costly computation and there may be some
## benefit to caching the inverse of a matrix rather than compute it repeatedly.
## The following functions provide a caching mechanism for storing the inverse
## of a matrix.

## makeCacheMatrix: This function creates a special "matrix"
##                  object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setinv <- function(inverse) inv <<- inverse
  getinv <- function() inv
  list(set = set, get = get, 
       setinv = setinv,
       getinv = getinv)
}


##cacheSolve: This function computes the inverse of the special "matrix"
##            returned by makeCacheMatrix above. If the inverse has 
##            already been calculated (and the matrix has not changed),
##            then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  inv <- x$getinv()
  if (!is.null(inv)) {
    #print("getting cached data") 
    return(inv)
  }
  mat <- x$get()
  inv <- solve(mat) # Since x is a square invertible matrix,
                    # then solve(X) returns its inverse.
  x$setinv(inv)
  inv
}
