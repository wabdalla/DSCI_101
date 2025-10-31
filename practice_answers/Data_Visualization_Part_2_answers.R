
######################################################### 
############## Data Visualization - Part 2 ##############
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

### Two Variable Plots:

# 1. Numeric vs. Numeric:
#    * Scatter Plot: Visualize the relationship between two numeric variables.
#    * Line Plot: Display (connected) changes over time or another continuous 
#      variable.

# 2. Numeric vs. Categorical (Side-by-Side):
#    * Box Plot: Compare numeric values across different categories.
#    * Violin Plot: Compare the distribution of numeric values across categories.
#    * Bar Plot: Show numeric values within different categories.

# 3. Categorical vs. Categorical:
#    * Grouped Bar Plot: Compare frequencies or proportions of multiple 
#      categorical variables side by side.
#    * Stacked Bar Plot: Similar to a grouped bar plot, but bars are stacked.

### Three Variable Plots:

# 1. Numeric vs. Numeric vs. Categorical:
#    * Faceted Plot: Create multiple small plots based on a third categorical 
#      variable.
#    * Bubble Plot: Similar to a scatter plot, but with bubbles of varying 
#      sizes representing a third variable.

# 2. Categorical vs. Categorical vs. Numeric:
#    * Heatmap: Display the relationship between two categorical variables using 
#      color intensity.

### Multivariate Plots:

# 1. Numeric vs. Numeric vs. Numeric:
#    * 3D Scatter Plot: Visualize the relationship between three numeric 
#      variables in three dimensions.
# 2. Categorical vs. Categorical vs. Categorical:
#    * Mosaic Plot: Display the relationship between three categorical variables 
#      using rectangular tiles.


####################
### Reading Data ###
####################

# The data comes from the mdsr package. You can read more background information
# on the data by typing ?SAT_2010 in your console

data("SAT_2010")


# Will add three categorical variables to the dataset:

SAT_2010 <- SAT_2010 %>%
  mutate(ptr = ifelse(pupil_teacher_ratio >= 15, "ptr - high","ptr - low"), 
         sal = ifelse(salary >= 52000, "sal - high","sal - low"),
         SAT_rate = cut(
           sat_pct,
           breaks = c(0, 30, 60, 100),
           labels = c("low", "medium", "high")
         ))


#############################
### Multivariate displays ###
#############################

################
## Bar Graphs ##
################

# Figure 1: Make a bar graph with SAT_rate. Notice that this is a 
#           One Variable Bar Graph (it counts by default)
fig_1 <- SAT_2010 %>% 
  ggplot(aes(x = SAT_rate)) +
  geom_bar() 
fig_1


# Figure 2: Make a bar graph with SAT_rate on the x axis and The Average Math
#           Score on the y axis. Notice that this is a two Variable Bar Graph 
#           (you need stat = "identity")

fig_2 <- SAT_2010 %>% 
  ggplot(aes(x = SAT_rate, y = math)) +
  geom_bar(stat = "identity") 
fig_2


# Figure 3: Make a bar graph with SAT_rate on the x axis and The Average Math
#           Score on the y axis. Make every column a different color. 

fig_3 <- SAT_2010 %>% 
  ggplot(aes(x = SAT_rate, y = math, fill = SAT_rate)) +
  geom_bar(stat = "identity") 
fig_3

# Figure 4: (Stacking by a third variable). Make a bar graph with SAT_rate on 
#           the x axis and The Average Math Score on the y axis. Stack the bars 
#           by the variable ptr. 

fig_4 <- SAT_2010 %>% 
  ggplot(aes(x = SAT_rate, y = math, fill = ptr)) +
  geom_bar(stat = "identity") 
fig_4

# Figure 5: (Grouped Bar Graph). Make a bar graph with SAT_rate on the x axis 
#           and The Average Math Score on the y axis. Group the bars 
#           by the variable ptr. 

fig_5 <- SAT_2010 %>% 
  ggplot(aes(x = SAT_rate, y = math, fill = ptr)) +
  geom_bar(stat = "identity", position = "dodge") 
fig_5


###############
## Box Plots ##
###############

# Figure 6: Make side by side box plots with SAT_rate on the x axis 
#           and The Average Math Score on the y axis. 

fig_6 <- SAT_2010 %>% 
  ggplot(aes(x = SAT_rate, y = math)) +
  geom_boxplot() 
fig_6

# Figure 7: Make side by side box plots with SAT_rate on the x axis 
#           and The Average Math Score on the y axis. Change the filling color
#           of each SAT_rate. 

fig_7 <- SAT_2010 %>% 
  ggplot(aes(x = SAT_rate, y = math, fill = SAT_rate)) +
  geom_boxplot() 
fig_7



###################
## Scatter Plots ##
###################

# Figure 8: Create a Scatter Plot on the Expenditure and The Average Math SAT Score.
fig_8 <- SAT_2010 %>% 
  ggplot(aes(x = expenditure, y = math)) + 
  geom_point()
