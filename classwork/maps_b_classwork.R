

#######################################################
############## Maps (Part b) - Classwork ##############
#######################################################


#################
### Functions ###
#################

### Why Build Functions?

#   Functions are the building blocks of code. Just as we break down tasks into smaller 
#   steps in everyday life, functions break down complex coding tasks into manageable units. 
#   But why should we bother with building your own functions when so many others exist?

# * Modularity:  Functions help us organize code by grouping related actions together. 
#                This makes our code more structured, easier to read, and simpler to maintain.

# * Reusability: Once you've built a function to perform a specific task, you can use it as 
#                many times as you need without rewriting the same code. This not only saves 
#                time but also reduces the chances of errors.

# * Efficiency:  Functions promote efficient code development by enabling us to focus on 
#                solving specific problems without getting bogged down in larger program logic.

# * Debugging:   When an error occurs, functions help narrow down the problematic part of the 
#                code, making it easier to identify and fix issues.

### Function Syntax

# At its core, a function is a self-contained block of code designed to perform a specific task. Like a recipe, a function takes in ingredients (inputs or arguments) and produces a result (output). Let's break down the basic structure of a function in R:

# Defining a Function
function_name <- function(argument1, argument2, ...) {
  # Code to perform the task
  return(result)
}

# * function_name: Choose a meaningful name for your function, describing what it does.
# * argument1, argument2, ...: These are placeholders for the values (arguments) that the function will work with.
# * return(result): After performing the task, the function uses the return statement to provide the result.


################################################################################ 
### Example 1: Computing the predicted number of calories required by humans ###
################################################################################

# BMR estimation formulas: The Mifflin St Jeor equation for woman: 
# predicted calories = 10*weight(in kg) + 6.25*height(in cm) - 5*age(in years) + s
# where s is a constant equal to -161 for women and 5 for men. 



calories_women <- function(weight, height, age){
  calories <- (10 * weight) + (6.25 * height) - (5 * age) - 161
  return(calories)
}

calories_women(weight = 65, height = 170, age = 35)
calories_women(65, 170, 35)


# Using default values
calories_women_fixed <- function(weight, height, age = 30){
  calories <- (10 * weight) + (6.25 * height) - (5 * age) - 161
  return(calories)
}  

calories_women_fixed(weight = 65, height = 170)
calories_women_fixed(weight = 65, height = 170, age = 35)


###################################################
### Example 2: Find the max between two numbers ###
###################################################

## Takes in two number inputs

find_max <- function(a, b) {
  if (a > b) {
    return(a)
  } else {
    return(b)
  }
}

find_max(1,2)
find_max(5,3)
find_max(6,6)

#####################################
### Example 3: Checks even or odd ###
#####################################

## Take in one number as the input

check_even_odd <- function(num) {
  if (num %% 2 == 0) {
    return("Even")
  } else {
    return("Odd")
  }
}

check_even_odd(71)
check_even_odd(50)



########################################################
#################### Do it yourself ####################
########################################################


# 1. Create a function (like Example 1) that computes the predicted number of calories 
#    required by men.Your arguments should be weight (in kg), height (in cm) and age (in years).



# 2. Create a function that computes the circumference of a circle. Your arguments should be 
#    the radius of the circle. 


# 3. Create a function that computes the mean of a vector. Do not use the function mean. 
#    Create your own function. The arguments should be a vector of numbers of any length. 


# 4. Repeat part 2, but now create a message that says "Error! your vector is not numeric". 
#    This will account for cases in which the vector is a character vector. 



# 5. Create a function that returns the median and the mean of a vector. The output should 
#    be a vector such that the first element of the vector is the mean and the second 
#    element is the median. The arguments should be a numeric vector. 



# 6. Create a function that returns the standard deviation of a numeric vector. Do not use
#    the function var in your computations. The output should be a number that represents 
#    the variance. The arguments should be a numeric vector. 