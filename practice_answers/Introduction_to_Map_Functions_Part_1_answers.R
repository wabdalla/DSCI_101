
######################################################
####### Introduction to Map Functions - Part 1 ####### 
######################################################

library(tidyverse)
library(palmerpenguins)

####################
### Reading Data ###
####################

data("penguins")

###############
### Nesting ###
###############


# nest(): is a function used to group data into a nested structure.

# Example 1: Nest the penguins dataset by sex

example_1 <- penguins %>% 
  group_by(sex) %>% 
  nest()

# Example 2: Unnest the dataset you created in Example 1. 
example_2 <- example_1 %>% 
  unnest(cols = c(data))


############
### Pull ###
############

# pull(): is a function that works like $. It calls a specific 
#         column of your dataframe. 

# Example 3: Consider the frequency table for species: 

table(penguins$species)

# Make the same  table using pull:  

table(pull(penguins, species))


###########
### Map ###
###########


# The "map" function is a powerful tool in the tidyverse package 
# that allows you to apply a function to each element of a list 
# or vector, and then returns a list containing the results. It's 
# particularly useful when you have repetitive tasks to perform on 
# multiple elements. This function is part of the `purrr` package 
# within the tidyverse.



# Define a function to be applied
square <- function(x) {
  y<-x^2
  return(y)
}

# Create a list of values
values <- c(2, 4, 6, 8)


# Example 4: Use the function you created with the values (without map)

example_4 <- square(values)
example_4 

# Example 5: Use map to apply the function to each element
# Note: The result is a list with squared values. To get results back 
# to a vector unlist()


example_5 <- map(values, square)
final_results <- unlist(example_5)
final_results


#########################################
##### Combining nesting and mapping #####
#########################################

# Example 6: Combine "nest" with "map", and compute the mean of bill_length_mm, 
#            the mean of body_mass_g, and the mean of bill_depth_mm for each 
#            value of the sex type. 


example_6 <- penguins %>% 
  group_by(sex) %>% 
  nest() %>% 
  mutate(mean_bill_length = map(data, ~ mean(pull(.x, bill_length_mm), na.rm = TRUE)),
         mean_body_mass = map(data, ~ mean(pull(.x, body_mass_g), na.rm = TRUE)),
         mean_bill_depth = map(data, ~ mean(pull(.x, bill_depth_mm), na.rm = TRUE)))



########################################################
#################### Do it yourself ####################
########################################################

# 1. Nest the penguins dataset by species and islands

question_1 <- penguins %>%
  group_by(species, island) %>%
  nest()


# 2. Consider the 2 way frequency table for species and island: 

table(penguins$species, penguins$island)

# Make a two way table using pull: 


table(pull(penguins, species), pull(penguins, island))


# 3. Create a dataframe using nesting and mapping, such that you 
#    compute the median of the flipper length and the minimum bill 
#    length, and maximum of bill depth for each species and island.
question_3 <- penguins %>%
  group_by(species, island) %>%
  nest() %>%
  mutate(median_flipper = map(data, ~median(pull(.x, flipper_length_mm), na.rm = TRUE)), 
         min_bill_length = map(data, ~min(pull(.x, bill_length_mm), na.rm = TRUE)), 
         max_bill_depth = map(data, ~max(pull(.x, bill_depth_mm), na.rm = TRUE)))

# 4. Compute the same thing without nesting and compare to part 3.

question_4 <- penguins %>%
  group_by(species, island) %>%
  summarise(median_flipper = median(flipper_length_mm, na.rm = TRUE), 
            min_bill_length = min(bill_length_mm, na.rm = TRUE), 
            max_bill_depth = max(bill_depth_mm, na.rm = TRUE))


# 5. Build a function to calculate mean and standard deviation of 
#    any variable in a dataframe. Arguments should be the dataframe 
#    and a name of a variable.
#    The return should be a dataframe that gives you the mean and 
#    standard deviation of the variable. 
#    Name the function calculate_stats. 
#    Test your function with the penguins dataset and with the variable 
#    "flipper_length_mm"

calculate_stats <- function(data, var_name) {
  Mean <- mean(pull(data, var_name), na.rm = TRUE)
  Std <- sd(pull(data,var_name), na.rm = TRUE)
  df <- data.frame(Mean = Mean, Std = Std)
  return(df)
}


testing <- calculate_stats(data = penguins, var_name = "flipper_length_mm")

# 6. Use the function you created and apply it on the penguins 
#    data, nested by species and island.


question_6 <- penguins %>% 
  group_by(species, island) %>% 
  nest() %>% 
  mutate(bill_dept = map(data, ~calculate_stats(.x, "bill_length_mm"))) 

# 7. Use the unnest function on the calculated values in question 6

question_7 <- question_6 %>% 
  unnest(cols = c(bill_dept))


