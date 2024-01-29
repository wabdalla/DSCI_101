#################################################################### 
################## Wrangle 2 (Part a) - Classwork ##################
####################################################################

library(tidyverse)

# Read in data (read in dsci_101_class)

# Import the data by clicking on it -> import dataset -> import (look at the code)

### mutate()

# Add a new variable "income_per_month" calculated from "total_Income" 
updated_income <- dsci_101_class %>%
  mutate(income_per_month = total_Income / 12)
# Modify the "total_Income" variable by changing the variable itself
modified_income <- dsci_101_class %>%
  mutate(total_Income = total_Income * 1.1)


# We can use other functions within mutate to help us make the new variable like `ifelse()`. 

# Create a new variable "status" based on "age"
new_data <- dsci_101_class %>%
  mutate(status = ifelse(Age > 30, "Older", "Younger"))

new_data

table(new_data$Age, new_data$status)
table(new_data$status, new_data$Age)

# If you have multiple condition you can use the `case_when()` function and list out your possible options.


# case_when(
#   condition_1 ~ value_1,
#   condition_2 ~ value_2,
#   ...,
#   TRUE ~ default_value
# )


# Create a new variable "group" based on "age"
case_when_data <- dsci_101_class %>%
  mutate(group = case_when(
    Age < 30 ~ "Young",
    Age >= 30 & Age <= 50 ~ "Middle-aged",
    Age > 50 ~ "Old"
  ))
case_when_data_2 <- dsci_101_class %>%
  mutate(group = case_when(
    Age < 30 ~ "Young",
    Age >= 30 & Age <= 50 ~ "Middle-aged",
    TRUE ~ "No Category"
  ))

########################################################
#################### Do it yourself ####################
############# Practice with "CIACountries" #############
########################################################

# 1. Read in CIACountries


# 2. Create a new variable called "dens". "dens" stands for population density and it is computed by 
# dividing the population by the area. Name the new dataframe "my_CIACountries"



# 3. Using ifelse, create a new variable called "area_cat". If the area of the country is smaller or 
# equal than 73580, then categorize it as "small", if it's greater than 73580, then categorize it as "large".
# name the new dataframe area_CIACountries



# 4. Using case_when(), find the quartiles of the variable "area" and create a new variable  named 
# "area_cat" such that any area smaller or equal to the first quartile is "small", 
# any area between the first quartile and the median (including the median) is "medium", 
# any area between the median and the third quartile (including the third quartile) is "large", 
# anything greater than the third quartile is "humongous"
# any other thing, classified it as "no category"
# name the new dataframe as area_cat_CIACountries


# 5. check how many countries are in each of the categories created above. 

