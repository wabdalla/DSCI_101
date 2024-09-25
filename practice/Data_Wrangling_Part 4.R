
#############################################################
################## Data Wrangling - Part 4 ##################
#############################################################

# Always call the packages you will use on top of the R Script.
library(tidyverse)

## Data Summary: Using `group_by()` and `summarise()` together allows you 
#                to efficiently compute summary statistics, aggregations, 
#                or any other computations of data based on different groups 
#                defined by one or more variables.

## group_by(): is used to group a data frame by one or more variables. 
#              This creates a "grouped" data frame where subsequent operations 
#              are performed within each group separately. This works best with 
#              categorical variables or factor variables.
#              Using group_by() in it's own doesn't change the "look" of the data. 


### summarise(): is used to compute summary statistics or other values for each group. 
#              It condenses the grouped data into a single row per group, 
#              summarizing the specified variables.

####################
### Reading Data ###
####################

Illustration_Data<-read_csv("C:/Users/wabdalla/OneDrive - Loyola University Chicago/Desktop/DSCI 101/data/Illustration_Data.csv")

################################
### summarise() & group_by() ###
################################

# Example 1: Compute mean and median of total_Income
example_1 <- Illustration_Data %>%
  summarise(mean_income = mean(total_Income),
            median_income = median(total_Income))


# Combining `group_by()` and `summarise()` allows you to compute 
# summary statistics or perform calculations on subsets of your data 
# based on grouping variables.

# Example 2: Compute mean and median of total_Income, grouped by favorite fruit (var_1)
example_2 <- Illustration_Data %>%
  group_by(var_1) %>%
  summarise(mean_income = mean(total_Income),
            median_income = median(total_Income))

# Example 3: Compute sum and mean of total_Income, grouped by honesty (var_1) 
#            and cat_total
example_3 <- Illustration_Data %>%
  group_by(honesty, cat_total) %>%
  summarise(sum_income = sum(total_Income),
            mean_income = mean(total_Income))
# Example 4: Compute the number of pro dancers per honesty 
example_4 <- Illustration_Data %>%
  group_by(honesty) %>%
  summarise(Num_Pro = n())

# To check what summary statistics you can use type: 
?summarise


########################################################
#################### Do it yourself ####################
############# Practice with "CIACountries" #############
########################################################

# 1. Read in CIACountries from the package mdsr. DO NOT 
#    read it from the Excel File. 




# 2. What is the mean, median, standard deviation of the population 
#    across all countries? Save your results as a dataframe called 
#    question_2. 





# 3. What is the minimum value for the aream and what is the maximum value 
#    for the oil production across all countries? Save your results as a 
#    dataframe called question_3. Make sure you open your results and take a 
#    look at them. 



# 4. What is the mean, median, standard deviation of the population by net_users. 
#    Save your results as a dataframe called question_4.



# 5. What is the minimum value and the maximum value for the education 
#    spending by net_users? Save your results as a dataframe called question_5.



# 6. What is the mean  and the standard deviation values for the population 
#    by net_users? Show your results only for ">35%" and ">5%".
#    Save your results as a dataframe called question_6.




# 7. How many countries do we have per net_user category? Save your results 
#    as a dataframe called question_7.




# 8. Create a new variable with categories high vs low education. High education 
#    is an "educ" index greater than 4.5, low education is an "educ" index smaller 
#    or equal to 4.5. Anything else, categorize it 
#    as "No Information". 
#    Then, calculate the mean, median, and standard deviation of the areas by 
#    this new index you just created. 
#    Save your results as a dataframe called question_8.



# 9. Calculate the mean, median, and standard deviation of the population by 
#    education index (created in # 8) and by net_users. Save your results as 
#    a dataframe called question_9.




# 10. Create a new categorical variable (using `case_when()`) to use 
#     `group_by()` and `summarise()`. Perform the summary of your choice. 



