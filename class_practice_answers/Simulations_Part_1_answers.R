
####################################
####### Simulations - Part 1 ####### 
####################################

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


#######################
### Sample Function ###
#######################

# In class, I used student names to illustrate this. But I swapped it 
# for a numeric vector. 

# Sec. 001
Students_001 <- 1:20
sample(Students_001, 5) # Randomly sampling 5 students from 20 students in sec 001.


# Sec. 002
Students_002 <- 1:36
sample(Students_002, 5) # Randomly sampling 5 students from 36 students in sec 002.


########################################################
#################### Do it yourself ####################
########################################################

# Set up the sample function for each of the examples discussed in class
# such that you simulate one trial. i.e. one flip, drawing ONE marble, 
# or rolling the die once. Save the result as a vector. 
# Then add one more line of code, to check whether that sample meets the 
# criteria you want to put to the test.The outcome of the test should be 
# TRUE or FALSE. Save this result as a vector. 

# Exercise 1: Flipping a coin once. Check if coin is head.  


coin_flip <- sample(c("H", "T"), 1)
check_flip <- coin_flip == "H"

coin_flip
check_flip


# Exercise 2: You have an urn with 6 marbles: 3 are red, 2 are blue, 
#             and 1 is green. You draw one marble at random from the urn, 
#             Check if marble is red.

drawing_a_marble <- sample(c("red", "red", "red", "blue", "blue", "green"), 1)
check_marble <- drawing_a_marble == "red"

drawing_a_marble
check_marble

# Exercise 3: Roll a fair six-sided die once. Check if the outcome is a 6. 

rolling_die <- sample(1:6, 1)
check_6 <- rolling_die == 6

rolling_die
check_6

# Exercise 4: Roll a fair six-sided die once. Check if the outcome is an even number. 


rolling_die <- sample(1:6, 1)
check_even <- rolling_die %in% c(2,4,6)

rolling_die
check_even

