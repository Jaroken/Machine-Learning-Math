# Graphing probability density functions

# example: plotting the normal distributions of childrens iq score. Mean of 100 and standard deviations of 15.

# What percentage of the children have an iq score greater than 115?

# define parameters
mean = 100
standev = 15

# define lower and upper bounds of region of interest
lower = 115
upper = Inf

# generate sequence of numbers and make normal distribution
x <- seq(-4, 4, length=100) * standev + mean
prob <- dnorm(x, mean, standev)

# make plot and add probability distribution and axis labels
plot(x, prob, type ="n",xlab = "IQ values", ylab="p(x)", main = "normal distribution of IQ scores",
     axes = FALSE)
lines(x,prob)
axis(1, at=seq(40, 160, 20), pos = 0)

# generate a polygon for region of interest

i <- x >= lower & x <= upper
polygon(c(lower, x[i], upper), c(0, prob[i],0), col = "red")

# calculate area under curve for region of interest and print results

area <- pnorm(upper, mean, standev) - pnorm(lower, mean, standev)
results <- paste("P(",lower, "< IQ <", upper, ") - ", signif(area, digits=3))
mtext(results,3)
