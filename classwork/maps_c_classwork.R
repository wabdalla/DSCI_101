
#######################################################
############## Maps (Part c) - Classwork ##############
#######################################################

library(tidyverse)
library(palmerpenguins)


# Dataset: Penguins

data("penguins")


###############
### Nesting ###
###############


# "nest" is used to group data into a nested structure.


penguins_nest<- penguins %>% 
  group_by(sex) %>% 
  nest()


# 1. Do it yourself: Nest the penguins dataset by species and islands



############
### Pull ###
############

# pull is a function that works like $. It calls a specific column of your dataframe. 


table(penguins$species)
table(pull(penguins, species))


# 2. Do it yourself: Consider the 2 way frequency table for species and island: 
table(penguins$species, penguins$island)

# Make a two way table using pull: 






###########
### Map ###
###########


# The "map" function is a powerful tool in the tidyverse package that allows you to 
# apply a function to each element of a list or vector, and then returns a list containing 
# the results. It's particularly useful when you have repetitive tasks to perform on 
# multiple elements. This function is part of the `purrr` package within the tidyverse.


# Create a list of values
values <- c(2, 4, 6, 8)

# Define a function to be applied
square <- function(x) {
  y<-x^2
  return(y)
}

# without map



# Use map to apply the function to each element
result <- map(values, square)

# The result is a list with squared values
result

# To get results back to a vector unlist()
unlist(result)

f<-unlist(result)
f


#########################################
##### Combining nesting and mapping #####
#########################################

# When combining "nest" with "map", you can apply a function to each nested group 
# separately and return the results as a new column.

penguin_summary <- penguins %>% 
  group_by(sex) %>% 
  summarise(mean_bill_length = mean(bill_length_mm, na.rm = TRUE), 
            mean_body_mass = mean(body_mass_g, na.rm = TRUE), 
            mean_bill_depth = mean(bill_depth_mm, na.rm = TRUE))



penguins_nest_map<- penguins %>% 
  group_by(sex) %>% 
  nest() %>% 
  mutate(mean_bill_length = map(data, ~ mean(pull(.x, bill_length_mm), na.rm = TRUE)),
         mean_body_mass = map(data, ~ mean(pull(.x, body_mass_g), na.rm = TRUE)),
         mean_bill_depth = map(data, ~ mean(pull(.x, bill_depth_mm), na.rm = TRUE)))
 

# 3. Do it yourself: Create a dataframe using nesting and mapping, such that you compute 
#    the median of the flipper length and the minimum bill length, and maximum of bill depth



# 4. Compute the same thing withouth nesting and compare to part 3.



# 5. On your own: Build a function to calculate mean and median of any variable in a dataframe. 
# Arguments should be the dataframe and a name of a variable. 
# The return should be a dataframe that gives you the mean and standard deviation of 
# the variable. 
# Name the function calculate_stats






# 6. On your own: use the function you created and apply it on the penguins data, nested by 
#    species and island




## need to select and unnest the dataframe





############################ 
##### Read on your own #####
############################

# The map function is especially handy when you have complex tasks, such as reading multiple 
# files, performing calculations on multiple datasets, or creating multiple plots. It helps 
# you avoid writing repetitive code and enhances the readability of your code.

# For instance, suppose you have a list of file names and you want to read each file and 
# perform some operations on its content:


files <- c("file1.csv", "file2.csv", "file3.csv")

# Define a function to read and process a file
process_file <- function(filename) {
  data <- read_csv(filename)
  # Perform operations on 'data'
  return(processed_data)
}

# Use map to process each file
processed_files <- map(files, process_file)


# "map" returns a list where each element contains the output of applying the specified 
# function to the corresponding element of the input data. It's useful when you expect 
# the output to have different types or structures.

# "map_dbl" specifically returns a numeric vector. It's useful when you expect the output 
# to be a numeric value, and it simplifies the output into a vector.


## use map_dbl for number outputs
penguins_map_dbl <- penguins %>% 
  group_by(sex) %>% 
  nest() %>% 
  mutate(mean_body_mass = map_dbl(data, ~ mean(pull(.x, body_mass_g), na.rm = TRUE)),
         mean_bill_length = map_dbl(data, ~ mean(pull(.x, bill_length_mm), na.rm = TRUE)),
         mean_bill_depth = map_dbl(data, ~ mean(pull(.x, bill_depth_mm), na.rm = TRUE)))

