
###################################
##### Coding Basics - Part 2a #####
###################################


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



##########################
##### Do it yourself #####
##########################

# 1. Create a vector named vector_1 with the following numbers (in that order): 
#    11, 2, 9, 8, 10, 9, 0



# 2. Extract the fifth element from vector_1 (in part 1) by subsetting the vector.



# 3. Extract elements 1, 5, and 7 from vector_1 (in part 1) by subsetting the vector.





# 4. Create a matrix named matx that has 4 columns with the strings of values 
#     from 1 to 12 by ROW. 
# The matrix should look like: 
# 1   2   3    4
# 5   6   7    8
# 9  10   11   12




# 5. Extract the element in column 3 and row 2 from matrix matx by subsetting the matrix.


# 6. Extract column 4 from matrix matx by subsetting the matrix.



# 7. Extract row 3 from matrix matx by subsetting the matrix.



# 8. Extract row 4 from matrix matx by subsetting the matrix.






