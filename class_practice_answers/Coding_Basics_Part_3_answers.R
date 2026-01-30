
##################################
##### Coding Basics - Part 3 #####
##################################


###########################
### Classes (Data Type) ###
###########################

# Example 1

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


# Example 2
vector_2 <- c("3", "5", "7", "9")
class(vector_2)

vector_2<-as.numeric(vector_2)
class(vector_2)

##################
### Dataframes ###
##################

# Example 3

demographics <- data.frame( age = c(18, 18, 19, 20, 18), 
                            month = c(1, 2, 5, 12, 1), 
                            year = c(2006, 2006, 2005, 2004, 2006)) 
# Example 4

df <- data.frame(V1= 1:5, 
                 V2 = rep(1,5), 
                 V3 = seq(1, 9, 2))

# Example 5

demographics$year

# Example 6
class(df$V2)


##########################
##### Do it yourself #####
##########################

# 1. Create a vector named vec_1 with the following 
#    numbers (in that order): 
#    11, 2, 9, 8, 10, 9, 0

vec_1 <- c(11, 2, 9, 8, 10, 9, 0)


# 2. What is the class of vec_1?

class(vec_1)
# It's numeric. 






# 3. Create a vector named vec_2 with the following numbers 
#    (in that order): 
#    "11", "2", "9", "8", "10", "9", "0". 
#    However, this time define each element in quotations. 


vec_2<-c("11", "2", "9", "8", "10", "9", "0")

# 4. What is the class of vec_2?

class(vec_2)

# Character

# 5. Since the class of vec_2 is character, you cannot make
#    math computations with it. Change the class of vec_2 to 
#    numeric and save it as vec_2. Meaning, override vec_2 
#    with it's new class.

vec_2<-as.numeric(vec_2)
class(vec_2)


# 6. Turn vec_1 into a logical vector and name this new 
#     vector, vec_3. 
#     What are you noticing?

vec_3 <- as.logical(vec_1)

# All non-zero values became TRUE, and zero values became FALSE


# 7. Check the class of vec_3.

class(vec_3)

# Logical


# 8. Create a dataframe named "people" that looks like this: 
#     Name      Age     Medication      
#     Maria      20     TRUE
#     John       30     FALSE
#     Daisy      18     FALSE
#     Ana        30     FALSE
#     Ken        25     TRUE

people<-data.frame(Name = c("Maria", "John", "Daisy", "Ana", "Ken"), 
                   Age = c(20, 30, 18, 30, 25), 
                   Medication = c(TRUE, FALSE, FALSE, FALSE, TRUE))

# 9. Click on the dataframe you just created on the 
#    environment. See what it looks like. 


# 10. Check the classes of each one of the columns of your 
#     dataframe called "people" (from part 8). 

class(people$Name)
class(people$Age)
class(people$Medication)



