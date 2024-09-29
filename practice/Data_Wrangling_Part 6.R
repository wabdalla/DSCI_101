
#############################################################
################## Data Wrangling - Part 6 ##################
#############################################################

#install.packages("nycflights13")

library(tidyverse)
library(nycflights13)


####################
### Reading Data ###
####################

data("flights")

flights<-flights %>%
  left_join(airlines, by = c("carrier" = "carrier")) 


?flights

########################################################
#################### Do it yourself ####################
########################################################


# 1. Which airlines (actual name) had the most delayed flights departing from NYC in 2013? 
# (Note: a flight is considered delayed if their departure delay of more than 0 minutes)


 

# 2. What are the top 3 destinations (airport initials) for flights departing from NYC in 2013?
#    Hint: To choose the first n rows you can use the function head(n)





# 3. Which airlines (airline name) had the highest average departure delays from each airport?





# 4. What are the statistics (see below) of flight distances for flights departing from each airport?
# Statistics: Min, Median, max, mean, standard deviation)




# 5. Which airlines (full name) operated the most flights from each origin airport in NYC?



