
##################################
##### Coding Basics - Part 2 #####
##################################


####################################### 
### Subsetting Vectors and Matrices ###
#######################################

# Example 1

vector_0 <- c(2,3,4,5,5,6)

vector_0[3]
vector_0[4:6]

# Example 2

matrix_1<-matrix(c(5,6,7,2,3,6), ncol = 2, byrow = FALSE)

matrix_1[3,1]
matrix_1[1,2]
matrix_1[ ,2]
matrix_1[ ,1]
matrix_1[2, ]

###########################
### Classes (Data Type) ###
###########################

# Example 3

x <- c(1,2,3,4,5)
class(x)

y <- c("mary", "joe", "john")
class(y)

k <- c("1", "2", "3")
class(k)

z <- factor(c("A", "B", "C", "A", "A", "B"))
class(z)

w <- c(FALSE, TRUE, TRUE)
class(w)


# Example 4
vector_2 <- c("3", "5", "7", "9")
class(vector_2)

vector_2<-as.numeric(vector_2)
class(vector_2)

##################
### Dataframes ###
##################

# Example 5

demographics <- data.frame( age = c(18, 18, 19, 20, 18), 
                            month = c(1, 2, 5, 12, 1), 
                            year = c(2006, 2006, 2005, 2004, 2006)) 
# Example 6

df <- data.frame(V1= 1:5, 
                 V2 = rep(1,5), 
                 V3 = seq(1, 9, 2))

# Example 7

demographics$year

# Example 8
class(demographics$month)

#################
### Functions ###
#################

# Example 9

x <- c(1,1,3,5,5,6,7)
mean(x)
min(x)
sd(x)



##########################
##### Do it yourself #####
##########################

# 1. Create a vector named vector_1 with the following numbers (in that order): 
#    11, 2, 9, 8, 10, 9, 0

vector_1 <- c(11, 2, 9, 8, 10, 9, 0)
vector_1

# 2. Extract the fifth element from vector_1 (in part 1) by subsetting the vector.

vector_1[5]

# 3. Extract elements 1, 5, and 7 from vector_1 (in part 1) by subsetting the vector.

vector_1[c(1,5,7)]

# 4. What is the class of vector_1?
class(vector_1)

# 5. Apply the function summary to vector_1. Notice the output this function provides.
summary(vector_1)

# 6. Compute the standard deviation for vector_1. 
sd(vector_1)

# 7. Create a vector named vector_2 with the following numbers (in that order): 
#    "11", "2", "9", "8", "10", "9", "0". However, this time define each element in quotations. 

vector_2 <- c("11", "2", "9", "8", "10", "9", "0")
vector_2

# 8. Apply the function summary to vector_2. Notice the output this function provides.
summary(vector_2)


# 9. Compute the mean of the values in vector_2. What is happening? 
mean(vector_2)

# 10. Change the class of vector_2 to numeric and save it as vector_2. Meaning, 
#    override vector_2 with it's new class.
vector_2 <- as.numeric(vector_2)

# 11. Now compute the mean of the values in vector_2? Why were you able to do it now?

mean(vector_2)

# 12. Turn vector_1 into a logical vector and name this new vector, vector_3. 
#     What are you noticing?

vector_3<-as.logical(vector_1)

# 13. Check the class of vector_3
class(vector_3)

# 14. Create a matrix named matx that has 4 columns with the strings of values 
#     from 1 to 12 by column

matx <- matrix(c(1:12), ncol = 4, byrow = FALSE)
matx

# 15. Extract the element in column 3 and row 2 from matrix matx by subsetting the matrix.
matx[2,3]

# 16. Extract column 4 from matrix matx by subsetting the matrix.
matx[,4]


# 17. Extract row 3 from matrix matx by subsetting the matrix.
matx[3,]


# 18. Extract row 4 from matrix matx by subsetting the matrix.
matx[4,]


# 19. Create a dataframe named "people" that looks like this: 
#     Name      Age     Medication      
#     Maria      20     TRUE
#     John       30     FALSE
#     Daisy      18     FALSE
#     Ana        30     FALSE
#     Ken        25     TRUE

people <- data.frame(Name = c("Maria", "John", "Daisy", "Ana", "Ken"),
                     Age = c(20,30,18,30,25), 
                     Medication = c(TRUE, FALSE, FALSE, FALSE, TRUE))

# 21. Click on the dataframe you just created on the environment. See what it looks like. 

# 22. Check the classes of each one of the columns of your dataframe. 
class(people$Name)
class(people$Age)
class(people$Medication)

# 23. Calculate the mean of the column age. 
mean(people$Age)

# 24. Calculate the maximum value in the column age. 
max(people$Age)

# 25. Apply the function summary to the column age. 
summary(people$Age)
