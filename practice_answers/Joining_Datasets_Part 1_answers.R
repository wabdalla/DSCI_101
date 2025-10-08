
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

data("airlines")
data("flights")
data("airports")


# 2. In step # 3, you are going to join two datasets (airlines & flights) with 
#    the variable "carrier". But before you join them, inspect the variable 
#    "carrier" in each dataframe: 
#    a. How many rows in each dataset?

nrow(airlines) # 16
nrow(flights)  # 336776

#    b. How many different values does the variable carrier take in each dataset?

n_distinct(airlines$carrier) # 16
n_distinct(flights$carrier) # 16


# Note that airlines has 16 total rows and 16 distinct rows. 

#    c. What values/characters does the variable take in each dataset?

table(airlines$carrier)
table(flights$carrier)

#    d. Using the variable carrier, check how many values/characters from 
#       dataset airlines are contained in the flights dataset and vice versa. 
table(airlines$carrier %in% flights$carrier)
table(flights$carrier %in% airlines$carrier)

# Note: These results indicate that all the carrier values are fully contained 
#       in both datasets. Since all the values in airlines dataset are unique and
#       distinct, then inner_joining these two datasets will give you exactly 
#       336,776 rows which is exactly the number of rows in flights. 

# 3. Join flights and airlines dataset by the variable "carrier".
#    using inner_join. Then select columns carrier, name, flight, origin and dest. 
#    Name the new dataframe as "question_3"


question_3 <- flights %>% 
  inner_join(airlines, by = c("carrier" = "carrier")) %>%
  select(carrier, name, flight, origin, dest) 


# 4. Inspect the new dataframe "question_3". 
#    How many rows does it have? Does it make sense?

nrow(question_3)

# Your answer: Yep, makes sense. In this case, all of the rows in flights 
# have exactly one corresponding entry in airlines, so the number of rows in 
# question_3 is the same as the number of rows in flights (this will not 
# always be the case).

# 5. Create a new dataframe called "airport_pt" by using airports dataset, 
#    Select rows with the pacific time zone (tz = -8)
#    then select columns faa, name, tz.  

airport_pt <- airports %>%
  filter(tz == -8) %>% 
  select(faa, name, tz)

nrow(airport_pt)

# 6. Inner join flights with airport_pt by dest (from flights) and faa (from airport_pt), 
#    then select columns name, tz, dest, dep_time, sched_dep_time, 
#    arr_time, sched_arr_time, carrier. Name this dataframe question_6. 

question_6 <- flights %>% 
  inner_join(airport_pt, by = c("dest" = "faa")) %>% 
  select(name, tz, dest, dep_time,sched_dep_time, arr_time, sched_arr_time, carrier)

# 7. How many different airports in  airport_pt (from question 5)?

n_distinct(airport_pt$faa) # 178

# 8. How many different airports in flights?
n_distinct(flights$dest)  # 105

# 9. Are all the airports in airport_pt in flights?

table(airport_pt$faa %in% flights$dest)

# Answer: no. only 13 airports in airport_pt are in flights. 

# 10. Are all the airports in flights in airport_pt? 

table(flights$dest %in% airport_pt$faa)

# Answer: no. Only 46,324 rows are in airport_pt. However, since airport_pt
#         has rows that are all distinct, I would expect that when merging flights
#         and airport_pt I would have 46,324.

# 11. Using question_6 (the merged datafile). How many airports did airport_pt 
#     and flights have in common?

n_distinct(question_6$dest)

# Note: This matches the TRUE from question # 9. 







