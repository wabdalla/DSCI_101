
#################################################################### 
################## Wrangle 2 (Part b) - Classwork ##################
####################################################################

## Data Summary: Using `group_by()` and `summarise()` together allows you 
#                to efficiently compute summary statistics, aggregations, 
#                or any other computations of data based on different groups 
#                defined by one or more variables.

## group_by(): is used to group a data frame by one or more variables. 
#              This creates a "grouped" data frame where subsequent operations 
#              are performed within each group separately. This works best with categorical 
#              variables or factor variables.
#              Using group_by() in it's own doesn't change the "look" of the data. 


### summarise(): is used to compute summary statistics or other values for each group. 
#              It condenses the grouped data into a single row per group, 
#              summarizing the specified variables.

# Read in dsci_101_class data

# Compute mean and median of total_Income
summary_no_group <- dsci_101_class %>%
  summarise(mean_income = mean(total_Income),
            median_income = median(total_Income))


# Combining `group_by()` and `summarise()` allows you to compute summary statistics 
# or perform calculations on subsets of your data based on grouping variables.

# Compute mean and median of total_Income, grouped by favorite fruit (var_1)
summary_group <- dsci_101_class %>%
  group_by(var_1) %>%
  summarise(mean_income = mean(total_Income),
            median_income = median(total_Income))

# You can group by more than one category: 
summary_2_cat <- dsci_101_class %>%
  group_by(var_1, honesty) %>%
  summarise(mean_income = mean(total_Income),
            median_income = median(total_Income))

# To check what summary statistics you can use type: 
?summarise


########################################################
#################### Do it yourself ####################
############# Practice with "CIACountries" #############
########################################################

# 1. Read in CIACountries

# 2. What is the mean, median, standard deviation of the population across all countries.

# 3. What is the minimum value and the maximum value for the area across all countries.

# 4. What is the mean, median, standard deviation of the population by net_users. 


# 5. What is the minimum value and the maximum value for the area by net_users.

# 6. How many different countries do we have in this dataset?


# 7. How many different countries do we have per net_user category? 



# 8. Create a new category high vs low education. High education is an "educ" index greater than 4.5, 
#    low education is an "educ" index smaller or equal to 4.5. Anything else, categorize it 
#    as "No Information". 
#    Calculate the mean, median, and standard deviation of the areas by this new index. 



# 9. Calculate the mean, median, and standard deviation of the population by education index created 
#    in # 7 and by net_users. 




# 10. Create a new categorical variable (using `case_when()`) to use `group_by()` and `summarise()`. 
# Perform the summary of your choice. 



