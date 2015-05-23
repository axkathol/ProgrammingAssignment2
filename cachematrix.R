## Functions modeled after makeVector: 
## Use a more complex matrix object that stores inverse if already computed

## Write a short comment describing this function


makeCacheMatrix <- function(x = matrix()) {
## Cache matrix methods:

## setter and getter methods:

        i <- NULL
        set <- function(y) {
                x <<- y
                i <<- NULL
        }
        get <- function() x

## set inverse and get inverse methods:

        setinverse <- function(inverse) i <<- inverse
        getinverse <- function() i
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'

        i <- x$getinverse()

## if inverse has already been computed and cached:
        if(!is.null(i)) {
                message("getting cached data")
                return(i)
        }
        data <- x$get()

## otherwise, apply "solve" function to get inverse of matrix
        i <- solve(data, ...)
        x$setinverse(i)
        i

}
