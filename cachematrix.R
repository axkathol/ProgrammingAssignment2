## Functions modeled after makeVector: 
## Uses a more complex matrix object that stores value of inverse if already computed

## Constructor function for new matrix object:
makeCacheMatrix <- function(x = matrix()) {
## CacheMatrix methods:

## Setter and getter methods:

        i <- NULL
        set <- function(y) {
                x <<- y
                i <<- NULL
        }
        get <- function() x

## Set inverse and get inverse methods:

        setinverse <- function(inverse) i <<- inverse
        getinverse <- function() i
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)

}

## Inverse function for cacheMatrix objects
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'

        i <- x$getinverse()

## if inverse has already been computed and cached:
        if(!is.null(i)) {
                message("getting cached data")
                return(i)
        }
        data <- x$get()

## otherwise, apply matrix "solve" function to get inverse of matrix
        i <- solve(data, ...)
        x$setinverse(i)
        i

}