fig_8


# Figure 9: Create a Scatter Plot on the Expenditure and The Average Math SAT 
#           Score and add a trend line with ggplot.  


fig_9 <- SAT_2010 %>% 
  ggplot(aes(x = expenditure, y = math)) + 
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) 
fig_9

# Figure 10: Create a Scatter Plot on the Expenditure and The Average Math SAT 
#           Score and add a polynomial fitting with the standard error band. 


fig_10 <- SAT_2010 %>% 
  ggplot(aes(x = expenditure, y = math)) + 
  geom_point() +
  geom_smooth(method = "loess", se = TRUE) 
fig_10


# Figure 11: Create a Scatter Plot on the Expenditure and The Average Math SAT 
#           Score and split the data with different colors by SAT_rate. 

fig_11 <- SAT_2010 %>% 
  ggplot(aes(x = expenditure, y = math, color = SAT_rate)) +
  geom_point()
fig_11

# Figure 12: Create a Scatter Plot on the Expenditure and The Average Math SAT 
#           Score and split the data with different colors by SAT_rate. Add a 
#           trend line.


fig_12 <- SAT_2010 %>% 
  ggplot(aes(x = expenditure, y = math, color = SAT_rate)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE)
fig_12

# Figure 13: Create a Scatter Plot on the Expenditure and The Average Math SAT 
#           Score and split the data with different shapes by SAT_rate. 

fig_13 <- SAT_2010 %>% 
  ggplot(aes(x = expenditure, y = math, shape = SAT_rate)) +
  geom_point()
fig_13


# Figure 14: Create a Scatter Plot on the Expenditure and The Average Math SAT 
#           Score and split the data with different shapes and colors by SAT_rate. 

fig_14 <- SAT_2010 %>% 
  ggplot(aes(x = expenditure, y = math, color = SAT_rate, shape = SAT_rate)) +
  geom_point()
fig_14


##############
## Faceting ##
##############

# This is similar to using shape or color for a categorical variables 
# but puts them on separate plots.

# Facet with 1 variable: 

# Figure 15: Create a Scatter Plot on the Expenditure and The Average Math SAT 
#           Score and split the data by SAT_rate where each category is a separate
#           plot. Include a trend line.  
fig_15 <- SAT_2010 %>% 
  ggplot(aes(x = expenditure, y = math)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  facet_wrap(~SAT_rate)
fig_15


# Facet with 2 variables

# Figure 16: Create a Scatter Plot on the Expenditure and The Average Math SAT 
#           Score and split the data by SAT_rate and ptr where each pair of 
#           categories is a separate plot. Include a trend line with a standard 
#           error band.  
fig_16 <- SAT_2010 %>% 
  ggplot(aes(x = expenditure, y = math)) +
  geom_point() +
  geom_smooth(method = "lm", se = TRUE) +
  facet_grid(ptr ~ SAT_rate)
fig_16


########################################################
#################### Do it yourself ####################
############### Practice with "SAT_2010" ###############
###############  Practice with "Cherry"  ###############
########################################################

# Reading in datasets: 

data("SAT_2010")

SAT_2010 <- SAT_2010 %>%
  mutate(ptr = ifelse(pupil_teacher_ratio >= 15, "ptr - high","ptr - low"), 
         sal = ifelse(salary >= 52000, "sal - high","sal - low"),
         SAT_rate = cut(
           sat_pct,
           breaks = c(0, 30, 60, 100),
           labels = c("low", "medium", "high")
         ))


data("Cherry")



# Plot 1: Use SAT_2010 dataset to recreate Plot # 1. 


plot_1 <- SAT_2010 %>% 
  ggplot(aes(x = math, y = read, color = SAT_rate)) +
  geom_point() +
  facet_grid(sal ~ ptr)
plot_1

# Plot 2: Use Cherry dataset to recreate Plot # 2. 


plot_2 <- Cherry %>% 
  ggplot(aes(x = sex, y = gun, color = sex)) +
  geom_boxplot()
plot_2

# Plot 3: Use Cherry dataset to recreate Plot # 3
plot_3 <- Cherry %>%
  filter(year %in% c(1999, 2000, 2001)) %>%
  ggplot(aes(x=age)) +
  geom_histogram() + 
  facet_wrap(~ year)
plot_3

# Plot 4: Use Cherry dataset to recreate Plot # 4 
plot_4 <- Cherry %>%
  filter(year %in% 2003:2006) %>%
  ggplot(aes(x = sex, y = nruns)) +
  geom_bar(stat = "identity") + 
  facet_wrap(~ year)  
plot_4

# Plot 5: Use SAT_2010 dataset to recreate Plot # 5


plot_5 <- SAT_2010 %>% 
  select(state, read, math, write) %>%
  pivot_longer(cols = -state, 
               names_to = "test_type", 
               values_to = "scores") %>%
  ggplot(aes(x=test_type, y = scores)) +
  geom_boxplot()
plot_5
