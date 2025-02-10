#############################################################
################## Data Wrangling - Part 3 ##################
#############################################################

# Always call the packages you will use on top of the R Script.
library(tidyverse)

####################
### Reading Data ###
####################

Illustration_Data<-read_csv("YOUR DIRECTORY")


######################################################################
### mutate(): Creates a new column typically based on computations ###
###           related to other columns in the dataset.             ### 
######################################################################


# Example 1: Add a new variable "income_per_month" calculated from "total_Income" 

example_1 <- Illustration_Data %>%
  mutate(income_per_month = total_Income / 12)


# We can use other functions (like `ifelse`) within mutate to help us make 
# a new variable. 

# Example 2: Create a new variable called "status" based on "age"

example_2 <- Illustration_Data %>%
  mutate(status = ifelse(Age > 30, "Older", "Younger"))

# You can use the table function with two columns to count how many people
# fall into each category. 

table(example_2$Age, example_2$status)
table(example_2$status, example_2$Age)

# If you have multiple condition you can use the `case_when()` 
# function and list out your possible options.

# case_when(
#   boolean expression ~ value_1,
#   boolean expression ~ value_2,
#   ...,
#   TRUE ~ default_value
# )


# Example 3: Create a new variable "group" based on "age". If the 
#            person's age is smaller than 30, they are "Young", if 
#            their age is between 30 and 40 (inclusive), then they 
#            are "Middle-Aged", if their age is greater than 40, then 
#            they are "old". 

example_3 <- Illustration_Data %>%
  mutate(group = case_when(
    Age < 30 ~ "Young",
    Age >= 30 & Age <= 40 ~ "Middle-Aged",
    Age > 40 ~ "Old"
  ))

# Example 4: Create a new variable "group" based on "age". If the 
#            person's age is smaller than 30, they are "Young", if 
#            their age is between 30 and 40 (inclusive), then they 
#            are "Middle-Aged", anything else, simply have it be 
#            "No Category". 

example_4 <- Illustration_Data %>%
  mutate(group = case_when(
    Age < 30 ~ "Young",
    Age >= 30 & Age <= 40 ~ "Middle-aged",
    TRUE ~ "No Category"
  ))


# Example 5: You can use the mutate function to change the variable type. 
#            The variable "total_Income" is numeric. Change it to character. 

class(Illustration_Data$total_Income)

Illustration_Data <- Illustration_Data %>%
  mutate(total_Income = as.character(total_Income))

class(Illustration_Data$total_Income)


########################################################
#################### Do it yourself ####################
############# Practice with "CIACountries" #############
########################################################

# 1. Read in CIACountries. CIACountries is a file that is both saved
#    as an Excel file in your data file and it is also a dataset 
#    that comes from a package named `mdsr`. Load the package, then 
#    load the dataset directly from the package. 




# 2. Create a new variable called "density". "density" stands for population 
#    density and it is computed by dividing the population by the area. Then select
#    columns population, area, and density. 
#    Name the new dataframe "question_2".





# 3. Using ifelse, create a new variable called "area_cat". If the area of the 
#    country is smaller or equal than 73580, then categorize it as "small", if 
#    it's greater than 73580, then categorize it as "large". Then select columns are
#    columns country, area, and the new column you created. Name the new dataframe 
#    question_3.




# 4. Based on question_3, how many countries are categorized as "small" and how 
#    many are categorized as "large". 





# 5. At the beggining of the semester, we learned how to use a function called 
#    summary. You simply have to call this function and type a vector inside it. 
#    This function gives you the statistic summary of the data. Use this function
#    to print in your console what the summary statistics of column area are. 





# Copy results here: 



# 6. Using the information from part 5 and using case_when(), create a new variable  
#    named "area_cat" such that any area smaller or equal to the first quartile is 
#    "small", any area between the first quartile and the median (including the median) 
#    is "medium", any area between the median and the third quartile (including the third 
#    quartile) is "large", anything greater than the third quartile is "humongous".
#    Any other thing, classify it as "no category". Name the new dataframe as 
#    question_6





# 7. check how many countries are in each of the categories created above. 



# 8. What is the class of the column "net_users".



# 9. Change the class of "net_users" into a character column. Make sure the change 
#    is inside the CIACountries dataset itself. After you make the change. Check 
#    the class of `net_users` to make sure the change was done successfully.





# 10. Create a new column called "net_users_info". This column should express in words
#     what is expressed in symbols in the column "net_users". For example: ">0%", in 
#     the new column should be expressed as "Greater than 0 percent"... and so on. 
#     Anything that doesn't follow that pattern should be categorized as "No Category". 
#     Your new dataframe should be saved as question_10. 



# 11. Using the table function, make a two way table to show the column you just created, 
#     vs the column you used to create it. Do not forget to include NA's! 




# 12. If you are done with everything above, come up with codes that use the mutate 
#     function. 

