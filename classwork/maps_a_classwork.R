#######################################################
############## Maps (Part a) - Classwork ##############
#######################################################

library(tidyverse)

########################################
### Loops and Conditional Statements ###
########################################

#################
### For Loops ###
#################

### For Loops: it's a fundamental programming construct that allows you 
#              to repeat a block of code a specified number of times. It's 
#              especially useful when you need to perform the same operation 
#              multiple times or iterate over a sequence of elements, such 
#              as elements in a list, vector, or data frame.

# The basic structure of a for loop looks like this:

for (variable in sequence) {
  # code to be executed in each iteration
}



# Here's a breakdown of the components:

# * variable: This is a variable that takes on each value in the 
#             sequence during each iteration of the loop.
# * sequence: This defines the range or collection of values that 
#             the loop will iterate over. It could be a sequence of 
#             numbers (1:10), a vector, a list, or any other iterable 
#             data structure.

# * The code block within the curly braces {} contains the operations 
#   you want to perform in each iteration of the loop.


# Examples of for loops


# Consecutive indexes
for (i in 1:10){
  print(i)
}

for (i in 10:1){
  print(i)
}

# Don't need to be consecutive!
for (i in c(2, 3, 5, 7, 11)){
  print(i)
}

## Doesn't have to be a number can be a vector of strings
for (i in c("mike", "mary", "tom", "sue")){
  print(i)
}

## Create a for loop to print the following information: 
# Student 1 is Rohan
# Student 2 is Emilia
# Student 3 is Amir
# Student 4 is Bolin
# Student 5 is Ana


student_names<-c("Rohan", "Emilia", "Amir", "Bolin", "Ana")
student_names
student_names[1]


for (i in 1:5) {
  print(paste("Student", i, "is", student_names[i]))
}


## Doing computations with for loops

x <- matrix(c(9, 0, 3, 17, 5, 2), ncol = 3)
x


# Compute the average of each column and save it into a vector called y 

for(i in 1:3){
  y[i] <- mean(x[,i])
}
y

##############################
### Conditional Statements ###
##############################

# Conditional statements are an essential part of programming that 
# allow you to control the flow of your code based on certain conditions. 
# In R, there are primarily three ways to implement conditional statements: 
# `if`, `if else`, and the `ifelse()` function.

#### If Statements

# The if statement allows you to execute a block of code only if a given 
# condition is true. 


sky <- "sunny"

if (sky == "sunny"){
  print("Leave your umbrella at home!")
}

sky <- "cloudy"


if (sky == "sunny"){
  print("Leave your umbrella at home!")
}


#### If-Else Statements

# The if else statement extends the if statement to execute different 
# blocks of code based on whether a condition is true or false. 


number <- -3

if (number > 0) {
  print("The number is positive.")
} else if (number < 0) {
  print("The number is negative.")
} else {
  print("The number is zero.")
}


#### Ifelse Function

# This is for when you want to use if else statements repeatedly to 
# return a vector.


numbers <- c(-2, 3, 0, -5, 7)
positive_indicator <- ifelse(numbers > 0, "Positive", "Not Positive")

numbers
positive_indicator


########################################################
#################### Do it yourself ####################
########################################################

# 1. Create a matrix (called m) that looks like this: 
# 6  8  7  2
# 9 -2 -1  0 
# 0  5  7  7
# 8  8  5  9




# 2. Using a for loop, compute the mean for each row and save it in a vector called r.



# 3. Using a for loop, compute the min value for each column and save it in a vector 
#    called s.



# 4. Define two different objects a and b such that each one is any number. Create an 
#    if-else statement that prints the largest of the two values. In the case of them being 
#    equal, it should print that the two numbers are equal. 



# 5. Repeat # 4, only now use the "paste" function to be more explicit when you print. 
#    For example, if a = 5, and b = 6, you should print "The larger number is 6"
#    In the case of them being equal, you should print, for example,
#    "The two numbers, 6 and 6, are equal". 



# 6. Suppose you have 5 students in a classroom. Let the vector "stud_name" represent 
#    these student's names. Let vectors "exam_1" and "exam_2" be two vectors with their 
#    respective scores in Exams 1 & 2. 

stud_name <- c("Emily", "John", "Steve", "Mike", "Sarah")
exam_1<-c(90, 50, 45, 52, 100)
exam_2<-c(100, 50, 40, 40, 100)

# A student passes if they have an average score of 50. They fail if they have their average score is below 50. 
# And they will be granted an extension if their average score is exactly 50. 
# Create a for loop combined with if-else statements that computes each students average score in the class. 
# Within the for loop, it should be printed whether each student passed, failed, or will be granted an extension.
# The final output should look like: 
# "Emily passed the class with an average of 95. 
# "John will be granted an extension in the class with an average of 50... etc.



