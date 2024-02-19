
##################################################################### 
############## Data Visualization (Part b) - Classwork ##############
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


#############################
### Multivariate displays ###
#############################



###################
## Scatter plots ##
###################


SAT_2010 <- SAT_2010 %>%
  mutate(ptr = ifelse(pupil_teacher_ratio >= 15, "ptr - high","ptr - low"), 
         sal = ifelse(salary >= 52000, "sal - high","sal - low"),
         SAT_rate = cut(
           sat_pct,
           breaks = c(0, 30, 60, 100),
           labels = c("low", "medium", "high")
         ))



SAT_2010 %>% 
  ggplot(aes(x = expenditure, y = math)) + 
  geom_point()


# We can easily add a trend line with ggplot.  


SAT_2010 %>% 
  ggplot(aes(x = expenditure, y = math)) + 
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) 

## geom_smooth
SAT_2010 %>% 
  ggplot(aes(x = expenditure, y = math)) + 
  geom_point() +
  geom_smooth(method = "loess", se = TRUE) 



### Color or Shape 

SAT_2010 %>% 
  ggplot(aes(x = expenditure, y = math, color = SAT_rate)) +
  geom_point()

## add a trend line to help visually explain differences 
SAT_2010 %>% 
  ggplot(aes(x = expenditure, y = math, color = SAT_rate)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE)


## Now try with shape
SAT_2010 %>% 
  ggplot(aes(x = expenditure, y = math, shape = SAT_rate)) +
  geom_point()

## can be hard to see so generally can be combined together
## this is redundant but can help bring the point home
SAT_2010 %>% 
  ggplot(aes(x = expenditure, y = math, color = SAT_rate, shape = SAT_rate)) +
  geom_point()

##############
## Faceting ##
##############

# This is similar to using shape or color for a categorical variables 
# but puts them on separate plots.


SAT_2010 %>% 
  ggplot(aes(x = expenditure, y = math)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  facet_wrap(~ SAT_rate)

## can use 2 categorical variables
SAT_2010 %>% 
  #mutate(ptr = ifelse(pupil_teacher_ratio >= 15, "ptr - high","ptr - low")) %>% 
  ggplot(aes(x = expenditure, y = math)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  facet_grid(ptr ~ SAT_rate)

### Side-by-Side

SAT_2010 %>% 
  ggplot(aes(math, SAT_rate)) +
  geom_boxplot() +
  coord_flip()


########################################################
#################### Do it yourself ####################
############### Practice with "SAT_2010" ###############
################ Practice with "Cherry" ################
########################################################


# Use SAT_2010 dataset to recreate the plots (1 & 5) and use
# Cherry dataset to recreate plots 2, 3, & 4


# Load Cherry dataset and read about the data

# Plot 1 (SAT_2010 dataset)


# Plot 2 (Cherry dataset)


# Plot 3 (Cherry dataset)


# Plot 4 (Cherry dataset)
 

# Plot 5 (SAT_2010 dataset)


