
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

question_1 <- flights %>%
  filter(distance == min(distance)) %>%
  select(name, origin, dest, distance)
question_1


# 2. What airline had the highest departure delay?
#    Your final output should be a dataframe with 
#    two columns reflecting the name of the airline
#    and the departure delay time. 

question_2 <- flights %>%
  filter(dep_delay == max(dep_delay, na.rm = TRUE)) %>%
  select(name, dep_delay)
question_2


# 3. Which airlines (actual name) had the most delayed flights? 
# (Note: a flight is considered delayed if their departure delay 
#  of more than 0 minutes)

question_3 <- flights %>%
  filter(dep_delay > 0) %>%
  group_by(name) %>%
  summarize(N=n()) %>%
  filter(N == max(N))

question_3  


# 4. What are the statistics (see below) of flight distances for 
#    flights departing from each airport?
#    Statistics: Min, Median, max, mean, standard deviation)

question_4 <- flights %>%
  group_by(origin) %>%
  summarize(Min = min(distance), 
            Median = median(distance), 
            Max = max(distance), 
            Mean = mean(distance), 
            SD = sd(distance))
question_4


# 5. What are the top 3 destinations (airport initials) for flights departing from NYC?
#    Meaning, what are the three top airports that received the most flights?
#    Hint: To choose the first n rows you can use the function head(n)
question_5 <- flights %>%
  group_by(dest) %>%
  summarize(N = n()) %>%
  arrange(desc(N)) %>%
  head(3)

question_5

# 6. Which airlines (full name) operated the most flights from each origin airport in NYC?

question_6 <- flights %>%
  group_by(origin, name) %>%
  summarize(N = n()) %>%
  group_by(origin) %>%
  filter(N == max(N))

question_6


# 7. Which airlines (airline name) had the highest average departure delays from each airport?

question_7 <- flights %>%
  group_by(name, origin) %>%
  summarize(Avg_dep_delay = mean(dep_delay, na.rm = TRUE)) %>%
  group_by(origin) %>%
  filter(Avg_dep_delay == max(Avg_dep_delay))
question_7
