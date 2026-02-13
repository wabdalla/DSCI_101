
#############################################################
################## Data Wrangling - Part 5 ##################
#############################################################

# Always call the packages you will use on top of the R Script.

library(tidyverse)

## arrange(): is used to reorder the rows of a data frame based on one or more variables. 
#             The default order is from smallest to largest (or alphabetical for strings). 
#             To change the order from largest to smallest use "desc()".


####################
### Reading Data ###
####################

Illustration_Data<-read_csv("C:/Users/wabdalla/OneDrive - Loyola University Chicago/Desktop/DSCI 101/data/Illustration_Data.csv")


#################
### arrange() ###
#################

# Example 1: Arrange data by "cat_total" in ascending 
#            order (smallest to largest)

example_1<-Illustration_Data %>%
  arrange(cat_total)

# Example 2: Arrange data by "cat_total" in descending 
#            order (largest to smallest)

example_2<-Illustration_Data %>%
  arrange(desc(cat_total))

# Example 3: Arrange data in alphabetical order by name. 

example_3<-Illustration_Data %>%
  arrange(Name)


# Example 4: Count the number of occurrences each fruit had 
#            in "var_1"

example_4<-Illustration_Data %>%
  group_by(var_1) %>%
  summarize(N = n())


# Example 5: Arrange by honesty and within category of honesty, 
#           arrange by cat_total. 

example_5 <- Illustration_Data %>%
  arrange(honesty, cat_total)


########################################################
#################### Do it yourself ####################
############# Practice with "CIACountries" #############
########################################################

# 1. Read in CIACountries



# 2. Arrange variable gdp in ascending order. Save it into a 
#    dataframe called question_2. Make sure to open your dataframe
#    and check that it's doing what you want it to do. 



# What did it do with the NA's?
# Your answer:  

# 3. Arrange variable gdp in descending order. Save it into a 
#    dataframe called question_3. Make sure to open your dataframe
#    and check that it's doing what you want it to do.



# What did it do with the NA's?
# Your answer:  

# 4. Arrange by net_users, then within net_users arrange 
#    by educ(in ascending order). Then select columns
#    net_users and educ. Save it into a dataframe called 
#    question_4. Check that it's doing what you want it to do. 



# 5. Select columns country and gdp, then create a 
#    new column called gdp_category. If gdp is smaller
#    or equal than 13750, then categorize it as "Low", 
#    if it's greater than 13750, then categorize it 
#    as high, anything else categorize it as "No Information". 
#    Keep only the rows with gdp_category 
#    equal to "low", then sort the data from z to a by
#    country. 




# 6. Count the occurrences of net_users. Then arrange 
#    the data by the number of occurrences from largest
#    to smallest. Save your results into a dataframe 
#    called question_6. Do check your results. 



# 7. Count the number of countries in CIACountries.
#    Save the result in a dataframe called question_7.




# 8.create a new variable called "area_category", where you categories the variable
#   area by quartiles. If area is smaller than first quartile, then it's "small"
#   if area is greater or equal than first quartile, but smaller than second quartile, then it's "medium",
#   if area is greater or equal than second quartile, but smaller than third quartile, then it's "large", 
#   if area is greater or equal than thrid quartile, then it's "huge", otherwise "No Information". 
#   Select rows with ">60%" in the "net_users" column.
#   Select columns country, pop, net_users, and area_category
#   sort by pop in descending order. 



# 9. Comeup with a scenario, then code it. 

