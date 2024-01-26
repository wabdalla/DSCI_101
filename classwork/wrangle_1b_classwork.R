
#################################################################### 
################## Wrangle 1 (Part b) - Classwork ##################
####################################################################


# Read in data

# Import the data by clicking on it -> import dataset -> import (look at the code)

## Data Transformation

### filter(): When filtering think about filtering ROWS

# Filter uses Boolean logic so you must enter conditions that are either `TRUE` of a variable(s) or `FALSE`.

# Ways to filter:

# 1. Simple Conditions - greater than (`>`), less than (`<`), or equal to (`==`)

# Select rows where "Age" is greater than 30
filtered_data <- filter(dsci_101_class, Age > 30)

# Select rows with "agree" in the "honesty" column
agree_data <- filter(dsci_101_class, honesty == "agree")

#Must use == when filtering since it is asking about Boolean logic
#Must be exact matches when characters (spelling/uppercase/lowercase/etc.)

#2. Multiple Conditions - You can combine conditions using logical operators like `&` (AND) and `|` (OR).

# Select rows where "Age" is greater than 30 and "total_Income" is less than 50000
age_income_data <- filter(dsci_101_class, Age > 30 & total_Income < 50000)

# Select rows where "Age" is greater than 30 and "total_Income" is less than 50000 and zipcode is equal to 60073
age_income_zipcode_data <- filter(dsci_101_class, Age > 30 & total_Income < 50000 & zipcode == 60073)

# Select rows where "Age" is greater than 30 or "total_Income" is greater than 20000
age_income_data <- filter(dsci_101_class, Age > 30 | total_Income > 20000)

#3. Exclusion - to exclude certain rows, you can use the `!=` operator (not equal to).

# Exclude rows with "zipcode" equal to 60111
zip_code_data <- filter(dsci_101_class, zipcode != 60111)


#4. Filter rows based on vector of conditions - The `%in%` operator is useful for filtering rows with values in a specified vector.

# Select rows where "var_1" is either "bananas" or "grapes"
var_1_data <- filter(dsci_101_class, var_1 %in% c("bananas", "grapes"))


########################################################
#################### Do it yourself ####################
############# Practice with "CIACountries" #############
########################################################

# 1. Read in CIACountries

# 2. Subset of rows where the population is greater than 1000000000 and save it as pop_data

# 3. Perform part 2 with a pipe (%>%). Start with the dataframe then "pipe" to filter. Save it as pop_2_data

# 4. Select rows with ">60%" in the "net_users" column and save it as net_data

# 5. Select rows where "gdp" equals 1800 and "roadways" is greater than 0.12239. save it as gdp_and_road_data

# 6. select rows where "gdp" is greater than 21398 or roadways is smaller than 0.33474. save it as gdp_or_road_data

# 7. Exclude rows with "country" equal to Afghanistan. save it as no_afghanistan_data

# 8. Select rows where "country" is either "Vietnam" or "Puerto Rico" or "Pakistan". save it as vpp_data

# 9. Select columns "country",  "pop",  and "area" and select population greater than 1000000000. save it as s_f_data

# 10. Combine filter and select and create your own conditions. 

