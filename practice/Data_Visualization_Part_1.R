
######################################################### 
############## Data Visualization - Part 1 ##############
#########################################################

library(tidyverse)
library(mdsr)

###############
### ggplot2 ###
###############

# Fundamental components of ggplot2:

# Data: The dataset you're working with.
# Aesthetics Mapping (aes): How data variables map to plot aesthetics 
#                           like position, color, shape, etc.
# Geometric Objects (geom): The visual elements to represent the data 
#                           (points, lines, bars, etc.).
# Facets (facet_wrap or facet_grid): Splitting data into subplots based 
#                           on a variable.
# Theme: Controlling the overall appearance of the plot.

# Think of every command as a layer like the pipe for `dplyr`

######################
### Types of Plots ###
######################

### One Variable Plots (Univariate):

# 1. Numeric Variables:
#        Histogram: Visualize the distribution of a numeric variable.
#        Density Plot: Similar to a histogram but with a smooth curve.
#        Boxplot: Display the distribution's summary statistics and outliers.

# 2. Categorical Variables:
#        Bar Plot: Display the frequencies or proportions of different categories. 


####################
### Reading Data ###
####################

# The data comes from the mdsr package. You can read more background information
# on the data by typing ?SAT_2010 in your console
data("SAT_2010")

# Will add a categorical column to the dataset using the salary variable:

SAT_2010 <- SAT_2010 %>% 
  mutate(salary_level = case_when(
    salary < 52000 ~ "Low",
    salary >= 52000 & salary < 60000 ~ "Medium",
    salary >= 60000 ~ "High"
  ))

###########################
### Univariate Displays ###
###########################

################
## Histograms ##
################

# Figure 1: Create a Histogram on the Average Math SAT Score. 
fig_1 <- SAT_2010 %>% 
  ggplot(aes(x = math)) +
  geom_histogram()

fig_1

# Figure 2: Create a Histogram on the Average Math SAT Score, but 
#           change the break points to start from 450, end in 625, and increase by 25

fig_2 <- SAT_2010 %>% 
  ggplot(aes(x = math)) +
  geom_histogram(breaks = c(450,475,500,525,550,575,600,625))
fig_2 

# Figure 3: Create a Histogram on the Average Math SAT Score, but 
#           choose the bins to be 9. 

fig_3 <- SAT_2010 %>% 
  ggplot(aes(x = math)) +
  geom_histogram(bins = 9)

fig_3

#####################
### Density Plots ###
#####################

# Figure 4: Create a density plot on the Average Math SAT Score

fig_4 <- SAT_2010 %>% 
  ggplot(aes(x = math)) + 
  geom_density()
fig_4

# Figure 5: Create a density plot on the Average Math SAT Score. Change 
#           the bandwith to 10. 
# Note:     Changing the bandwidth to a smaller number makes it more jagged.

fig_5 <- SAT_2010 %>% 
  ggplot(aes(x = math)) + 
  geom_density(bw = 10)
fig_5

# Figure 6: Create a density plot on the Average Math SAT Score. Change 
#           the bandwith to 10. 

fig_6 <- SAT_2010 %>% 
  ggplot(aes(x = math)) + 
  geom_density(bw = 5)

fig_6

################
### Boxplots ###
################


# Figure 7: Create a box plot on the Average Math SAT Score. 

fig_7 <- SAT_2010 %>% 
  ggplot(aes(x = math)) +
  geom_boxplot()
fig_7

# Figure 8: Create a box plot on the Average Math SAT Score. Make the boxplot vertical.

fig_8 <- SAT_2010 %>% 
  ggplot(aes(x = math)) +
  geom_boxplot() +
  coord_flip()
fig_8

#################
### Bar Plots ###
#################


# Figure 9: Create a bar graph on the Salary Level (the new variable you created).

fig_9 <- SAT_2010 %>% 
  ggplot(aes(x = salary_level)) +
  geom_bar()
fig_9

# Figure 10: Create a bar graph on the Salary Level (the new variable you created).
#            Have the category "Low" appear first, then "Medium", then "High"  

fig_10 <- SAT_2010 %>% 
  mutate(salary_level = factor(salary_level, levels = c("Low", "Medium", "High"))) %>% 
  ggplot(aes(x = salary_level)) +
  geom_bar()
fig_10




########################################################
#################### Do it yourself ####################
############### Practice with "SAT_2010" ###############
########################################################


data("SAT_2010")

# Will add a categorical column to the dataset using the salary variable:

SAT_2010 <- SAT_2010 %>% 
  mutate(salary_level = case_when(
    salary < 52000 ~ "Low",
    salary >= 52000 & salary < 60000 ~ "Medium",
    salary >= 60000 ~ "High"
  ))


# Use SAT_2010 dataset for questions 1-6

# 1. Create a histogram for the read variable. Use 10 bins


# 2. Create a geometric density plot for the read variable. Use a bandwith of 10, then create 
# another plot with a bandwidth of 5.




# 3. Find the 5 number summary statistics (min, Q1, Median, Q3, max) for the variable write.
#    Hint: It is simply one function that gives you all the five numbers. Typically 
#    we extract the values directly from the console. 




# 4. Create a horizontal boxplots for the variable write. 




# 5. See where each summary statistic for # 3 is located in the boxplot. 
#    Simply do a visual inspection.


# 6. Create a vertical boxplot for the variable write





### The following codes will create a new data set in which we create categories for 
#   the pupil_teacher_ratio and for the salary.

SAT_More_Info <- SAT_2010 %>% 
  mutate(psr_cat = ifelse(pupil_teacher_ratio >= 13.8, "psr - high","psr - low"), 
         sal_cat = ifelse(salary >= 52000, "sal - high","sal - low"))

# Use SAT_More_Info dataset to answer the following questions: 

# 7. Create a bar graph for the psr_cat



# 8. Create a bar graph such that psr low comes first and psr high comes second.






