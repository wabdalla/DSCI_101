
####################################
####### Simulations - Part 2 ####### 
####################################


################# 
### Side Note ###
#################

# changing the class of a logical vector into a numeric vector, 
# changes the TRUE for 1 and the FALSE for 0. 

w<-c(TRUE, TRUE, FALSE)
w
class(w)
as.numeric(w)


##############################
### Types of Probabilities ###
##############################

#   1.	Theoretical Probabilities
#   2.	Experimental Probabilities

############################
### Law of Large Numbers ###
############################

#  Law of Large Numbers: In the long run, as the number of 
#  trials increases and increases, the proportion of the outcomes 
#  get closer to the theoretical probability values.


###################
### Simulations ###
###################


### One Flip 

coin_flip <- sample(c("H", "T"), 1)
coin_flip 

### Checking if that flip is "Heads" 
### Heads is the one that you wanted to compute the probability on

check_flip <- coin_flip == "H"
check_flip

### Create a Function that flips the coin once and checks if it is Heads

coin_function <- function(i) {
  coin_flip <- sample(c("H", "T"), 1)
  check_flip <- coin_flip == "H"
  return(check_flip)
}

### Run the function 100000 times - Means you flip the coin 10000 times
### and every time you flip you record if it was a heads or not. 

iterations <- map_dbl(1:100000, coin_function)

### To get the experimental probability, sum the number of times you got
### heads and divide it by the number of times you flipped the coin. 

experimental_prob <- sum(iterations)/length(iterations)
experimental_prob

### Theoretical probability

theoretical_prob <- 1/2

### Theoretical probablity vs experimental 

theoretical_prob - experimental_prob

########################################################
#################### Do it yourself ####################
########################################################


# Exercise 1: You have an urn with 6 marbles: 3 are red, 2 are blue, 
#             and 1 is green. 
#             Compute the experimental probability that the marble 
#             is red with 100000 iterations.  
#             Compare your experimental probability to the theoretical probability. 


marble_function <- function(i){
  drawing_a_marble <- sample(c("red", "red", "red", "blue", "blue", "green"), 1)
  check_marble <- drawing_a_marble == "red"
  return(check_marble)
}

iterations <- map_dbl(1:100000, marble_function)
experimental_prob <- sum(iterations)/length(iterations)
experimental_prob

### Theoretical probability

theoretical_prob <- 3/6

### Theoretical probablity vs experimental 

theoretical_prob - experimental_prob


# Exercise 2: Roll a fair six-sided die once. 
#             Compute the experimental probability that you roll a 6 
#             with 100000 iterations.  
#             Compare your experimental probability to the theoretical probability. 


die_function <- function(i){
  rolling_die <- sample(1:6, 1)
  check_6 <- rolling_die == 6
  return(check_6)
}


iterations <- map_dbl(1:100000, die_function)
experimental_prob <- sum(iterations)/length(iterations)
experimental_prob

### Theoretical probability

theoretical_prob <- 1/6

### Theoretical probablity vs experimental 

theoretical_prob - experimental_prob

# Exercise 3: Roll a fair six-sided die once. 
#             Compute the experimental probability that the outcome 
#             is even with 100000 iterations.  
#             Compare your experimental probability to the theoretical probability. 


die_even_function <- function(i){
  rolling_die <- sample(1:6, 1)
  check_even <- rolling_die %in% c(2,4,6)
  return(check_even)
}

iterations <- map_dbl(1:100000, die_even_function)
experimental_prob <- sum(iterations)/length(iterations)
experimental_prob

### Theoretical probability

theoretical_prob <- 3/6

### Theoretical probablity vs experimental 

theoretical_prob - experimental_prob


# Exercise 4: Generalize the function you created on exercise 1 
#             about drawing a marble from the urn. Only this time, 
#             include outcome as an argument so that you can change
#             it for any color that you want to compute the probability on. 
#             Compute experimental probabilities each one of the colors. 
#             Compare your experimental probability to the theoretical probability. 

marble_function_general <- function(i, outcome){
  drawing_a_marble <- sample(c("red", "red", "red", "blue", "blue", "green"), 1)
  check_marble <- drawing_a_marble == outcome
  return(check_marble)
}

iterations <- map_dbl(1:100000, marble_function_general, outcome = "blue")
experimental_prob <- sum(iterations)/length(iterations)
experimental_prob

### Theoretical probability

theoretical_prob <- 2/6

### Theoretical probablity vs experimental 

theoretical_prob - experimental_prob
