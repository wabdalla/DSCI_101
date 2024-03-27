
###########################
### Statistics (Part a) ###
###########################

library(tidyverse)

###############################
### Statistical Foundations ###
###############################


## Population vs Sample: Population is EVERYTHING. 
#                        Sample is a subset of the population.



## What is a "statistic"? A statistic is a numerical value or measure that 
#                         summarizes some aspect of a sample. 


## Sampling Distribution: it's a distribution of a sample statistic based on all 
#                         possible simple random samples of the same size from 
#                         the same population. 



# Standard error: it's the standard deviation of a sampling distribution. 



############################# 
### Creating a population ###
#############################

# We're simulating a population of one million data points with a normal 
# distribution (mean 0, standard deviation 1). Think of this as the entire 
# dataset representing the characteristics of some population.

N <- 1000000
set.seed(1234)
pop <- rnorm(N, 0, 1)

ggplot(tibble(pop), aes(pop))+
  geom_histogram()

mean(pop)
sd(pop)

###########################
### Creating one sample ###
###########################

# We randomly sample 100 data points from the population to create our sample: 

n <- 100
d <- sample(pop, n, replace = FALSE)
xbar <- mean(d)
xbar


####################################################
### Creating a Sampling Distribution of the Mean ###
####################################################

# Creating multiple samples and computing the mean of each sample. 

getxbar <- function(i, population_vector, n) {
  one_sample <- sample(population_vector, n, replace = FALSE)
  xbar <- mean(one_sample)
  return(xbar)
}


vector_of_means <- map_dbl(1:10000, getxbar, population_vector= pop, n = 100)


mean(vector_of_means) # We expect this to match the mean of the pop: mean(pop)
sd(vector_of_means) # This is the standard error of the sampling distribution. 
# We expect this to match the standard deviation of the 
# population divided by sqrt of the sample size. sd(pop)/sqrt(100)

ggplot(tibble(vector_of_means), aes(vector_of_means))+
  geom_histogram()


##################################################
### The Bootstrap - Estimating Standard Errors ###
##################################################


# The bootstrap is a resampling technique used to estimate standard errors 
# and confidence intervals for sample statistics. It's particularly useful 
# when you don't know the underlying data distribution.


N # population size
pop # population data points


ggplot(tibble(pop), aes(pop)) +
  geom_histogram()


# One sample (of size 100)

n <- 100
sample_dist <- sample(pop, n, replace = FALSE)
xbar<-mean(sample_dist)


boot_mean <- function(i, y){
  w <- mean(sample(y, replace = TRUE))
  return(w)
}



results <- map_dbl(1:10000, boot_mean, y = sample_dist)

sd(results) # sd(pop)/sqrt(100)


ggplot(tibble(results), aes(results)) +
  geom_histogram()


######################################### 
############ Do it yourself! ############
#########################################

# The shoulder heights of 18-year old men are approximately normal with a mean 
# of 68 inches and a standard deviation of 3 inches. 


# 1. What is the population here? Create a hypothetical population of shoulder 
# heights of 18 year old men. Assume a population of N = 1000000




# 2. Collect one sample from the population. Sample size = 200. 




# 3. Create a Sampling Distribution of the mean, with a sample size of 200.
#    Create a function that randomly selects a sample of size 200 from the population 
#    and computes the mean of the sample. Arguments should be a population vector and
#    sample size. The return should be the mean of the sample. 
#    Once you build the function, use a the map function to randomly select multiple 
#    samples of size n = 200. Iterate 10000 times. Meaning randomly draw 10000 samples, 
#    each one of size n = 200. 




# 4. Plot your sampling distribution




# 5. What is the expected mean and standard deviation of your sampling distribution?



# 6. Compute your actual mean and standard deviation using the sampling distribution you created. 



# 7. Use the bootstrap to estimate the standard error of the sampling distribution you created in the 
#    previous steps. Use one sample of sample size = 200. Use 10,000 iterations.



# 8. Compare your result in part 7 to the 


