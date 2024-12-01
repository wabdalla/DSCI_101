
###########################################
### Statistics & Bootstrapping - Part 2 ###
###########################################

library(tidyverse)
library(Lahman)

################################# 
### Sampling With Replacement ###
#################################

# When you sample with replacement, the object you selected is put 
# back into the pool before another object is sampled. 


vector <- 1:6

sample(vector, 3, replace = TRUE)

###############################
### Statistical Foundations ###
###############################


## Population vs Sample: Population is EVERYTHING. 
#                        Sample is a subset of the population.



## What is a "statistic"? A statistic is a numerical value or measure that 
#                         summarizes some aspect of a sample. (i.e., mean, 
#                         median, sample standard deviation... etc.)


## Sampling Distribution: it's a distribution of a sample statistic based on all 
#                         possible simple random samples of the same size from 
#                         the same population. 



# Standard Error: it's the standard deviation of a sampling distribution. 


######################################################
### Review: Computing the Standard Error from a ######
### Sampling Distribution of the Mean with n = 100 ###
######################################################

# Population
normal_pop <- rnorm(1000000, mean = 100, sd = 15)

get_one_sample_mean  <- function(i, population_vector, n) {
  one_sample <- sample(population_vector, n)
  one_sample_mean <- mean(one_sample)
  return(one_sample_mean)
}

# Sampling Distribution of the mean with n = 100.
sampling_distribution <- map_dbl(1:10000, get_one_sample_mean, population_vector= normal_pop, n = 100)
# Standard Error 
st_error <- sd(sampling_distribution) 
st_error 

##################### 
### Bootstrapping ###
#####################

# The bootstrap is a resampling technique used to estimate standard errors 
# and confidence intervals for sample statistics. It's particularly useful 
# when you don't know the underlying data distribution.


# A bootstrap sample is a sample of the same size of the original sample
# and sampling is done with replacement. 


# Step 1: Start with a sample. 

initial_sample <- sample(normal_pop, 100)

# Plot of the Initial Sample
sample_plot <- data.frame(initial_sample) %>%
  ggplot(aes(x=initial_sample)) + 
  geom_histogram()
sample_plot


# Step 2: Create a function that draws one bootstrap sample from a 
#         given sample and computes a statistic on the bootstrap sample.
#         In this example the statistic is the mean. 

boot_mean <- function(i, y){
  boot_sample <- sample(y, length(y), replace = TRUE)
  value <- mean(boot_sample)
  return(value)
}


# Step 3: Using the function from Step 2, draw 10000 bootstrap samples and 
#         compute the mean on each. 

all_values <- map_dbl(1:10000, boot_mean, y = initial_sample)


# Step 4: Compute the standard deviation of the 10000 bootstrap sample means 
#         from Step 3. That is the estimated standard error. 

sd(all_values) # Output: 1.628731


######################################### 
############ Do it yourself! ############
#########################################


population <- rnorm(1000000, 68, 3)

# For the population above, a mathematical formula/theorem states 
# that the standard error of the sample mean with n = 200 is: 3/sqrt(200) = 0.212132 

# 1. Draw one sample of size 200 from the population above. 
#    name this sample "my_sample". 

my_sample <- sample(population, 200)

# 2. Use the bootstrap to estimate the standard error of the sampling distribution 
#    of the mean with n = 200. Use 10,000 iterations.


boot_mean <- function(i, y){
  boot_sample <- sample(y, length(y), replace = TRUE)
  value <- mean(boot_sample)
  return(value)
}

all_values <- map_dbl(1:10000, boot_mean, y = my_sample)

sd(all_values)

# Compare your estimated standard error to the standard error given by the formula.


# 3. Using the Teams dataset (Lahman package), filter for the year 2000. 
#    Take the HR column as your sample (you must turn it to a vector either
#    by using the pull function or $)

question_3<-Teams %>%
  filter(yearID == 2000) %>%
  pull(HR)


hist(question_3)

mean(question_3)
sd(question_3)


# 4. Using the sample from part 3, estimate the standard error of the mean.  
boot_mean <- function(i, y){
  boot_sample <- sample(y, length(y), replace = TRUE)
  value <- mean(boot_sample)
  return(value)
}

results <- map_dbl(1:1000, boot_mean, question_3)

sd(results)









