
##############################################################
################## Joining Dataset - Part 1 ##################
##############################################################


library(tidyverse)
library(mdsr)
library(nycflights13)

## Joins: In the tidyverse, joining two datasets together is a way 
#         to combine data from different sources based on common 
#         variables. 
#         The dplyr package within the tidyverse provides functions 
#         to perform these joins.

## Inner Join: An inner join combines rows from two datasets where 
#         there's a match between the specified variables. 
#         Rows with no matching values are excluded. 
#         Inner joins return results if the keys are matched in BOTH tables.

####################
### Reading Data ###
####################

Illustration_Data_1 <- read_csv("C:/Users/wabdalla/OneDrive - Loyola University Chicago/Desktop/DSCI 101/data/Illustration_Data_1.csv")
Illustration_Data_2 <- read_csv("C:/Users/wabdalla/OneDrive - Loyola University Chicago/Desktop/DSCI 101/data/Illustration_Data_2.csv")
Illustration_Data_3 <- read_csv("C:/Users/wabdalla/OneDrive - Loyola University Chicago/Desktop/DSCI 101/data/Illustration_Data_3.csv")

###########################
### inner join Function ###
###########################


# Example 1: Perform an inner join between Illustration_Data_1
#            and Illustration_Data_2

example_1 <- Illustration_Data_1 %>%
  inner_join(Illustration_Data_2, c("Name" = "First_Name"))


# Example 2: Perform an inner join between Illustration_Data_1
#            and Illustration_Data_3

example_2 <- Illustration_Data_1 %>%
  inner_join(Illustration_Data_3, c("Name" = "Name"))

# It is always a good idea to carefully check that the number of rows 
# returned by a join operation is what you expected. In particular, you 
# should carefully check for rows in one table that matched 
# to more than one row in the other table. 


# Inspect the column by which you are joining. 

nrow(Illustration_Data_1)
n_distinct(Illustration_Data_1$Name)


nrow(Illustration_Data_2)
n_distinct(Illustration_Data_2$First_Name)


# To check how many data values from one dataset are in the other dataset.

table(Illustration_Data_1$Name %in% Illustration_Data_2$First_Name)
table(Illustration_Data_2$First_Name %in% Illustration_Data_1$Name)


########################################################
#################### Do it yourself ####################
############# Practice with "Flights Data" #############
########################################################


### Practice with Flights & Airline Data (datasets inside nycflights13 package)     

# 1. Load nycflights13 package. Using this package, load the following dataframes: 
#    flights, airlines and airports data. 
#    On the console, Use ? followed by the name of the dataframe to read 
#    some background information on the dataframes. 




# 2. In step # 3, you are going to join two datasets (airlines & flights) with 
#    the variable "carrier". But before you join them, inspect the variable 
#    "carrier" in each dataframe: 
#    How many rows in each dataset?

#    How many different values does this variable take in each dataset?


#    What values/characters does the variable take in each dataset?





# 3. Join flights and airlines dataset by the variable "carrier".
#    using inner_join. Then select columns carrier, name, flight, origin and dest. 
#    Name the new dataframe as "question_3"





# 4. Inspect the new dataframe "question_3". 
#    How many rows does it have? Does it make sense?



# Your answer: 

# 5. Create a new dataframe called "question_5" by using airport, 
# selecting rows with the pacific time zone (tz = -8)
# then select columns faa, name, tz.  



# 6. Inner join flights with question_5 by dest (from flights) and faa (from question_5), 
#    then select columns name, tz, dest, dep_time, sched_dep_time, 
#    arr_time, sched_arr_time, carrier



# 7. How many different airports in  airport_pt?



# 8. How many different airports in flights?


# 9. Are all the airports in question_5 in flights?



# Answer: 

# 10. Are all the airports in flights in question_5? 



# 11. How many airports did question_5 and flights have in common?











