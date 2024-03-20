
############################################ 
### Simulations & Bootstrapping (Part a) ###
############################################


#############################
### Vectorized Operations ###
#############################

# The fundamental architecture of R is based on vectors.

# Example: A function `f()` is defined, which squares a number if it's even and 
# cubes it if it's odd. 

square_cube <- function(x){
  if (x %% 2 == 0){
    y <- x^2
  } else {
    y<- x^3
  }
  return(y)
}

x<-c(1,2,3,4)

square_cube(x) # It doesn't work for a vector! 

 
square_cube_loop <- function(x){

  for(i in 1:length(x))
    if (x[i] %% 2 == 0){
    y[i] <- x[i]^2
  } else {
    y[i]<- x[i]^3
  }
  return(y)
}

y<-NA

square_cube_loop(x)

# map is a function that allows you to operate on entire vectors or 
# data frames in a single step, without using explicit loops.

map(x, square_cube)
unlist(map(x, square_cube))

map_dbl(x, square_cube) # Returns it directly as a numerical vector and not a list
map_chr(x, square_cube) # Returns it as a character vector


# Side note: changing the class of a logical vector into a numeric vector, 
# changes the TRUE for 1 and the FALSE for 0. 
 

w<-c(TRUE, TRUE, FALSE)
w
class(w)
as.numeric(w)


##########################################
### Sampling / Random Number Generator ###
##########################################


# Sampling with Replacement: the following example demonstrates randomly 
# selecting 3 numbers from a range from 1 to 6 with the possibility of 
# picking the same number more than once. 

sample(1:6, 3, replace = TRUE) 


# Sampling without Replacement: the following example demonstrates randomly
# selecting 3 unique numbers from a range of 1 to 6. 
# 

sample(1:6, 3, replace = FALSE) 


# Sampling from a Uniform Distribution: the following example generates 
# 5 random numbers from a uniform distribution between 0 and 1. 

runif(5, 0, 1)

# Sampling from a normal distribution: the following example generates 
# 5 random numbers from a normal distribution (with mean = 0, and sd = 1). 

rnorm(5, 0 , 1)

x<-rnorm(100000, mean = 0, sd = 1)
hist(x)


################## 
### Simulation ###
##################

# Example 1: Simulating rolling a die one time and calculating the probability 
# of getting a 6.

prob_6 <- function(i) {
  y <- sample(1:6, 1, replace = TRUE) == 6
  return(y)
}


# A Monte Carlo simulation is performed to estimate this probability. 
# It's done by running the prob_6 function many times and calculating 
# the proportion of times you get a 6.


results <- map_dbl(1:1000000, prob_6)
mean(results)

######################################### 
############ Do it yourself! ############
#########################################

# 1. Create a function that simulates tossing a fair coin. Then apply a Monte 
#    Carlo simulation to estimate the probability of getting heads. Compare this 
#    result to the theoretical probability of getting heads.




# 2. Create a function that simulates drawing one marble from an urn with 3 red
#    marbles, 5 blue marbles, and 2 yellow marbles. Then apply a Monte 
#    Carlo simulation to estimate the probability of getting a red marble. 
#    Compare this result to the theoretical probability of getting a red marble.




# 3. Create a function that simulates drawing a number from a normal distribution 
#    with mean of 0 and standard deviation of 1. Then apply a Monte 
#    Carlo simulation to estimate the probability of a number being between -1 and 1. 
#    Compare this result to the theoretical probability of a value being between -1 and 1.

