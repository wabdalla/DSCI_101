
##################################
##### Coding Basics - Part 1 #####
##################################

### Comments

# This is how you make a comment!


### Reading a package

library(mdsr)

### Vectors

x<-c(4,1,3,8,6,7,5,3,0,9)

x


y <- 1:10
y 


z<-paste("x", 1:5, sep = ".")

z

# Another way is to write each element.
z_1<-c("x.1", "x.2", "x.3", "x.4", "x.5")


##########################
##### Do it yourself #####
##########################

# 1. Assign a value of 30 to an object named age. 

age<-30

# OR age<-c(30) also works. 


# 2. Create a vector named vector_1 with the following numbers 
#    (in that order): 11, 2, 9, 8, 10, 9, 0

vector_1 <- c(11, 2, 9, 8, 10, 9, 0)
vector_1

# 3. Create a vector named vector_2 of 7 elements that go from 2 to 8. 
vector_2<-2:8
vector_2

# 4. Sum vectors vector_1 and vector_2 and save it as an object named vector_3. 
#    Notice how the sum is performed.

vector_3 <- vector_1 + vector_2
vector_3

# The sum was performed elementwise. 

# 5. Create a vector named h with the "paste" function such that the elements 
#    names are 3w, 4w, 5w, ..., 10w

h<-paste(3:10, "w", sep = "")

