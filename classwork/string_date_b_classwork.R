
##################################################################
############## Strings & Dates (Part b) - Classwork ##############
##################################################################

library(tidyverse)
library(nycflights13)

# Introduction to lubridate

# lubridate is a popular R package that makes it easy to work with 
# date-times. It provides a wide range of functions and methods to 
# parse, manipulate, and format date-time objects. This tutorial will
# cover some of the fundamental aspects of using lubridate for working 
# with date and time data in R. 


##################################
### Creating Date-Time Objects ###
##################################

# You can create date-time objects in various ways:
  
# 1. ymd(): is a function used to create a date object from year, month, and day components.

my_date <- ymd("2023-09-15")
my_date
class(my_date)
# 2. mdy(): is a function used to create a date object in a month-day-year format.

my_date2 <- mdy("12-14-2023")
my_date2

# 3. ymd_hms(): creates a date-time object with hours, minutes, and seconds.

my_datetime <- ymd_hms("2023-09-15 14:30:45")
class(my_datetime)

#############################
### Extracting Components ###
#############################
  
# 4. Extracting Year, Month, Day, etc.

year(my_date)  # Extract year
month(my_date)  # Extract month
day(my_date)  # Extract day
wday(my_date)  # Extract day of the week (Sunday: 1, Monday: 2, etc.)

my_birthday <- ydm("")

year(my_birthday)
month(my_birthday)
day(my_birthday)
wday(my_birthday)

##################################
### Arithmetic with Date-Times ###
##################################

# 5. Adding Days

new_date <- my_date + days(7)  # Add 7 days to my_date


# 6. Finding Time Difference

diff <- my_date2 - my_date  # Find the time difference between my_date and my_datetime
diff

## can use difftime() too
time1 <- ymd_hms("2023-09-15 08:30:00")
time2 <- ymd_hms("2023-09-15 12:45:30")

# Calculate the time difference in seconds
time_diff_seconds <- as.numeric(difftime(time2, time1, units = "secs"))

# Calculate the time difference in hours
time_diff_hours <- as.numeric(difftime(time2, time1, units = "hours"))


# 7. Finding Intervals

# lubridate provides functions to find intervals between two date-time objects. 
# For example, you can use interval() to create a time interval between two date-times:
  

start_time <- ymd_hms("2023-09-15 08:30:00")
end_time <- ymd_hms("2023-09-15 12:45:30")

# Create an interval
time_interval <- interval(start_time, end_time)

########################
### Formatting Dates ###
########################

#  8. Using format(): you can format date-time objects for display

my_date
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


###############
### Summary ###
###############

# lubridate is a powerful package in R for handling date-time data. 
# It simplifies the creation, extraction, arithmetic, formatting, and 
# parsing of date-time objects. This tutorial covered some of the basic 
# operations you can perform with lubridate. As you explore date-time data, 
# you'll find that lubridate is a valuable tool for your R programming tasks.


########################################################
#################### Do it yourself ####################
########################################################

# Using the `flights` dataset answer the following questions.
 
# 1. Create a new column in the "flights" dataset that displays the departure time 
#    in the "hh:mm:ss" format (e.g., "08:45:00")
 

# 2. Extract the year, month, and day from the "dep_time" column in the "flights" 
#    dataset and create separate columns for each.
 
# 3. Calculate the average departure delay for flights that occurred on Fridays. 
#    How does this compare to the average departure delay on Mondays?
 





