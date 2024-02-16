
##################################################################### 
############## Data Visualization (Part a) - Classwork ##############
#####################################################################

library(tidyverse)
library(mdsr)
data("SAT_2010")

###############
### ggplot2 ###
###############


# Fundamental components of ggplot2

# Data: The dataset you're working with.
# Aesthetics Mapping (aes): How data variables map to plot aesthetics like position, color, shape, etc.
# Geometric Objects (geom): The visual elements to represent the data (points, lines, bars, etc.).
# Facets (facet_wrap or facet_grid): Splitting data into subplots based on a variable.
# Theme: Controlling the overall appearance of the plot.

# Think of every command as a layer like the pipe for `dplyr`


## Types of Plots

### One Variable Plots (Univariate):
# 1. Numeric Variables:
#        Histogram: Visualize the distribution of a numeric variable.
#        Density Plot: Similar to a histogram but with a smooth curve.
#        Boxplot: Display the distribution's summary statistics and outliers.

# 2. Categorical Variables:
#        Bar Plot: Display the frequencies or proportions of different categories. (The only good one!!!)






###########################
### Univariate displays ###
###########################

################
## Histograms ##
################


SAT_2010 %>% 
  ggplot(aes(x = math)) +
  geom_histogram()

## change the break points
SAT_2010 %>% 
  ggplot(aes(x = math)) +
  geom_histogram(breaks = c(450,475,500,525,550,575,600,625))
## change the bins
SAT_2010 %>% 
  ggplot(aes(x = math)) +
  geom_histogram(bins = 9)


#####################
### Density Plots ###
#####################


SAT_2010 %>% 
  ggplot(aes(x = math)) + 
  geom_density()

#changing the bandwidth to be more jagged
## the smaller the more jagged
SAT_2010 %>% 
  ggplot(aes(x = math)) + 
  geom_density(bw = 10)

SAT_2010 %>% 
  ggplot(aes(x = math)) + 
  geom_density(bw = 5)

################
### Boxplots ###
################


SAT_2010 %>% 
  ggplot(aes(x = math)) +
  geom_boxplot()

## sometimes easier to view with a flipped axis
SAT_2010 %>% 
  ggplot(aes(x = math)) +
  geom_boxplot() +
  coord_flip()


#################
### Bar Plots ###
#################

## Need a Categorical Variables to Count

Salaries <- SAT_2010 %>% 
  mutate(salary_level = case_when(
    salary < 52000 ~ "Low",
    salary >= 52000 & salary < 60000 ~ "Medium",
    salary >= 60000 ~ "High"
  )) 


Salaries %>% 
  ggplot(aes(x = salary_level)) +
  geom_bar()

## notice that it put's it in alphabetical order

Salaries %>% 
  mutate(salary_level = factor(salary_level, levels = c("Low", "Medium", "High"))) %>% 
  ggplot(aes(x = salary_level)) +
  geom_bar()



########################################################
#################### Do it yourself ####################
############### Practice with "SAT_2010" ###############
########################################################



# Use SAT_2010 dataset for questions 1-6

# 1. Create a histogram for the read variable. Use 10 bins



# 2. Create a geometric density plot for the read variable. Use a bandwith of 10, then create 
# another plot with a bandwidth of 5.




# 3. Find the 5 number summary statistics for the variable write.


# 4. Create a horizontal boxplots for the variable write. 



# 5. See where each summary statistic for # 3 is located in the boxplot. Simply do a visual inspection.

# 6. Create a vertical boxplot for the variable write

     
  
### The following codes will create a new data set in which we create categories for 
#   the pupil_teacher_ratio and for the salary.


# Use SAT_More_Info dataset to answer the following questions: 

# 7. Create a bar graph for the psr_cat


# 8. Create a bar graph such that psr low comes first and psr high comes second.






