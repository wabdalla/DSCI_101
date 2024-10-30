
###################################
############## Dates ##############
###################################

library(tidyverse)
library(nycflights13)

#################################
### Introduction to lubridate ###
#################################


# lubridate is a popular R package that makes it easy to work 
# with date-times. It provides a wide range of functions and 
# methods to parse, manipulate, and format date-time objects. 
# This tutorial will cover some of the fundamental aspects of 
# using lubridate for working with date and time data in R. 


##################################
### Creating Date-Time Objects ###
##################################

# 1. ymd(): is a function used to create a date object from 
#           year, month, and day components.

my_date <- "2023-09-15"
class(my_date) 
my_date <- ymd(my_date)
class(my_date)

# 2. mdy(): is a function used to create a date object in a 
#           month-day-year format.

my_date2 <- "12-14-2023"
my_date2 <- mdy(my_date2)
my_date2

# 3. ymd_hms(): creates a date-time object with hours, minutes, 
#               and seconds.

my_datetime <- "2023-09-15 14:30:45"
my_datetime <- ymd_hms(my_datetime)



#############################
### Extracting Components ###
#############################

# 4. Extracting Year, Month, Day, etc.

my_date <- ymd("2024-10-30")
year(my_date)  # Extract year
month(my_date)  # Extract month
day(my_date)  # Extract day
wday(my_date)  # Extract day of the week (Sunday: 1, Monday: 2, etc.)

################################
### Example with a Dataframe ###
################################

dwts_dates <- data.frame(
  Name = c("Derek", "Mark", "Lindsay"),
  Birth = c("1985-05-17", "1986-05-24", "1994-01-11"),
  Wedding = c("08-26-2023", "11-25-2016", "06-18-2015"))

class(dwts_dates$Name)
class(dwts_dates$Birth)
class(dwts_dates$Wedding)

dwts_dates <- dwts_dates %>%
  mutate(Birth = ymd(Birth), 
         Wedding = mdy(Wedding))

class(dwts_dates$Name)
class(dwts_dates$Birth)
class(dwts_dates$Wedding)


dwts_info <- dwts_dates %>%
  mutate(Year = year(Birth), 
         Day = day(Wedding), 
         Month = month(Wedding), 
         Day_Week = wday(Wedding))

##################################
### Arithmetic with Date-Times ###
##################################

# 5. Adding Days
my_date <- ymd("2024-10-30")
new_date <- my_date + days(7)  # Add 7 days to my_date
new_date

# 6. Finding Time Difference
my_date <- ymd("2024-10-30")
my_date2 <- ymd("2024-11-06")
diff <- my_date2 - my_date  # Find the time difference between my_date and my_datetime
diff

## can use difftime() too
time1 <- ymd_hms("2023-09-15 08:30:00")
time2 <- ymd_hms("2023-09-15 12:45:30")

# Calculate the time difference in seconds
difftime(time2, time1, units = "secs")
as.numeric(difftime(time2, time1, units = "secs"))

# Calculate the time difference in hours
difftime(time2, time1, units = "hours")
as.numeric(difftime(time2, time1, units = "hours"))


# 7. Finding Intervals

# lubridate provides functions to find intervals between two 
# date-time objects. For example, you can use interval() to 
# create a time interval between two date-times:


start_time <- ymd_hms("2023-09-15 08:30:00")
end_time <- ymd_hms("2023-09-15 12:45:30")

# Create an interval

interval(start_time, end_time)

########################
### Formatting Dates ###
########################

#  8. Using format(): you can format date-time objects for display

my_date <- ymd("2024-10-30")

format(my_date, format = "%A") # %A - The day of the week (i.e, Friday)
format(my_date, format = "%a") # %a - The day of the week truncated (i.e, Fri)
format(my_date, format = "%B") # %B - The full name of the month (i.e September)
format(my_date, format = "%b") # %b - The name of the month truncated (i.e., Sep)
format(my_date, format = "%D") # %D - The date in month/day/year format.
format(my_date, format = "%d") # %d - The number of the day
format(my_date, format = "%Y") # %Y - The year with four digits
format(my_date, format = "%y") # %y - The year with two digits


format(my_date, format = "%m") # %m - The number of the month


# Suppose you want it to be "Friday, September 15, 2023"
format(my_date, format = "%A, %B %d, %Y")

#####################
### Parsing Dates ###
#####################

# 9. parse_date_time(): You can parse character strings into date-time objects.

date_string <- "Sep 15, 2023 14:30:45"
parsed_datetime <- parse_date_time(date_string, orders = "mdy HMS")


########################################################
#################### Do it yourself ####################
########################################################

# Using the `flights` dataset answer the following questions.



# 1. Create a new column in the "flights" dataset that combines 
#    the column year, month and day separated by a "-". Name the 
#    new column Date. Make this new column be of class date. 
#    Once you are done writing the code, check the class of that 
#    new column to make sure it is in fact of class date. 




# 2. Using the new column created in question 1, create a new column that 
#    shows the date in the following format (Fri, Sep 15, 2023) 
#    for each flight. Name the new column "new_date"



# 3. Using the new column created in question 1, create a new column 
#    that shows what day of the week (i.e., Friday) each flight was.
#    Then compute how many flights happened in each day of the week. 
#    Which day of the week had the most flights? Which day of the 
#    week had the least flights?



# Most flights: 
# Least flights: 




# 4. Extract the year, month, and day from the "time_hour" column in the "flights" 
#    dataset and create separate columns for each.




# 5. Calculate the average departure delay for flights that occurred on Fridays. 
#    How does this compare to the average departure delay on Mondays?






