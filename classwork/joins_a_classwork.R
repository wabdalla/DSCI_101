################################################################ 
################## Joins (Part a) - Classwork ##################
################################################################


library(tidyverse)
library(mdsr)
library(nycflights13)

## Joins: In the tidyverse, joining two datasets together is a way to combine data from different sources based on common variables. 
#         The dplyr package within the tidyverse provides functions to perform these joins.

### Inner Join: An inner join combines rows from two datasets where there's a match between the specified variables. 
#         Rows with no matching values are excluded. 
#         Inner joins return results if the keys are matched in BOTH tables.


# Read in dsci_101_class and dsci_101_class_nicknames


# It is always a good idea to carefully check that the number of rows returned by a join operation 
# is what you expected. In particular, you should carefully check for rows in one table that matched 
# to more than one row in the other table. 


# inspect the column by which you are joining. 

nrow(dsci_101_class)
n_distinct(dsci_101_class$Name)


nrow(dsci_101_class_nicknames)
n_distinct(dsci_101_class_nicknames$Name)


# To check how many data values from one dataset are in the other dataset.

table(dsci_101_class_nicknames$Name %in% dsci_101_class$Name)

table(dsci_101_class$Name %in% dsci_101_class_nicknames$Name)



# inner join

inner_joined_data <- dsci_101_class %>%
  inner_join(dsci_101_class_nicknames, by = "Name")

# Same thing as before, but this is in case the two columns in the two datasets have different names
inner_joined_data2 <- dsci_101_class %>%
  inner_join(dsci_101_class_nicknames, by = c("Name" = "Name"))

# Read in dsci_101_class_ice_cream
nrow(dsci_101_class_ice_cream)
n_distinct(dsci_101_class_ice_cream$Name)

# To check how many data values from one dataset are in the other dataset.

table(dsci_101_class_ice_cream$Name %in% dsci_101_class$Name)
table(dsci_101_class$Name %in% dsci_101_class_ice_cream$Name)


inner_joined_repeat <- dsci_101_class %>%
  inner_join(dsci_101_class_ice_cream, by = "Name")

########################################################
#################### Do it yourself ####################
############# Practice with "Flights Data" #############
########################################################


### Practice with Flights & Airline Data (datasets inside nycflights13 package)     

# 1. Load nycflights. Inside this package you're going to find "flights", "airlines", and "airports" data. 
#    Save each dataset as dataframes called "data_airlines", "data_flights" & "data_airport"


# 2. In step # 3, you are going to join two datasets (data_airlines & data_flights) with the variable "carrier". 
#    But before you join them, inspect the variable "carrier" in each dataframe. 
#    How many different values does this variable take in each dataset?
#    What values/characters does the variable take in each dataset?



# 3. inner_join data_flights and data_airlines by the variable "carrier".Then select columns carrier, name, flight, 
#         origin and dest. Name the new dataframe as "flights_joined"



# 4. Inspect the new dataframe "flights_joined". 
#    How many rows does it have? Does it make sense?


# 5. Create a new dataframe called "airports_pt" by using data_airport, 
# selecting rows with the pacific time zone (tz = -8)
# then select columns faa, name, tz.  


# 6. Inner join data_flights with airports_pt by "dest" and "faa", then select columns 
#    name, tz, dest, dep_time,sched_dep_time, arr_time, sched_arr_time, carrier


# 7. How many different airports in  airport_pt?


# 8. How many different airports in data_flights?


# 9. Are all the airports in airport_pt in data_flights?


# 10. Are all the airports in data_flights in airport_pt? 


# 11. How many airports did airports_pt and data_flights have in common?











