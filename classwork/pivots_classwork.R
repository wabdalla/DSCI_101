########################################################
################## Pivots - Classwork ##################
########################################################

library(nycflights13)
library(tidyverse)
library(palmerpenguins)

#################
### Tidy Data ###
#################

# Refers to a specific way of organizing data tables in a tabular format to facilitate data analysis. 
# In tidy data:
#     Each variable forms a column.
#     Each observation forms a row.



##################
##### Pivots #####
##################

# Data often comes in various formats, and its structure might not be ideal for the task at hand. 
# Pivoting helps you reorganize your data to a format that makes it easier to analyze, visualize, or model. 
# For example, you might need to pivot data to:

#     Perform Aggregations: Pivoting can simplify data aggregation and summary calculations. 
#     Create Visualizations: Some visualizations require specific data structures. 

#     Fit Models: Certain modeling techniques might require data in a specific shape. 

####################
### Pivot Longer ###
####################

# pivot_longer(): is used to convert data from a wide format (with multiple columns) into a 
#                 long format (fewer columns). It's particularly useful when you have variables spread 
#                 across different columns and you want to stack them into a single column, often with 
#                 corresponding values.


# FORMAT    pivot_longer(data, cols, names_to, values_to)
# OTHER FORMAT: 

#   data %>%
#        pivot_longer(cols, names_to, values_to)


# data: The input data frame.
# cols: Columns to pivot into longer format.
# names_to: The name of the column that will store the column names from the original wide format.
# values_to: The name of the column that will store the values from the original wide format.

# Sample data

data_wide <- data.frame(
  country = c("USA", "Canada"),
  `2018` = c(250, 180),
  `2019` = c(260, 190),
  `2020` = c(270, 200)
)

# Using pivot_longer to reshape data

wide_to_long <- data_wide %>%
  pivot_longer(cols = -country, names_to = "year", values_to = "value")


####################
### Pivot Wider ####
####################

# pivot_wider(): is used to convert data from a long format to a wide format. 
#                It's useful when you want to take distinct values from a column 
#                and spread them across new columns.


# FORMAT    pivot_wider(data, names_from, values_from)
# OTHER FORMAT: 

#   data %>%
#        pivot_wider(names_from, values_from)




# data: The input data frame.
# names_from: The column that contains the unique values to be transformed into column names 
#             in the wide format.
# values_from: The column that contains the values to be spread across the new wide-format columns.




# Sample data
data_long <- data.frame(
  country = c("USA", "Canada"),
  year = rep(c("2018", "2019", "2020"), each = 2),
  value = c(250, 260, 270, 180, 190, 200)
)


# Using pivot_wider to reshape data
long_to_wide <- data_long %>%
  pivot_wider(names_from = year, values_from = value)


########################################################
#################### Do it yourself ####################
############# Practice with "Flights Data" #############
############# Practice with "Penguins Data" ############ 
########################################################

# 1. Using flights dataset (from nycflights13 package), create a dataset where each airline is a row 
# and each column is a month (1-12) to see which is the busiest months for each airline. 
# In the "core" of this table you should have the number of flights per carrier for each of the months.




# 2. Repeat Part 1, however, now show the actual name of the airline, matched to it's accronym. 




# 3. Using the package `palmerpenguins` (you must install the package), load the data called penguins


# 4. Count the number of observations in the penguin dataset by species and islands, then turn this into
#    a tidy format with islands being the names of the columns. 



# 5. Turn question 5 back into the long format it was 
#    (when counting the number of observations by species and islands)


