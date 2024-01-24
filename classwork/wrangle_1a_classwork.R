
#################################################################### 
################## Wrangle 1 (Part a) - Classwork ##################
####################################################################

###################
## File Pathways ##
###################

# Absolute Pathway: This is the complete pathway starting from the root directory of your computer.

abs_path <- "C:/Users/wabdalla/OneDrive - Loyola University Chicago/Desktop/DSCI_101/data/airlines.csv"

# Relative Pathway: This is the pathway relative to the current *working directory* in R. 

# Check the current working directory

getwd()
    
# Set a new working directory

setwd("path/to/your/new/directory")

rel_path <- "asdf asdf"

###############
## Tidyverse ## 
###############

# tidyverse: is a collection of R packages designed to facilitate data manipulation, exploration, visualization, and modeling. 


# readr: provides flexible tools for reading and writing rectangular data.

# dplyr: provides a grammar of data manipulation.

# tidyr: reshape and tidy your data. 

# ggplot2: allows you to build plots layer by layer.

# purrr: purrr provides functions to work with and manipulate data in a functional programming style.  

# tibble: tibble is an enhanced data frame that provides better printing and handling of metadata.

# stringr: focuses on string manipulation. 

# forcats: forcats is designed for working with categorical data.

#################################################################
## readr: provides functions to easily read data files into R. ##
#################################################################

library(readr) 
# Or better yet 
library(tidyverse)

# Importing CSV Files: Use "read_csv" to import a CSV file:

file_path <- "data/file.csv"  # Specify the absolute pathway
data <- read_csv(file_path)
read_csv("data/file.csv")

# Importing Excel Files (XLSX): Use read_xlsx to import an Excel file
    
file_path <- "data/file.xlsx"  # Specify the relative pathway
data <- read_xlsx(file_path)

### Checking Imported Data: examine it using functions like `glimpse()`, `slice()`, or `str()`.

# slice: Display the first few rows
slice(data, 1:5)

# glimpse: Get summary of the variables
glimpse(data)

# str: Display the structure of the data
str(data)


##################################################################################
## dplyr: provides a powerful and efficient toolkit for data manipulation in R. ##
##################################################################################


# Data Transformation:

# select(): This function is used to select columns from a data frame based on their names.

# filter(): It's used to filter rows based on specified conditions.

# mutate(): This function adds new columns or modifies existing ones, creating a transformed version of the data.


# Data Summarization:
  
# group_by(): This function is used to group data by one or more variables.

# summarize(): It's used in combination with group_by() to compute summary statistics for each group.

# Data Aggregation:

# arrange(): This function orders rows based on specified variables, allowing ascending or descending order.

# count(): It's used to count the occurrences of unique combinations of variables.

# Pipelining (`%>%` Operator): allows you to chain together multiple operations,
# toimproving code readability and making it easier to follow the flow of transformations.




# Without piping
filtered_data <- select(data, total_Income)
summarized_data <- summarize(filtered_data, avg_income = mean(total_Income))

# With piping

data %>%
  select(total_Income) %>%
  summarize(avg_income = mean(total_Income))






## Data Transformation 
### select(): there are different ways to use `select()`

# 1. Choose specific column name from the data frame

# Select columns "Age" and "total_Income"
selected_data <- select(data, Age, total_Income)

# 2. Select Columns by Name Patterns:
# You can use special helper functions like `starts_with()`, `ends_with()`, `contains()`, `matches()`, and `everything()` to select columns based on their names.

# Select columns that start with "var"
selected_vars <- select(data, starts_with("var"))

# Select columns that contain "total" in their names
total_columns <- select(data, contains("total"))

# 3. Exclude Columns: To exclude specific columns, you can use the "-" (minus) sign before the column name.

#  Exclude columns "honesty" and "zipcode"
filtered_data <- select(data, -honesty, -zipcode)

# 4. Select Columns by Index and Range:
# Using the : operator, you can select columns within a range of indices based on their index positions.

# 8. Select columns 4 to 6
range_columns <- select(data, 4:6)


########################################################
#################### Do it yourself ####################
############# Practice with "CIACountries" #############
########################################################


library(mdsr)
# This package contains the data "CIACountries". 

CIACountries # shows you the data on the console (not saved as a dataframe)
?CIACountries # shows you a description of the dataset

# 1. CIACountries is saved under the folder "data". Read in the file and save it as a dataframe called CIACountries


# 2. Take a look at the data with "slice": Display the first 7 rows


# 3. Take a look at the data with "glimpse": Get summary of the variables/


# 4. Take a look at the data with "str": Display the structure of the data


# 5. Get the column names of CIACountries

# 6. select columns "oil_prod" & "educ" and save them into a dataframe called oil_ed_CIACountries

# 7. Select Columns that start with "oil" and save them into a dataframe called oil_CIACountries:

# 8. Select Columns that end with "p" and save them into a dataframe called p_CIACountries:

# 9. Select columns that contain "way" in their names and save them into a dataframe called way_CIACountries

# 10. Exclude columns "gdp" and "net_users" and save them into a dataframe called no_gdp_net_CIACountries 

# 11. Select Column 2 only and save it into a dataframe called col_2_CIACountries

# 12. Select columns 6 to 8 and save them into a dataframe called six_eight_CIACountries


# 13. Using the %>% operation to create a dataframe called "", such that, in the first line you read the CIACountries dataframe, 
# in the next line you select columns 2 to 8, and in the next line you drop columns "area", and "net_users". 


# 14. Perform part 13 without saving it into a dataframe and simply looking at the output in the console. 









