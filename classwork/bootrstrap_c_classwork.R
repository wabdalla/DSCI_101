
############################################ 
### Simulations & Bootstrapping (Part c) ###
############################################


library(tidyverse)
library(Lahman)


##############################
### Iteration of Subgroups ###
##############################


# "hr_leader" is a custom function defined to find the HR (home run) 
#             leader in a specific subset of the Teams dataset. 
#             This subset is defined by a single year and league, 
#             represented by the input x.


# 1. Selects only the columns 'teamID' and 'HR' from the given subset.
# 2. Arranges the data in descending order based on 'HR'.
# 3. Retrieves the top entry using `head(1)` (the player/team with 
#    the highest number of home runs).


hr_leader <- function(df) {
  x <- df %>% 
    select(teamID, HR) %>% 
    arrange(desc(HR)) %>% 
    head(1)
  return(x)
}


### Example: Find the HR leader in the year 1961 in the AL league

Teams %>% 
  filter(yearID == 1961 & lgID == "AL") %>% 
  hr_leader()



### Grouping and Applying Custom Function to Subgroups

# In this section, the code uses the `group_by` and `group_modify` 
# functions to iterate over subgroups of the Teams dataset. It's 
# done for each combination of `yearID` and `lgID (league ID).

# * `.keep = TRUE` is used to indicate that the grouping variables 
# (yearID and lgID) should be kept in the output.


iteration_subgroup <- Teams %>% 
  group_by(yearID, lgID) %>% 
  group_modify(~hr_leader(.x), .keep = TRUE) 

tail(iteration_subgroup, 4)
head(iteration_subgroup, 4)


##################### 
### Bootstrapping ###
#####################

# Bootstrapping is used to estimate statistics, specifically the mean, 
# for a particular year (2000) from the Teams dataset. 
# It randomly samples HR data with replacement and calculates the mean, 
# repeating this process many times.

# The standard error estimate and quantiles are computed to understand 
# the distribution of means.


HR_2000<-Teams %>%
  filter(yearID == 2000) %>%
  pull(HR)
hist(HR_2000)

mean(HR_2000)
sd(HR_2000)

boot_mean <- function(i, y){
  w <- mean(sample(y, replace = TRUE))
  return(w)
}


results <- map_dbl(1:1000, boot_mean, HR_2000)

quantile(results, c(0.025, 0.5, 0.975))
sd(results)


ggplot(tibble(results), aes(results)) +
  geom_histogram()



######################################### 
############ Do it yourself! ############
#########################################


# The probability of a point falling inside a unit circle is 
# proportional to the area of the circle, which is pi. Therefore, 
# by counting the number of points that fall inside the circle, 
# we can estimate the value of pi.


# Step 1. Create a function that randomly sample points from a square 
# with side length 2 and check if they fall inside the unit circle. 




# Step 2. Now use map to simulate this function many times



# Step 3. Calculate the proportion of number of points that fell inside
# the circle to the total number of points generated. 



# Step 4. Multiply the proportion in Part 3 by 4 and that is 
# your estimate of pi.




