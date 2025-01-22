
###################################
##### Coding Basics - Part 2b #####
###################################


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



# 2. What is the class of vector_1?


# 3. Apply the function summary to vector_1. Notice the output this function provides.


# 4. Compute the standard deviation for vector_1. 


# 5. Create a vector named vector_2 with the following numbers (in that order): 
#    "11", "2", "9", "8", "10", "9", "0". However, this time define each element in quotations. 



# 6. Apply the function summary to vector_2. Notice the output this function provides.



# 7. Compute the mean of the values in vector_2. What is happening? 


# 8. Change the class of vector_2 to numeric and save it as vector_2. Meaning, 
#    override vector_2 with it's new class.


# 9. Now compute the mean of the values in vector_2? Why were you able to do it now?



# 10. Turn vector_1 into a logical vector and name this new vector, vector_3. 
#     What are you noticing?



# 11. Check the class of vector_3





# 12. Create a dataframe named "people" that looks like this: 
#     Name      Age     Medication      
#     Maria      20     TRUE
#     John       30     FALSE
#     Daisy      18     FALSE
#     Ana        30     FALSE
#     Ken        25     TRUE



# 13. Click on the dataframe you just created on the environment. See what it looks like. 


# 14. Check the classes of each one of the columns of your dataframe. 


# 15. Calculate the mean of the column age. 


# 16. Calculate the maximum value in the column age. 


# 17. Apply the function summary to the column age. 

