
##################################
##### Coding Basics - Part 2 #####
##################################

###############
### Vectors ###
###############

# Example 1

x<-c(4,1,3,8,6,7,5,3,0,9)
x

y <- 1:10
y 

z<-paste("x", 1:5, sep = ".")
z

################
### Matrices ###
################

# Example 2

s<-matrix(c(4,6,7,8,9,10), ncol =2, byrow = TRUE)
s

w<-matrix(1:9, ncol = 3, byrow = TRUE)
w



########################## 
### Subsetting Vectors ###
##########################

# Example 3

vector_1 <- c(2,3,4,5,5,6)

vector_1[3]
vector_1[4:6]



###########################
### Subsetting Matrices ###
###########################

# Example 4

matrix_1<-matrix(c(5,6,7,2,3,6), ncol = 2, byrow = FALSE)

matrix_1[3,1]
matrix_1[1,2]
matrix_1[ ,2]
matrix_1[ ,1]
matrix_1[2, ]


##########################
##### Do it yourself #####
##########################


# 1. Create a vector named vector_2 with the following numbers 
#    (in that order): 11, 2, 9, 8, 10, 9, 0

vector_2<-c(11, 2, 9, 8, 10, 9, 0)


# 2. Extract the third element from vector vector_2 (in part 1) 
#    by subsetting the vector.

vector_2[3]

# 3. Extract the second to the fifth element from vector vector_2 
#    (in part 1) by subsetting the vector.

vector_2[2:5]


# 4. Create a vector named vector_3 of 7 elements that go from 2 to 8. 

vector_3 <-2:8

# 5. Extract elements 1, 5, and 7 from vector_3 (in part 4) by 
#    subsetting the vector.

vector_3[c(1,5,7)]


# 6. Create a matrix named matx_1 that has 4 columns with the 
#    strings of values from 1 to 12 by column. The matrix should 
#    look like:
#   1    4    7   10
#   2    5    8   11
#   3    6    9   12


matx_1 <- matrix(c(1,2,3,4,5,6,7,8,9,10,11,12), ncol = 4, byrow = FALSE)
matx_1

# 7. Create a matrix named matx_2 that has 4 columns with the 
# strings of values from 1 to 12 by ROW. 
# The matrix should look like: 
# 1   2   3    4
# 5   6   7    8
# 9  10   11   12

matx_2 <-matrix(c(1,2,3,4,5,6,7,8,9,10,11,12), ncol = 4, byrow = TRUE)
matx_2

# 8. Extract the element in column 3 and row 2 from matrix matx_1 
#    by subsetting the matrix.

matx_1[2,3]

# 9. Extract column 4 from matrix matx_1 by subsetting the matrix.

matx_1[,4]

# 10. Extract row 3 from matrix matx_2 by subsetting the matrix.

matx_2[3,]

# 11. Extract row 4 from matrix matx_2 by subsetting the matrix.

matx_2[4,]

# Why did you get an error?


