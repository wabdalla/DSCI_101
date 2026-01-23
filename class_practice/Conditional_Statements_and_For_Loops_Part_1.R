
################################################
##### Conditional Statements and For Loops #####
#################### Part 1 ####################
################################################

#################
### Functions ###
#################

# Example 1

x <- c(1,1,3,5,5,6,7)

mean(x)

min(x)

sd(x)

###########################
### Boolean Expressions ###
###########################

# Example 2

s <- 5
m <- 5

s == m
s < m
s != m
s >= m

# Example 3

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

# Example 4

sky <- "sunny"
if (sky == "sunny"){
  print("Leave your umbrella at home!")
}

sky <- "cloudy"
if (sky == "sunny"){
  print("Leave your umbrella at home!")
}

# Example 5

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

# Example 6

number <- -3

if (number > 0) {
  print("The number is positive.")
} else if (number < 0) {
  print("The number is negative.")
} else {
  print("The number is zero.")
}

# Example 7 

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

# Example 8

numbers <- c(-2, 3, 0, -5, 7)
positive_indicator <- ifelse(numbers > 0, "Positive", "Not Positive")
numbers
positive_indicator

# Example 9

numbers_2<-c(5, -2, 0)
eval_5 <- ifelse(numbers_2>=5, "Greater or equal to 5", "Smaller than 5")
numbers_2
eval_5



##########################
##### Do it yourself #####
##########################

# 1. Create a vector named vec_1 with the following 
#    numbers (in that order): 
#    11, 2, 9, 8, 10, 9, 0



# 2. Apply the function summary to vec_1 Notice the 
#    output this function provides.




# 3. Compute the standard deviation for vec_1 



# 4. Create a vector named vec_2 with the following numbers 
#    (in that order): 
#    "11", "2", "9", "8", "10", "9", "0". 
#    However, this time define each element in quotations. 



# 5. Apply the function summary to vec_2. Notice the output 
#    this function provides.





# 6. Compute the mean of the values in vec_2. What is happening? 



# 7. Suppose a dataframe named "people" that looks like this:
#     Name      Age     Medication      
#     Maria      20     TRUE
#     John       30     FALSE
#     Daisy      18     FALSE
#     Ana        30     FALSE
#     Ken        25     TRUE

# Calculate the mean of the column age.

people<-data.frame(Name = c("Maria", "John", "Daisy", "Ana", "Ken"), 
                   Age = c(20, 30, 18, 30, 25), 
                   Medication = c(TRUE, FALSE, FALSE, FALSE, TRUE))



 


# 8. Calculate the maximum value in the column age 
#    (from people dataframe). 



# 9. Define two different objects a and b such that each one 
#    is any number. Create an if-else statement that prints 
#    the largest of the two values. In the case of them being
#    equal, it should print that the two numbers are equal. 




# 10. Repeat # 9, only now use the "paste" function to be 
#     more explicit when you print. For example, if a = 5, 
#     and b = 6, you should print "The larger number is 6".
#     In the case of them being equal, you should print, 
#     for example "The two numbers, 6 and 6, are equal". 


# 11. Define vector_1 having elements 1, 2, 3, 4, 5, 6, 7. 
#    Then define vector_2 having elements 2, 1, 5, 5, 5, 7, 1. 
#    Use an ifelse() function that compares the elements of 
#    these two vectors and returns "Element in vector 1 is 
#    greater or equal" (when the element in vector_1 is greater 
#    or equal to the corresponding element in vector_2) and 
#    returns "Element in vector 2 is greater" when the element 
#    in vector_2 is greater than the corresponding element 
#    in vector_1. 


