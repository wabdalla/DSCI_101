
######################################################
####### Introduction to Map Functions - Part 1 ####### 
######################################################

library(tidyverse)
library(Lahman)
library(babynames)

#############################
### Vectorized Operations ###
#############################

# The fundamental architecture of R is based on vectors.

# Example: A function is defined, which squares a number if it's 
#          greater or equal to 0 and cubes it otherwise. 

square_cube <- function(x){
  if (x>=0){
    y <- x^2
  } else {
    y<- x^3
  }
  return(y)
}

numbers<-c(1,-2,-3,4)

square_cube(numbers) 

# Why doesn't it work??  


square_cube_loop <- function(x){
  
  for(i in 1:length(x))
    if (x[i]>= 0){
      y[i] <- x[i]^2
    } else {
      y[i]<- x[i]^3
    }
  return(y)
}

y<-NA

square_cube_loop(numbers)


map(numbers, square_cube) # Gives output back as a list
unlist(map(numbers, square_cube)) # We use unlist, so it gives the output back as a vector.


####################
### Reading Data ###
####################


illustration_data <- Teams %>% 
  select(25:30) # Selecting columns 25 to 30 because they are numeric columns


#######################
### map() Functions ###
#######################

# What is the issue here?

median(illustration_data)

## Map Functions: allow you to apply a function to each element of 
#       a list, vector, or dataframe. Map functions allow you to 
#       operate on entire vectors or data frames in a single step, 
#       without using explicit loops.



map(illustration_data, median)
unlist(map(illustration_data, median))


example_1 <- map_dbl(illustration_data, median) # Returns it directly as a numerical vector and not a list
example_2 <- map_chr(illustration_data, median) # Returns it as a character vector
example_3 <- map_dfr(illustration_data, median) # Returns it as a dataframe



# Map Functions when you have to use arguments
map_dbl(illustration_data, median, na.rm = TRUE) 

# Another notation:
map_dbl(illustration_data, \(x) median(x, na.rm = TRUE))



#####################################################################
### More Examples - Map Function - Iterating Over a Single Vector ###
#####################################################################

# This section demonstrates how to iterate over a single vector 
# using mapping functions.

# Data Example: Using the Teams dataset pull out the teams associated 
#     with the now Angels franchise ("ANA") and find the first and 
#     last year they played.

illustration_data_2 <- Teams %>% 
  filter(franchID == "ANA") %>% 
  group_by(teamID, name) %>%
  summarize(began = first(yearID), ended = last(yearID)) %>% 
  arrange(began)

illustration_data_2


# Example: we want to find out the number of characters in the team name.


map_dbl(illustration_data_2, str_length) # Why doesn't it work?
map_dbl(illustration_data_2$name, str_length) 
map_dfr(illustration_data_2, str_length)



######################################################################    
### More Examples - Map Function - Iterating Over Our Own Function ###
######################################################################

# Below is a function called `top5`. This function takes a team name 
# and a dataset, filters the dataset for that team, selects specific 
# columns, sorts by wins (W), and returns the top 5 records. 


top5 <- function(team_name, data) {
  output <- data %>%
    filter(name == team_name) %>%
    select(teamID, yearID, W, L, name) %>%
    arrange(desc(W)) %>%
    head(n = 5)
  return(output)
}


# Let's apply this function to the "New York Yankees".

top5(team_name = "New York Yankees", data = Teams)



map_dfr(illustration_data_2$name, top5, Teams)



# This code calculates the average number of wins for the top 5 
# seasons of each team in the "angels_names" vector. The result is 
# combined into a single data frame using `map_dfr()`. Then, it groups 
# the data by teamID and name, computes the count (N) and mean wins for 
# each team, and arranges them by mean wins.


# Average number of wins for top 5 seasons

map_dfr(illustration_data_2$name, top5, data = Teams) %>%
  group_by(teamID, name) %>%
  summarize(N = n(), mean_wins = mean(W)) %>%
  arrange(desc(mean_wins))

######################################### 
############ Do it yourself! ############
#########################################

