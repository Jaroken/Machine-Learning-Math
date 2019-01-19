# Covariance Matrix

# Building a covariance matrix in r in two ways.

# create colume vectors
a <- c(1,2,3,4,5,6)
b <- c(1,3,5,7,9,11)
c <- c(10,20,30,40,50,60)
d <- c(2,5,5,2,1,0)
e <- c(4,5,6,7,8,9)

# create a matrix from vectors
M <- cbind(a,b,c,d,e)
k <- ncol(M)
n <- nrow(M)
print(M)

# find the mean for each column
k_mean <- matrix(data =1, nrow = n) %*% cbind(mean(a),
                                             mean(b),
                                             mean(c),
                                             mean(d),
                                             mean(e))
print(k_mean)

# create a difference matrix
diffM <- M - k_mean
print(diffM)

#create the covariance matrix
covarM <- (n-1)^-1 * t(diffM) %*% diffM #Sample covariance
print(covarM)

# find vairances from the covariance matrix

variance <- diag(covarM)
print(variance)

# Using R's built in function

print(cov(M))
