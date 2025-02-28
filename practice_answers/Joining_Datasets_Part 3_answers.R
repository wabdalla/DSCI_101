
##############################################################
################## Joining Dataset - Part 3 ##################
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
### Full Join ###
#################

#   A full join includes all rows from both datasets. Columns 
#   from the dataset with missing values will be filled with 
#   NA where there's no match.

# Example 1: Do a full join between Illustration_Data_1 &
#            Illustration_Data_2.

example_1 <- Illustration_Data_1 %>%
  full_join(Illustration_Data_2, by = c("Name" = "First_Name"))


# Example 2: Do a full join between Illustration_Data_1 &
#            Illustration_Data_3.

example_2 <- Illustration_Data_1 %>%
  full_join(Illustration_Data_3, by = c("Name" = "Name"))


################################
### Join by Multiply Columns ###
################################

# Note: You will not be tested on this material 

# Join by multiple columns: The `by` argument specifies the column(s) 
# that should be used for matching. These join functions work well 
# when the datasets have a shared column containing the same type of 
# data (e.g., IDs or keys).


# You can use multiple column names to define the matching conditions.

# Command Illustration: 
#   new_dataframe <- name_dataframe_1 %>%
#         inner_join(name_dataframe_2, by=c('x1'='y1', 'x2'='y2'))


# Example 3: We will manually create two datafames:  

# Dataframe 1:
emp_df <- data.frame(
  emp_id=c(1,2,3,4,5,6),
  name=c("Smith","Rose","Williams","Jones","Brown","Brown"),
  superior_emp_id=c(-1,1,1,2,2,2),
  dept_id=c(10,20,10,10,40,50),
  dept_branch_id= c(101,102,101,101,104,105)
)

# Dataframe 2:
dept_df <- data.frame(
  dept_id=c(10,20,30,40),
  dept_branch_id= c(101,102,103,104), 
  dept_name=c("Finance","Marketing","Sales","IT")
)

example_3 <- emp_df %>% 
  inner_join(dept_df, by=c('dept_id'='dept_id', 
                  'dept_branch_id'='dept_branch_id'))




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


# 3. Create a new dataframe called "nyc_dests_full". Do a full_join between 
#    flights and airports_pt by "dest" and "faa".
#    Inspect the number of rows for this new dataframe. 
#    Inspect the number of rows for the dataframe flights.
#    Are the number for rows different? why?


nyc_dests_full <- flights %>% 
  full_join(airports_pt, by = c("dest" = "faa"))

nrow(nyc_dests_full)
nrow(flights)


# 4. Summarize the number of NA's (for variable "name") in nyc_dests_full dataframe. 
# Name the new dataframe full_summary.
# Think about how you merged dataframes to come up with this output. 
# Do the numbers make sense?

full_summary <- nyc_dests_full %>%
  summarize(num = n(), 
            num_no_na = sum(!is.na(name)),
            num_na = sum(is.na(name)))


full_summary
