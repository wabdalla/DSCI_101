################################################################ 
################## Joins (Part c) - Classwork ##################
################################################################

################################
### Join by Multiply Columns ###
################################

# Join by multiple columns: The `by` argument specifies the column(s) 
# that should be used for matching. These join functions work well 
# when the datasets have a shared column containing the same type of 
# data (e.g., IDs or keys).


# You can use multiple column names to define the matching conditions.

# Syntax: inner_join(df1, df2, by=c('x1'='y1', 'x2'='y2'))

# Example Code 

# Create emp Data Frame
emp_df <- data.frame(
  emp_id=c(1,2,3,4,5,6),
  name=c("Smith","Rose","Williams","Jones","Brown","Brown"),
  superior_emp_id=c(-1,1,1,2,2,2),
  dept_id=c(10,20,10,10,40,50),
  dept_branch_id= c(101,102,101,101,104,105)
)

# Create dept Data Frame
dept_df <- data.frame(
  dept_id=c(10,20,30,40),
  dept_name=c("Finance","Marketing","Sales","IT"),
  dept_branch_id= c(101,102,103,104)
)

emp_df %>% 
  inner_join(dept_df, 
             by=c('dept_id'='dept_id', 
                  'dept_branch_id'='dept_branch_id'))




########################################################
#################### Do it yourself ####################
############# Practice with "Flights Data" #############
########################################################


### Practice with Flights & Airline Data (datasets inside nycflights13 package)     

# Answer the following questions: 

# 1. Which airlines (actual name) had the most delayed flights departing from NYC in 2013? 
# (Note: a flight is considered delayed if their departure delay of more than 0 minutes)

 

# 2. What are the top 3 destinations (airport name) for flights departing from NYC in 2013?



# 3. Which airlines (airline name) had the highest average departure delays from each airport?


# 4. What are the statistics (see below) of flight distances for flights departing from each airport?
# Include the full airport name
# Statistics: Min, first quartile, second quartile (Median), 
#            third quartile, max, mean, standard deviation)



# 5. Which airlines (full name) operated the most flights from each origin airport in NYC?

