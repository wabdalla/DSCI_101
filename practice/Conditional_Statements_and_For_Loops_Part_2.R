
################################################
##### Conditional Statements and For Loops #####
#################### Part 2 ####################
################################################

################# 
### For Loops ###
#################

# Example 1

for (i in 1:5){
  print(i)
}


# Example 2

for (i in c(2, 3, 5)){
  print(i+1)
}

# Example 3

for (i in c("Mike", "Mary", "Tom")){
  print(paste(i, "works at Loyola", sep = " - "))
}

# Example 4

student_names<-c("Rohan", "Ana", "Amir")

for (i in 1:3) {
  print(paste("Student", i, "is", student_names[i], sep = " "))
}

# Example 5

x <- matrix(c(9, 0, 3, 17, 5, 2), ncol = 3, byrow = FALSE)
y<-NA
for(i in 1:3){
  y[i] <- mean(x[,i])
}
y


##########################
##### Do it yourself #####
##########################


# 1. Define a character vector with the words "one", 
#    "two", "three". Then, using that vector, write 
#    a for loop that prints:
#    "The numerical value of one is 1"
#    "The numerical value of two is 2"
#    "The numerical value of three is 3"




# 2. Create a matrix (called m) that looks like this: 
# 6  8  7  2
# 9 -2 -1  0 
# 0  5  7  7
# 8  8  5  9



# 3. Using a for loop, compute the mean for each row and save it in a vector called r.



# 4. Using a for loop, compute the min value for each column and save it in a vector called s.




# 5. Suppose you have 5 students in a classroom. Let the vector "stud_name" represent these student's names. 
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


