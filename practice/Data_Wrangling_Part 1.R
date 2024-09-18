
#############################################################
################## Data Wrangling - Part 1 ##################
#############################################################

# Always call the packages you will use on top of the R Script.
library(tidyverse)


####################
### Reading Data ###
####################

# Method 1: From an Excel file
Illustration_Data <- read_csv("PUT YOUR DIRECTORY HERE")

# Method 2: Data from a Package
library(palmerpenguins)
data("penguins")
?penguins


##########################
### Examining the Data ###
##########################


# Example 2
# slice: Display the first few rows
slice(penguins, 1:3)

# Example 3
# glimpse: Get summary of the variables
glimpse(penguins)

# Example 4
# str: Display the structure of the data
str(penguins)

# Example 5
# table(): use it on specific columns.Shows how many times each observation appeared
table(penguins$sex)
table(penguins$sex, useNA = "ifany")

# Example 6
# colnames(): shows you the names of the colummns in the dataframe.
colnames(penguins)



#########################
### select() Function ###
#########################

# Example 7: Select columns "Age" and "total_Income"

example_7 <- Illustration_Data %>%
  select(Age, total_Income)

# Example 8: Select columns that start with "var"
example_8 <- Illustration_Data %>%
  select(starts_with("var"))

# Example 9: Select columns that contains "total" in their names         
example_9 <- Illustration_Data %>%
  select(contains("total"))

# Example 10: Exclude columns "honesty" and "zipcode"
example_10 <- Illustration_Data %>%
  select(-honesty, -zipcode)

# Example 11: Exclude columns "honesty" and "zipcode"
example_11 <- Illustration_Data %>%
  select(c(1,3,5,6))


########################################################
#################### Do it yourself ####################
############# Practice with "CIACountries" #############
########################################################


# 1. CIACountries is saved under the folder "data". Read in the file 
#    and save it as a dataframe called CIACountries



# 2. Take a look at the data with "slice": Display the first 7 rows


# 3. Take a look at the data with "glimpse": Get summary of the variables/



# 4. Take a look at the data with "str": Display the structure of the data


# 5. Get the column names of CIACountries



# 6. select columns "oil_prod" & "educ" and save them into a dataframe called 
#    question_6



# 7. Select Columns that start with "oil" and save them into a dataframe 
#    called question_7



# 8. Select Columns that end with "p" and save them into a dataframe 
#    called question_8



# 9. Select columns that contain "way" in their names and save them into 
#    a dataframe called question_9



# 10. Exclude columns "gdp" and "net_users" and save them into a dataframe 
#     called question_10 



# 11. Select Column 2 only and save it into a dataframe called question_11



# 12. Select columns 6 to 8 and save them into a dataframe called 
#     question_12



# 13. Using the %>% operation to create a dataframe called "question_13", 
#     such that, in the first line you read the CIACountries dataframe, 
#     in the next line you select columns 2 to 8, and in the next line you 
#     drop columns "area", and "net_users". 



# 14. Perform part 13 without saving it into a dataframe and simply looking 
#     at the output in the console. What do you see?




# 15. Using the package mdsr, read in the dataset called "Cherry". 
#    Make sure you read you type ?Cherry in the console to read
#    the background information on the dataset. 


