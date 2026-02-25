##############################################################
################## Joining Dataset - Part 2 ##################
##############################################################

library(tidyverse)
library(mdsr)
library(nycflights13)

####################
### Reading Data ###
####################

Illustration_Data_1 <- read_csv("C:/Users/wabdalla/OneDrive - Loyola University Chicago/Desktop/DSCI 101/data/Illustration_Data_1.csv")
Illustration_Data_2 <- read_csv("C:/Users/wabdalla/OneDrive - Loyola University Chicago/Desktop/DSCI 101/data/Illustration_Data_2.csv")
Illustration_Data_3 <- read_csv("C:/Users/wabdalla/OneDrive - Loyola University Chicago/Desktop/DSCI 101/data/Illustration_Data_3.csv")

#################
### Left Join ###
#################

#   A left join includes all rows from the left dataset and the 
#   matching rows from the right dataset. If there's no match, 
#   the columns from the right dataset will be filled with NA. 
#   Here the rows of the first table are always returned, 
#   regardless of whether there is a match in the second table.


# Example 1: Do a left join where Illustration_Data_1 is the left data
#            and Illustration_Data_2 is the right data.

example_1 <- Illustration_Data_1 %>%
  left_join(Illustration_Data_2, by = c("Name" = "First_Name"))

# Example 2: Do a left join where Illustration_Data_2 is the left data
#            and Illustration_Data_1 is the right data. 
example_2 <- Illustration_Data_2 %>%
  left_join(Illustration_Data_1, by = c("First_Name" = "Name"))

# Example 3: Do a left join where Illustration_Data_3 is the left data
#            and Illustration_Data_1 is the right data. 

example_3 <- Illustration_Data_3 %>%
  left_join(Illustration_Data_1, by = c("Name" = "Name"))

# Example 4: Do a left join where Illustration_Data_1 is the left
#            and Illustration_Data_3 is the right. 
example_4 <- Illustration_Data_1 %>%
  left_join(Illustration_Data_3, by = c("Name" = "Name"))

##################
### Right Join ###
##################

#   A right join is the opposite of a left join. It includes all 
#   rows from the right dataset and the matching rows from the 
#   left dataset. A right join but this is much less common. 


# Example 5: Do a right join where Illustration_Data_1 is the left
#            and Illustration_Data_3 is the right.

example_5 <- Illustration_Data_1 %>%
  right_join(Illustration_Data_3, by = c("Name" = "Name"))


########################
### Summarizing NA's ###
########################


# Example 6: Summarize the NA's for the left joined data from Example 2           
example_6 <- example_2 %>%
  summarize(num_people = n(), 
            num_na = sum(is.na(Age)),
            num_not_na = sum(!is.na(Age)))


########################################################
#################### Do it yourself ####################
############# Practice with "Flights Data" #############
########################################################


# 1. Load nycflights13 package. Using this package, load the 
#    following dataframes: 
#    flights, airlines and airports data. 
#    On the console, Use ? followed by the name of the dataframe 
#    to read some background information on the dataframes. 

data("airlines")
data("flights")
data("airports")


# 2. Using the "airports" datset, create a new dataframe where you only 
#    select airports that are in the pacific time zone. Name this 
#    dataframe "airports_pt" 
#    The rows that are in the pacific time zone have a tz = -8. 
#    Select columns faa, name, tz.  

airports_pt <- airports %>%
  filter(tz == -8) %>% 
  select(faa, name, tz)

# 3. Create a new dataframe where you have the flights that flew to 
#    airports in the pacific. Name this dataframe "nyc_dest_pt". 
#    Inner join "flights" with airports_pt by "dest" and "faa".
#    Inspect the number of rows for this new dataframe. 
#    Inspect the number of rows for the dataframe flights.
#    Are the number for rows different? why?

nyc_dests_pt <- flights %>% 
  inner_join(airports_pt, by = c("dest" = "faa")) 

nrow(nyc_dests_pt)
nrow(flights)


# 4. Summarize the number of NA's (for variable "name") in nyc_dests_pt 
#    dataframe. Name the new dataframe inner_summary.
#    Think about how you merged dataframes to come up with this output. 
#    Do the numbers make sense?

# Summary of the results
inner_summary <- nyc_dests_pt %>%
  summarize(num = n(), 
            num_no_na = sum(!is.na(name)),
            num_na = sum(is.na(name)))

inner_summary


# 5. Create a new dataframe called "nyc_dest". Do a left_join between 
#    flights (left dataset) and with airports_pt by "dest" and "faa".
#    Inspect the number of rows for this new dataframe. 
#    Inspect the number of rows for the dataframe flights.
#    Are the number for rows different? why?

nyc_dests <- flights %>% 
  left_join(airports_pt, by = c("dest" = "faa"))

nrow(nyc_dests)
nrow(flights)

# 6. Summarize the number of NA's (for variable "name") in nyc_dests 
#    dataframe. Name the new dataframe left_summary.
#    Think about how you merged dataframes to come up with this output. 
#    Do the numbers make sense?
left_summary <- nyc_dests %>%
  summarize(
    num = n(),
    num_no_na = sum(!is.na(name)),
    num_na = sum(is.na(name)))


left_summary




# 7. Create a new dataframe called "nyc_dests_right". Do a right_join 
#    between flights (left dataset) and with airports_pt 
#    by "dest" and "faa". Inspect the number of rows for this new dataframe. 
#    Inspect the number of rows for the dataframe flights.
#    Are the number for rows different? why?

nyc_dests_right <- flights %>% 
  right_join(airports_pt, by = c("dest" = "faa"))

nrow(nyc_dests_right)
nrow(flights)


# 8. Summarize the number of NA's (for variable "name") in nyc_dests_right 
#    dataframe. Name the new dataframe right_summary. Think about how you 
#    merged dataframes to come up with this output. Do the numbers make sense?

right_summary <- nyc_dests_right %>%
  summarize(num = n(), 
            num_no_na = sum(!is.na(name)),
            num_na = sum(is.na(name)))


right_summary

