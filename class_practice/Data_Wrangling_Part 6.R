
#############################################################
################## Data Wrangling - Part 6 ##################
#############################################################

# Note: Install "nycflights13" package in your console (if you
#       haven't already done so)

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

# 1. What airline had the smallest traveled distance? and 
#    what airport did it depart from and what airport did 
#    it land on?
#    Your final output should be a dataframe with 
#    four columns reflecting the name of the airline, 
#    the airport of origin, the destination, and the traveled 
#    distance.




# 2. What airline had the highest departure delay?
#    Your final output should be a dataframe with 
#    two columns reflecting the name of the airline
#    and the departure delay time. 




# 3. Which airlines (actual name) had the most delayed flights? 
# (Note: a flight is considered delayed if their departure delay 
#  of more than 0 minutes)

  


# 4. What are the statistics (see below) of flight distances for 
#    flights departing from each airport?
#    Statistics: Min, Median, max, mean, standard deviation)




# 5. What are the top 3 destinations (airport initials) for flights departing from NYC?
#    Meaning, what are the three top airports that received the most flights?
#    Hint: To choose the first n rows you can use the function head(n)




# 6. Which airlines (full name) operated the most flights from each origin airport in NYC?




# 7. Which airlines (airline name) had the highest average departure delays from each airport?


