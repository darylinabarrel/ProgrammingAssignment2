## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  
  ## clear any values
  
  m <- NULL
  
  ## grab the input and create a variable that can be used by the cacheSolve function
  
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  
  ## get the value of x from the cache
  
  get <- function() x
  
  ## set the inverse value
  
  setInverse <- function(solve) m <<- solve
  
  ## get the inverse value
  
  getInverse <- function() m
  
  ## produce a list of objects
  
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
  
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  
        ## Get the inverse from the matrix passed in
  
        m <- x$getInverse()
        
        ## if there is no inverse, then fuck it
        if(!is.null(m)) {
          message("getting cached data")
          return(m)
        }
        
        ## get the values of the matrix passed in
        
        data <- x$get()
        
        ## make m the inverse
        
        m <- solve(data, ...)
        
        ## save the inverse to the cache
        
        x$setInverse(m)
        
        m
  
  
  
}
