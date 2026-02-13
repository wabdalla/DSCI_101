
#############################################################
################## Data Wrangling - Part 2 ##################
#############################################################

# Always call the packages you will use on top of the R Script.
library(tidyverse)



####################
### Reading Data ###
####################

Illustration_Data<-read_csv("YOUR DIRECTORY")


###########################################################
### filter(): When filtering think about filtering ROWS ###
###########################################################


# Filter uses Boolean logic 

# Ways to filter:

# 1. Simple Conditions (one boolean expression)
#    Examples: Greater than (`>`), less than (`<`), or equal to (`==`)

# Example 1: Select rows where "Age" is greater than 30

example_1 <- Illustration_Data %>%
  filter(Age > 30)

# Example 2: Select rows with "agree" in the "honesty" column
example_2 <- Illustration_Data %>%
  filter(honesty == "agree")

# 2. Multiple Conditions - You can combine conditions using logical 
#    operators like `&` (AND) and `|` (OR).

# Example 3: Select rows where "Age" is greater than 30 and 
#            "total_Income" is less than 50000


example_3 <- Illustration_Data %>%
  filter(Age > 30 & total_Income < 50000)

# Example 4: Select rows where "Age" is greater than 20 and "total_Income" 
#            is less than 30000 and zipcode is equal to 60073
example_4 <- Illustration_Data %>%
  filter(Age > 20 & total_Income < 30000 & zipcode == 60073)

# Example 5: Select rows where "Age" is greater than 30 or 
#            "total_Income" is greater than 20000
example_5 <- Illustration_Data %>%
  filter(Age > 30 | total_Income > 20000)

#3. Exclusion - to exclude certain rows, you can use the `!=` operator (not equal to).

# Example 6: Exclude rows with "zipcode" equal to 60111
example_6 <- Illustration_Data %>%
  filter(zipcode != 60111)


#4. Filter rows based on vector of conditions - The `%in%` operator is useful for filtering rows with values in a specified vector.

# Example 7:Select rows where "var_1" is either "bananas" or "grapes"
example_7 <- Illustration_Data %>%
  filter(var_1 %in% c("bananas", "grapes"))


########################################################
#################### Do it yourself ####################
############# Practice with "CIACountries" #############
########################################################


# 1. Read in CIACountries. CIACountries is saved as an Excel file in 
#    the file titled "data". 

CIACountries<-read_csv("YOUR DIRECTORY")


# 2. Subset of rows where the population is greater than 1000000000, then select
#    columns country and population. Save this as question_2. 
question_2 <- CIACountries %>%
  filter(pop > 1000000000) %>%
  select(country, pop)

# What countries have a population greater than 1000000000?
# Your answer: China & India


# 3. The column "net_users" represents the fraction of internet 
#    users (% of population). This variable takes on values of:
#    ">0%", ">15%", ">35%",  ">5%", ">60%". For some countries 
#    this information is not available. How many countries fall
#    in each one of these categories?

table(CIACountries$net_users)
# >0% ---> 24 
# >15% ---> 36
# >35% ---> 59
# >5% ---> 30
# >60% ---> 67 


# 4. How many countries don't have the information available for 
#    net_users?

table(CIACountries$net_users, useNA = "ifany")

# Your answer: 20 countries have NA (missing values)

# 5. The column "net_users" represents the fraction of internet 
#    users (% of population). Select rows with ">60%" in the "net_users" 
#    column then remove column pop. Save this as question_5. 

question_5 <- CIACountries %>%
  filter(net_users == ">60%") %>%
  select(-pop)
  
# How many countries have a net user ">60%"? How can you tell using the code 
# you did now? How does this compare to the result in part 3?

# Your answer: From the number of rows in question_5.

# 6. Select rows where "gdp" equals 1800 and "roadways" is greater than 0.12239. 
#    Select columns 1, 5, and 7. Save it as question_6
question_6 <- CIACountries %>%
  filter(gdp == 1800 & roadways > 0.12239)%>%
  select(c(1,5,7))

# What countries have a "gdp" equals 1800 and "roadways" is greater than 0.12239? 
# Your answer: Haiti, Kiribati, North Korea, and Rwanda. 

# 7. Select rows where "gdp" is greater than 21398 or roadways is smaller than 0.33474. 
#    Select variables country, roadways and gdp (in that order) Save it as question_7.
question_7 <- CIACountries %>%
  filter(gdp > 21398 | roadways < 0.33474) %>%
  select(country,roadways, gdp)

# How many countries have "gdp" greater than 21398 or roadways is smaller than 0.33474?
# Your answer: 176
nrow(question_7)

# 8. Exclude rows with "country" equal to Afghanistan. save it as question_8
question_8 <- CIACountries %>%
  filter(country != "Afghanistan")

# How many rows in question_8? Is that what you expected?
# Your answer: 235. Yes that is what I expected since I dropped only one country. 
nrow(question_8)

# 9. Select rows where "country" is either "Vietnam" or "Puerto Rico" or "Pakistan". 
#    Select Columns country and population. Save it as question_9.
question_9 <- CIACountries %>%
  filter(country %in% c("Vietnam", "Puerto Rico", "Pakistan")) %>%
  select(country, pop)

# What are the populations of Vietname, Puerto Rico, and Pakistan?
# Your answer: 
# Pakistan: 199085847
# Puerto Rico: 3598357
# Vietnam: 94348835


# 10. Select columns "country",  "pop",  and "area" and select population greater 
#     than 1000000000. save it as question_10

question_10 <- CIACountries %>% 
  select(country, pop, area) %>% 
  filter(pop > 1000000000)

# Would your results have changes if you filtered first and selected columns second?

# Your answer: No. 


# 11. Using the filter function, remove the missing values from the "net_users"
#    column. Then select only column "net_users". Save it as question_11. 
#    Hint: to remove missing values from a column, use this boolean expression: 
#    !is.na(column_name)

question_11 <- CIACountries %>%
  filter(!is.na(net_users))


# In part 4, you should have noticed that there are 20 rows that have a missing value
# in net_users. How many rows do you have in question_11? Does this make sense? 
# Your answer: 216 rows. Since there are 20 NAs then 236-20 = 216. Yes it makes sense. 
nrow(question_11)

# 12. Combine filter and select and create your own conditions. 

