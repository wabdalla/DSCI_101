
##################################
##### Coding Basics - Part 1 #####
##################################

### Comments

# This is how you make a comment!


### Installing a package

install.packages("mdsr")


### Reading a package

library(mdsr)

### Vectors

x<-c(4,1,3,8,6,7,5,3,0,9)

y<-c(1,2,3,4,5,6,7,8,9,10)
y_1 <- 1:10

z<-c("x.1", "x.2", "x.3", "x.4", "x.5")
z_1<-paste("x", 1:5, sep = ".")


### Matrices

s<-matrix(c(4,6,7,8,9,10), ncol =2, byrow = TRUE)
w<-matrix(1:9, ncol = 3, byrow = TRUE)



##### Subsetting Vectors: allows you to extract specific elements from a vector.

x[1] ## first element
x[1:5] ## first 5 using the colon


##### Vector Operations

x + y
1 / x


##########################
##### Do it yourself #####
##########################

# 1. Assign an a value of 30 to an object named age. 

age<-30


# 2. Create a vector named vector_1 with the following numbers 
#    (in that order): 11, 2, 9, 8, 10, 9, 0

vector_1 <- c(11, 2, 9, 8, 10, 9, 0)
vector_1


# 3. Extract the third element from vector vector_1 (in part 2) 
#    by subsetting the vector.

vector_1[3]

# 4. Extract the second to the fifth element from vector vector_1 
#    (in part 2) by subsetting the vector.

vector_1[2:5] 


# 5. Create a vector named vector_2 of 7 elements that go from 2 to 8. 

vector_2 <- 2:8
vector_2

# 6. Multiply vectors vector_1 and vector_2 and save it as an object named vector_3. 
#    Notice how the multiplication is performed?
vector_3 <- vector_1*vector_2
vector_3

# 7. Create a vector named h with the "paste" function such that the elements 
#    names are 3w, 4w, 5w, ..., 10w


h <- paste( 3:10, "w", sep = "")
h


# 8. Create a matrix named matx that has 4 columns with the strings of values 
#    from 1 to 12 by column. The matrix should look like:
#   1    4    7   10
#   2    5    8   11
#   3    6    9   12

matx <- matrix(c(1:12), ncol = 4, byrow = FALSE)
matx

