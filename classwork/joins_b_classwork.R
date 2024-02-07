################################################################ 
################## Joins (Part b) - Classwork ##################
################################################################


library(tidyverse)
library(mdsr)
library(nycflights13)

#################
### Left Join ###
#################

#   A left join includes all rows from the left dataset and the matching rows from the right dataset. 
#   If there's no match, the columns from the right dataset will be filled with NA. 
#   Here the rows of the first table are always returned, regardless of whether there is 
#   a match in the second table.


# Read in dsci_101_class and dsci_101_class_nicknames

# Inner join (review)
inner_joined_data <- dsci_101_class %>%
  inner_join(dsci_101_class_nicknames, by = c("Name" = "Name"))

# Left Join with dsci_101_class being the left dataset
left_joined_data <- dsci_101_class %>%
  left_join(dsci_101_class_nicknames, by = c("Name" = "Name"))

# Left Join with dsci_101_class_nicknames being the left dataset
left_joined_data2 <- dsci_101_class_nicknames %>%
  left_join(dsci_101_class, by = c("Name" = "Name"))

##################
### Right Join ###
##################

#   A right join is the opposite of a left join. It includes all rows from the right dataset 
#   and the matching rows from the left dataset. A right join but this is much less common. 

# Right Join with dsci_101_class being the left dataset

right_joined_data <- dsci_101_class %>%
  right_join(dsci_101_class_nicknames, by = c("Name" = "Name"))

#################
### Full Join ###
#################

#   A full join includes all rows from both datasets. Columns from the dataset with missing values 
#   will be filled with NA where there's no match.

# Full Join with dsci_101_class and dsci_101_class_nicknames

full_joined_data <- dsci_101_class %>%
  full_join(dsci_101_class_nicknames, by = c("Name" = "Name"))


########################
### Summarizing NA's ###
########################

# Summary inner join
summary_inner_join <- inner_joined_data %>%
  summarize(common_students = n(), 
            num_na = sum(is.na(Nicknames)),
            num_not_na = sum(!is.na(Nicknames)))
# Summary left join            
summary_left_join <- left_joined_data %>%
  summarize(num_students_dsci_101 = n(), 
            num_na = sum(is.na(Nicknames)),
            num_not_na = sum(!is.na(Nicknames)))
# Summary full join

summary_full_join <- full_joined_data %>%
  summarize(num_students_dsci_101 = n(), 
            num_na = sum(is.na(Nicknames)),
            num_not_na = sum(!is.na(Nicknames)))



########################################################
#################### Do it yourself ####################
############# Practice with "Flights Data" #############
########################################################


### Practice with Flights & Airline Data (datasets inside nycflights13 package)     

# 1. Load nycflights13 package. Inside this package you're going to find "flights", 
#    "airlines", and "airports" datasets. Save each dataset as dataframes called "data_flights", 
#    "data_airlines", & "data_airport", respectively.



# 2. Inspect each dataset, get familiar with the variables. Because these are datasets that came 
#    from a package you can type "?" followed by the name of the dataset in the package. If you 
#    run this code (i.e. ?airlines), you will get more information on the dataset and what every 
#    variable means. 


# 3. Create a new dataframe where you only select airports that are in the pacific time zone. 
#    Name this dataframe "airports_pt" by using data_airport,selecting rows with the pacific 
#    time zone (tz = -8) then select columns faa, name, tz.  



# 4. Create a new dataframe where you have the flights that flew to airports in the pacific. 
#    Name this dataframe "nyc_dest_pt". Inner join data_flights with airports_pt by "dest" and "faa".
#    Inspect the number of rows for this new dataframe. 
#    Inspect the number of rows for the dataframe data_flights.
#    Are the number for rows different? why?



# 5. Summarize the number of NA's (for variable "name") in nyc_dests_pt dataframe. 
# Name the new dataframe inner_summary.
# Think about how you merged dataframes to come up with this output. 
# Do the numbers make sense?

# Summary of the results



# 6. Create a new dataframe called "nyc_dest". Do a left_join between data_flights (left dataset)
#    and with airports_pt by "dest" and "faa".
#    Inspect the number of rows for this new dataframe. 
#    Inspect the number of rows for the dataframe data_flights.
#    Are the number for rows different? why?




# 7. Summarize the number of NA's (for variable "name") in nyc_dests dataframe. 
# Name the new dataframe left_summary.
# Think about how you merged dataframes to come up with this output. 
# Do the numbers make sense?






# 8. Create a new dataframe called "nyc_dests_right". Do a right_join between data_flights (left dataset)
#    and with airports_pt by "dest" and "faa".
#    Inspect the number of rows for this new dataframe. 
#    Inspect the number of rows for the dataframe data_flights.
#    Are the number for rows different? why?




# 9. Summarize the number of NA's (for variable "name") in nyc_dests_right dataframe. 
# Name the new dataframe right_summary.
# Think about how you merged dataframes to come up with this output. 
# Do the numbers make sense?




# 10. Create a new dataframe called "nyc_dests_full". Do a full_join between data_flights (left dataset)
#    and with airports_pt by "dest" and "faa".
#    Inspect the number of rows for this new dataframe. 
#    Inspect the number of rows for the dataframe data_flights.
#    Are the number for rows different? why?







# 11. Summarize the number of NA's (for variable "name") in nyc_dests_full dataframe. 
# Name the new dataframe full_summary.
# Think about how you merged dataframes to come up with this output. 
# Do the numbers make sense?








