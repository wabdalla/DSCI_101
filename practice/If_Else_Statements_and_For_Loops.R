
############################################
##### If/else Statements and For Loops #####
############################################


###########################
### Boolean Expressions ###
###########################


# Example 1


s <- 5
m <- 5

s == m
s < m
s != m
s >= m

# Example 2

x <- c(4,5,6,7)
y <- 4:7
z <- c(4, 5, 7, 9)

x == y
x == z
x != z
x > 6
x <= 5

#####################
### If Statements ###
#####################

# Example 3

sky <- "sunny"

if (sky == "sunny"){
  print("Leave your umbrella at home!")
}

sky <- "cloudy"
if (sky == "sunny"){
  print("Leave your umbrella at home!")
}

# Example 4
number <- 5

if(number > 0){
  print("It's a Positive Number")  
}

number <- -5

if(number > 0){
  print("It's a Positive Number")  
}

##########################
### If/Else Statements ###
##########################

# Example 5

number <- -3

if (number > 0) {
  print("The number is positive.")
} else if (number < 0) {
  print("The number is negative.")
} else {
  print("The number is zero.")
}

# Example 6 

age<-18

if(age < 16){
  print("You are too young to drive")
}else if (age>=16 & age <=17){
  print("you need written consent from your parents")
}else if (age>=18){
  print("no age restriction to get a license")  
}

######################### 
### ifelse() Function ###
#########################

# Example 7

numbers <- c(-2, 3, 0, -5, 7)
positive_indicator <- ifelse(numbers > 0, "Positive", "Not Positive")
numbers
positive_indicator

# Example 8

numbers_2<-c(5, -2, 0)
eval_5 <- ifelse(numbers_2>=5, "Greater or equal to 5", "Smaller than 5")
numbers_2
eval_5


################# 
### For Loops ###
#################

# Example 9

for (i in 1:5){
  print(i)
}


# Example 10

for (i in c(2, 3, 5)){
  print(i+1)
}

# Example 11

for (i in c("Mike", "Mary", "Tom")){
  print(paste(i, "works at Loyola", sep = " - "))
}

# Example 12

student_names<-c("Rohan", "Ana", "Amir")

for (i in 1:3) {
  print(paste("Student", i, "is", student_names[i], sep = " "))
}

# Example 13

x <- matrix(c(9, 0, 3, 17, 5, 2), ncol = 3, byrow = FALSE)
y<-NA
for(i in 1:3){
  y[i] <- mean(x[,i])
}
y

##########################
##### Do it yourself #####
##########################

# 1. Create a matrix (called m) that looks like this: 
# 6  8  7  2
# 9 -2 -1  0 
# 0  5  7  7
# 8  8  5  9



# 2. Using a for loop, compute the mean for each row and save it in a vector called r.



# 3. Using a for loop, compute the min value for each column and save it in a vector called s.



# 4. Define two different objects a and b such that each one is any number. Create an if-else statement 
# that prints the largest of the two values. In the case of them being equal, it should print that the 
# two numbers are equal. 




# 5. Repeat # 4, only now use the "paste" function to be more explicit when you print. 
# For example, if a = 5, and b = 6, you should print "The larger number is 6"
# In the case of them being equal, you should print, for example "The two numbers, 6 and 6, are equal". 



# 6. Define vector_1 having elements 1, 2, 3, 4, 5, 6, 7. Then define 
#    vector_2 having elements 2, 1, 5, 5, 5, 7, 1. Use an ifelse() function 
#    that compares the elements of these two vectors and returns 
#    "Element in vector 1 is greater or equal" (when the element in vector_1
#    is greater or equal to the corresponding element in vector_2) and 
#    returns "Element in vector 2 is greater" when the element in vector_2 is 
#    greater than the corresponding element in vector_1. 



# 7. Suppose you have 5 students in a classroom. Let the vector "stud_name" represent these student's names. 
# Let vectors "exam_1" and "exam_2" be two vectors with their respective scores in Exams 1 & 2. 

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

