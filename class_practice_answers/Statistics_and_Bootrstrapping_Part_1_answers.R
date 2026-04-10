###########################################
### Statistics & Bootstrapping - Part 1 ###
###########################################

library(tidyverse)

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



############################# 
### Creating a Population ###
#############################

# Normal Distribution: Mean 100, Standard deviation 15. 

N <- 1000000
normal_pop <- rnorm(N, mean = 100, sd = 15)

plot_1 <- data.frame(normal_pop) %>%
  ggplot(aes(normal_pop))+
  geom_histogram()
plot_1

# Uniform: min = 446, max = 520

N <- 1000000
uniform_pop <- runif(N, min = 446, max = 520)

plot_2 <- data.frame(uniform_pop) %>%
  ggplot(aes(uniform_pop))+
  geom_histogram()+
  coord_cartesian(xlim=c(440, 530), ylim=c(0,50000)) 
plot_2

# Beta: shape1 = 2, shape2 = 8.

N <- 1000000
beta_pop <- rbeta(N, shape1 = 2, shape2 = 8)

plot_3 <- data.frame(beta_pop) %>%
  ggplot(aes(beta_pop))+
  geom_histogram()
plot_3


###########################
### Creating One sample ###
###########################

# We randomly sample 100 data points from the population 
# of the normal distribution to create our sample. 

n <- 100
one_sample <- sample(normal_pop, n)
one_sample_mean <- mean(one_sample)
one_sample_mean


####################################################
### Creating a Sampling Distribution of the Mean ###
####################################################

## Sampling Distribution: it's a distribution of a sample statistic based on all 
#                         possible simple random samples of the same size from 
#                         the same population. 

# Creating multiple samples and computing the mean of each sample. 

get_one_sample_mean  <- function(i, population_vector, n) {
  one_sample <- sample(population_vector, n)
  one_sample_mean <- mean(one_sample)
  return(one_sample_mean)
}

# Sampling Distribution of the mean with n = 100.

sampling_distribution <- map_dbl(1:10000, get_one_sample_mean, population_vector= normal_pop, n = 100)


plot_4 <- data.frame(sampling_distribution) %>%
  ggplot(aes(sampling_distribution))+
  geom_histogram()
plot_4

# The standard error is the standard deviation of the sampling distribution. 
st_error <- sd(sampling_distribution) 
st_error


######################################### 
############ Do it yourself! ############
#########################################

#  1. The shoulder heights of 18-year old men are approximately normal 
#     with a mean of 68 inches and a standard deviation of 3 inches. 


# What is the population here? Create a hypothetical population of 
# shoulder heights of 18 year old men. Assume a population of N = 1000000
# Make a plot. 

N <- 1000000
pop_question_1 <- rnorm(N, 68, 3)

question_1 <- data.frame(pop_question_1) %>%
  ggplot(aes(pop_question_1)) +
  geom_histogram()
question_1 

# 2. Collect one sample from the population. Sample size = 200. Compute the 
#    min of this sample

n<-200
sample_one <- sample(pop_question_1, n)
min_sample <-min(sample_one)


# 3. Create a Sampling Distribution of the min, with a sample size of 200.
#    Create a function that randomly selects a sample of size 200 from the population 
#    and computes the min of the sample. Arguments should be a population vector and
#    sample size. The return should be the min of the sample. 
#    Once you build the function, use a the map function to randomly select multiple 
#    samples of size n = 200. Iterate 10000 times. Meaning randomly draw 10000 samples, 
#    each one of size n = 200. 


get_one_sample_min  <- function(i, population_vector, n) {
  one_sample <- sample(population_vector, n)
  one_sample_min <- min(one_sample)
  return(one_sample_min)
}

sampling_distribution_min <- map_dbl(1:10000, get_one_sample_min, population_vector= pop_question_1, n = 200)

# 4. Plot your sampling distribution

question_4 <- data.frame(sampling_distribution_min) %>%
  ggplot(aes(sampling_distribution_min)) +
  geom_histogram()
question_4

# 5. What is the standard error?

sd(sampling_distribution_min) 

# Repeat 1-5 using a Beta distribution for the population:
#            shape1 = 8, shape2 = 2.
#            Create a sampling Distribution for the max with n = 300. 

