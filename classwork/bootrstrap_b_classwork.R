
############################################ 
### Simulations & Bootstrapping (Part b) ###
############################################

library(Lahman)
library(tidyverse)
library(babynames)

##############################
### More on map() Function ###
##############################

## Map Functions: this section reviews mapping functions in R, 
#       which allow you to apply a function to each element of 
#       a list, vector, or dataframe.

###################################
### Map Function on a dataframe ### 
###################################

df<-Teams %>% 
  select(15:40) # Selecting columns 15 to 40 because they are numeric columns

map_dbl(df, mean, na.rm = TRUE) 

# Also...

map_dbl(df, \(x) mean(x, na.rm = TRUE))


data_frame <- map_dfr(df, mean, na.rm = TRUE)
data_frame2 <- map_dfr(df, \(x) mean(x, na.rm = TRUE))

###################################################
### Map Function Iterating Over a Single Vector ###
###################################################

# This section demonstrates how to iterate over a single vector 
# using mapping functions.

# Example: Using the Teams dataset pull out the teams associated with 
#     the now Angels franchise ("ANA") and find the first and last year 
#     they played.

angels <- Teams %>% 
  filter(franchID == "ANA") %>% 
  group_by(teamID, name) %>%
  summarize(began = first(yearID), ended = last(yearID)) %>% 
  arrange(began)

angels


# If we wanted to find out the number of characters in the team name.


# Note I use pull and not select. 
# Pull is similar to $
angels %>% 
  pull(name) 

map_dbl(angels, str_length) # Why doesn't it work?
map_dbl(angels$name, str_length) 

map_dfr(angels, str_length)
map_dfr(angels, \(x) str_length(x))


#####################################################    
### Map function: Iterating Over Our Own Function ###
#####################################################

# Below the `top5` function is defined, which takes a team name 
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


# This function is applied to the "New York Yankees" using different 
# approaches.

top5(data = Teams, team_name = "New York Yankees")
top5("New York Yankees", Teams)



# Pulling out the names of all the angel teams to use the map 
# with the `top5` function.

angels_names <- angels %>%
  pull(name)

angels_names

## still comes out as a list
angels_names %>%
  map(top5, Teams)

map(angels_names, top5, Teams)
map_dfr(angels_names, top5, Teams)



# This code calculates the average number of wins for the top 5 
# seasons of each team in the "angels_names" vector. The result is 
# combined into a single data frame using `map_dfr()`. Then, it groups 
# the data by teamID and name, computes the count (N) and mean wins for 
# each team, and arranges them by mean wins.


# Average number of wins for top 5 seasons

map_dfr(angels_names, top5, data = Teams) %>%
  group_by(teamID, name) %>%
  summarize(N = n(), mean_wins = mean(W)) %>%
  arrange(desc(mean_wins))



######################################### 
############ Do it yourself! ############
#########################################


# 1. Use the dataframe "babynames" in the babynames package. 
#    Create a function that given a dataframe and a name, 
#    a name, you can find the year that name peaked (largest n). 
#    The function should return a dataframe with the baby's name 
#    and the year it peaked. 





# 2. Find the top 100 female baby names in the year 1900. Save these
#    names as a vector. 





# 3. Using the map function and the function created in part 1, 
#    for each of the names found in part 2, find the year that 
#    each of these names peaked. 





# 4. Generalize the function you created in bootstrap_a_classwork 
#    that simulates tossing a fair coin. Build the function such that
#    the argument could be the outcome (heads or tails) you are trying 
#    to compute the probability on. 

#    Apply a Monte Carlo simulation now using your new generalized function. 



# 5. Generalize the function you created in bootstrap_a_classwork 
#    that simulates drawing a marble from an urn. Build the function 
#    such that the arguments are an urn with any number and color of 
#    marbles and the outcome is any color you choose. 


#    Apply a Monte Carlo simulation now using your new generalized function. 







