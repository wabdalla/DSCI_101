
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

question_1 <- flights %>%
  filter(year == 2013) %>%
  filter(dep_delay > 0) %>%
  group_by(name) %>%
  summarize(N=n()) %>%
  filter(N == max(N))

question_1  

# 2. What are the top 3 destinations (airport initials) for flights departing from NYC in 2013?
#    Hint: To choose the first n rows you can use the function head(n)
question_2 <- flights %>%
  group_by(dest) %>%
  summarize(N = n()) %>%
  arrange(desc(N)) %>%
  head(3)

question_2


# 3. Which airlines (airline name) had the highest average departure delays from each airport?

question_3 <- flights %>%
  group_by(name, origin) %>%
  summarize(Avg_dep_delay = mean(dep_delay, na.rm = TRUE)) %>%
  group_by(origin) %>%
  filter(Avg_dep_delay == max(Avg_dep_delay))
question_3


# 4. What are the statistics (see below) of flight distances for flights departing from each airport?
# Statistics: Min, Median, max, mean, standard deviation)

question_4 <- flights %>%
  group_by(origin) %>%
  summarize(Min = min(distance), 
            Median = median(distance), 
            Max = max(distance), 
            Mean = mean(distance), 
            SD = sd(distance))
question_4

# 5. Which airlines (full name) operated the most flights from each origin airport in NYC?

question_5 <- flights %>%
  group_by(origin, name) %>%
  summarize(N = n()) %>%
  group_by(origin) %>%
  filter(N == max(N))

question_5
