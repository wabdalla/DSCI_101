
###########################
### Statistics (Part b) ###
###########################

library(tidyverse)
library(mdsr)
library(broom)
library(palmerpenguins)

################
### Outliers ###
################


#  Outliers: are data points that significantly deviate from the rest 
#            of the dataset. Their presence can have various causes, 
#            including measurement errors or genuine extreme values. 
#            How outliers are treated depends on their origin.


# Formula for outliers: 
# first quartile = quantile(vector/column, probs = 0.25)
# third quartile = quantile(vector/column, probs = 0.75)
# IQR = third quartile - first quartile; 
# Lower fence = first quartile - 1.5*IQR
# Upper fence = third quartile + 1.5*IQR


##########################
### Statistical Models ###
##########################


# Statistical models: are structures that allow us to relate variables 
#                     to one another. They are used for various purposes, 
#                     including prediction, inference, and explanation. 
#                     It's important to remember that no model perfectly 
#                     represents reality, but some models can be highly useful.

# Example: Analyzing the relationship between teacher salaries and SAT scores:

?SAT_2010

SAT_2010 <- SAT_2010 %>%
  mutate(Salary = salary/1000)

# Scatter plot of Teacher Salary and total SAT scores.

SAT_2010 %>%
  ggplot(aes(x = Salary, y = total)) + 
  geom_point() + 
  geom_smooth(method = "lm") + 
  ylab("Average total score on the SAT") + 
  xlab("Average teacher salary (thousands of USD)")

SAT_2010 %>%
  summarize(Correlation = cor(Salary, total))


# Visualization of teachers salaries and student's SAT scores. 
# As their scores go down teachers salaries go up? 
# Is this how these variables are related?

# Let's look at the model.


SAT_mod1 <- lm(total ~ Salary, data = SAT_2010)
SAT_mod1_tidy <- tidy(SAT_mod1)


####################################################
### Confounding and Accounting for Other Factors ###
####################################################

# Confounding occurs when an observed association between two 
# variables is actually due to a third variable. It's important 
# to account for confounders to avoid drawing incorrect conclusions. 
# Models that include confounding variables help disentangle 
# relationships.

# Let's examine our previous example:

summary_sat_pct<-SAT_2010 %>%
  skim(sat_pct)


## who takes the SAT vs ACT

SAT_2010 <- SAT_2010 %>%
  mutate(SAT_grp = ifelse(sat_pct <= 27, "ACT", "SAT"))
SAT_2010 %>%
  group_by(SAT_grp) %>%
  count()


SAT_2010 %>%
  ggplot(aes(x = Salary, y = total, color = SAT_grp)) + 
  geom_point() + 
  geom_smooth(method = "lm") + 
  ylab("Average total score on the SAT") + 
  xlab("Average teacher salary (thousands of USD)")


#################################
### The Perils of the p-value ###
#################################

# P-values are widely used in hypothesis testing, 
# but they come with important considerations:
# P-values indicate compatibility with a model.
# They do not measure the probability that a hypothesis is true.
# Relying solely on p-values is not advisable. Consider effect size 
# and confidence intervals.
# Transparency and reporting of actual p-values are crucial.
# A p-value doesn't provide information about effect size.
# Be cautious with multiple testing.
# The understanding and responsible use of p-values are essential for 
# sound statistical analysis.
# Remember that statistics is a broad and complex field, and these are 
# just introductory concepts. 
# Each area, from bootstrapping to modeling and hypothesis testing, has 
# its own rich theory and practical considerations.

######################################### 
############ Do it yourself! ############
#########################################


# Go through all the steps below. The goal is to use the `penguins` dataset, 
# to estimate the mean bill depth of Adelie penguins and assess the 
# the standard error using bootstrapping.

# 1. Prepare the data.
# Load the `penguins` dataset. Then filter the data to include only the entries 
# corresponding to Adelie penguins.





# 2. Initial Estimate
# Calculate the mean bill depth for the Adelie penguins. 
# This is your initial point estimate for the population.





# 3. Bootstrapping
# To assess the variability in your estimate, perform bootstrapping. 
# Use resampling with replacement to create 1,000 bootstrap samples of 
# the bill depth. For each resampled dataset, calculate the mean bill depth.




# 4. Create a histogram of the 1,000 bootstrapped means to visualize the sampling distribution.






# 5. Estimating Uncertainty
# Find the standard error of the bootstrapped means. 




# 6. Repeat for other Species to get more practice.

