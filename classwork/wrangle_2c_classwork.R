
#################################################################### 
################## Wrangle 2 (Part c) - Classwork ##################
####################################################################
library(tidyverse)
### arrange() and count()

## arrange(): is used to reorder the rows of a data frame based on one or more variables. 
#             The default order is from smalles to largest (or alphabetical for strings). 
#             To change the order from largest to smallest use "desc()".

## Unlike other `dplyr` verbs, `arrange()` largely ignores grouping; 
## you need to explicitly mention grouping variables (or use `.by_group = TRUE`) 
## in order to group by them.

## count(): is used to count the occurrences of unique values in a variable. 
#          You can also combine these functions to sort the data by a count of occurrences.


# Sample data frame
data <- data.frame(category = c("A", "B", "A", "B", "A"),
                   age = c(25, 30, 35, 40, 45))
data

# Arrange data by "age" in ascending order (smallest to largest)
data %>%
  arrange(age)
# Arrange data by "age" in descending order (largest to smallest)
data %>%
  arrange(desc(age))

# Count the occurrences of each "category"
data %>%
  count(category)

# Arrange data by the count of each "category" in ascending order
a<-data %>%
  count(category) %>%
  arrange(n)

# How can I achieve the smae thing as the previous step with summarise??


# Arrange ignores groups! For example: lets use mtcars dataset from dplyr

data <- mtcars
?mtcars


no_group <- arrange(data, cyl, disp)

group <- data %>% 
  group_by(cyl) %>%
  arrange(disp)

# to achieve arranging first cyl then disp using group_by, use .by_group = TRUE
group_correctly <- data %>% 
  group_by(cyl) %>%
  arrange(disp, .by_group = TRUE)
########################################################
#################### Do it yourself ####################
############# Practice with "CIACountries" #############
########################################################

# 1. Read in CIACountries



# 2. Arrange variable gdp in ascending order. Save it into a dataframe and check that it's doing 
#    what you want it to do. 

# 3. Arrange variable gdp in descending order. Save it into a dataframe and check that it's doing 
#    what you want it to do. 



# 4. Arrange by net_users, then within net_users arrange by educ(in ascending order). Then select columns
#    net_users and educ.Save it into a dataframe and check that it's doing 
#    what you want it to do. 


# 5. Perform question 4, but use the group_by function. 



# 6. Count the occurrences of net_users using the count function, then sort by the number of counts n.


# 7. Perform question 6 using summarise and n()



# 8.create a new variable called "area_category", where you categories the variable
#   area by quartiles. If area is smaller than first quartile, then it's "small"
#   if area is greater or equal than first quartile, but smaller than second quartile, then it's "medium",
#   if area is greater or equal than second quartile, but smaller than third quartile, then it's "large", 
#   if area is greater or equal than thrid quartile, then it's "huge", otherwise "No Information". 
#   Select rows with ">60%" in the "net_users" column and save it as net_data.
#   Select columns country, pop, net_users, and area_category
#   sort by pop in descending order. 

  
  