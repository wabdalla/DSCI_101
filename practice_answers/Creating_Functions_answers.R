

##############################
##### Creating Functions #####
##############################


#################
### Functions ###
#################

################################################################################ 
### Example 1: Computing the predicted number of calories required by women ###
################################################################################

calories_women <- function(weight, height, age){
  calories <- (10 * weight) + (6.25 * height) - (5 * age) - 161
  return(calories)
}

calories_women(weight = 65, height = 170, age = 35)
calories_women(65, 170, 35)


# Using default values
calories_women_fixed <- function(weight, height, age = 30){
  calories <- (10 * weight) + (6.25 * height) - (5 * age) - 161
  return(calories)
}  

calories_women_fixed(weight = 65, height = 170)
calories_women_fixed(weight = 65, height = 170, age = 35)


###################################################
### Example 2: Find the max between two numbers ###
###################################################

## Takes in two number inputs

find_max <- function(a,b){
  if(a>b){
    return(a)
  }else if(b>a){
    return(b)
  }else if(b==a){
    return("the two values are equal")
  }
}


find_max(1,2)
find_max(5,3)
find_max(6,6)

##################################################
### Example 3: Computing the Mean from Scratch ###
##################################################

mean_abdalla <- function(x){
  my_mean <- sum(x)/length(x)
  return(my_mean)
}

v <- 1:4
mean_abdalla(v)


########################################################
#################### Do it yourself ####################
########################################################


# 1. Create a function that computes the predicted number of calories 
#    required by men. Your arguments should be weight (in kg), height (in cm) 
#    and age (in years).

#    The formula for men is: 
#    10*weight(in kg) + 6.25*height(in cm) - 5*age(in years) + 5

calories_men <- function(weight, height, age){
  calories <- (10 * weight) + (6.25 * height) - (5 * age) + 5
  return(calories)
}

calories_men(weight = 165, height = 170, age = 35)


# 2. Create a function that computes the circumference of a circle. Your arguments should be 
#    the radius of the circle. 

circumference <- function(r){
  c = 2*pi*r
  return(c)
}

circumference(5)



# 3. Create a function that changes the temperature from Fahrenheit to Celsius.  


fahrenheit_to_celsius <- function(temp_F) {
  temp_C <- (temp_F - 32) * (5 / 9)
  return(temp_C)
}
fahrenheit_to_celsius(32)


# 4. Create a function that changes the temperature from Celsius to Fahrenheit.  

celsius_to_fahrenheit <- function(temp_c) {
  temp_F <- temp_c*(9/5) + 32
  return(temp_F)
}

celsius_to_fahrenheit(0)

# 5. Create a function such that, the arguments are the temperature. The function 
#    must tell us that: "It's freezing", if the temperature is at or below 0, 
#                       "It's cold", if the temperature is higher than 0, but lower or equal to 10, 
#                       "It's cool", if the temperature is higher than 10, but lower or equal to 20, 
#                       "It's warm", if the temperature is higher than 20, but lower or equal to 30, 
#                       "It's hot", if the temperature is higher than 30. 

temperature_check<-function(temp){
  if (temp <= 0) {
    c<-"freezing"
  } else if (temp > 0 & temp <= 10) {
    c<-"cold"
  } else if (temp > 10 & temp <= 20) {
    c<-"cool"
  } else if (temp > 20 & temp <= 30) {
    c<-"warm"
  } else {
    c<-"hot"
  }
  return(c)
}

temperature_check(32)

# 6. Create a function that returns the median and the mean of a vector. The output should 
#    be a vector such that the first element of the vector is the mean and the second 
#    element is the median. The arguments should be a numeric vector. 

mean_median <- function(vector){
  mean_1 <- mean(vector)
  median_1 <- median(vector)
  output <- c(mean_1, median_1)
  return(output)
}

s<-c(1,54,67,1,4,5,8)
mean_median(s)

# 7. Create a function that returns the standard deviation of a numeric vector. Do not use
#    the function sd or var in your computations. The output should be a number that represents 
#    the standard deviation. The arguments should be a numeric vector. 

# Steps to compute the standard deviation: 
# 1. average all the values in the dataset. 
# 2. subtract the mean from every value in the dataset. 
# 3. square every value that you got in part 2. 
# 4. sum all the values you got in part 3.
# 5. divide what you got in part 4 by the number of elements in the data minus 1. 
# 6. Take the square root of what you got in part 5. This is the standard deviation. 

sd_abdalla <- function(vector_1){
  part_1<-mean(vector_1)
  part_2<-vector_1-part_1
  part_3<-part_2^2
  part_4<-sum(part_3)
  part_5<-part_4/(length(vector_1)-1)
  part_6<-sqrt(part_5)
  
  return(part_6)
  
}
# Once you build your function, test it with any vector. Then use sd() function to compare 
# the results. 

sd_abdalla(s)
sd(s)
