
##################################################################
############## Strings & Dates (Part a) - Classwork ##############
##################################################################

library(tidyverse)


# Introduction to stringr

######################
### Detect Matches ###
######################

# 1. str_detect(): Detecting Patterns - checks if a string contains a specific pattern. 

my_string <- "The quick brown fox jumps over the lazy dog."
str_detect(my_string, "fox")  # Output: TRUE


#####################
### Manage Length ###
#####################

# 2. str_length(): finds the length (the number of characters) in a string:
  
my_string <- "Hello, World!"
str_length(my_string)  # Output: 13



# 3. str_trim(): Trims whitespac - removes leading and trailing whitespace from a string:

my_string <- "  Trim me!   "
str_trim(my_string)  # Output: "Trim me!"


# 4. str_squish(): Removes extra whitespace withing a string. 

my_string <- "Hello   world    from    R!"
str_squish(my_string)  # Output: "Hello world from R!"



########################
### Mutating Strings ###
########################


# 5. str_sub(): extracts substrings from a string:


my_string <- "Extract this part"
str_sub(my_string, start = 9, end = 13)  # Output: "this "


# 6. str_replace(): replaces a pattern with another string:

my_string <- "The quick brown fox jumps over the lazy dog."
str_replace(my_string, "fox", "cat")  # Output: "The quick brown cat jumps over the lazy dog."



# 7. str_to_lower() and str_to_upper(): Changes the case (upper/lower) of a string. 

  
my_string <- "Hello, World!"
str_to_lower(my_string)  # Output: "hello, world!"
str_to_upper(my_string)  # Output: "HELLO, WORLD!"

####################
### Join & Split ###
####################

# 8. str_c(): Combining Strings - concatenates strings together.

first_name <- "John"
last_name <- "Doe"
str_c(first_name, " ", last_name)

# 9. str_split(): splits a string into a character vector using a specified delimiter:

my_string <- "apple,banana,cherry"
str_split(my_string, ",")  # Output: a character vector ["apple", "banana", "cherry"]


######################
### Subset Strings ###
######################


# 10. str_extract(): extracts the first occurrence of a pattern from a string.
  

my_string <- "Email me at john@example.com or call at 555-123-4567."
str_extract(my_string, "\\d{3}-\\d{3}-\\d{4}")  # Output: "555-123-4567"






### Summary
# stringr is a versatile package for working with strings in R. 
# It provides functions for string manipulation, pattern matching, 
# and cleaning. These functions make it easier to perform various 
# text-related tasks when working with data.


########################################################
#################### Do it yourself ####################
########################################################

# Using the `sentences` dataset (which is a vector may have to change to a data.frame), practice the following questions.

?sentences
sentences
sentences <-as.data.frame(sentences)

# 1. Calculate and report the average character length of sentences in the "sentences" dataset. 



# 2. Which sentences are the shortest and longest and what are their length?




# 3. a. Find all the sentences in the "sentences" dataset that use a comma. 


#    b. How many such sentences are there?



# 4. a. Count how many occurrence of the letter "t" is in each sentence. Hint: use str_count under "Detect Matches".



#    b. Which sentence has the most? 


#    c. How many have 0?



# 5. a. In the "sentences" dataset, extract and list all the sentences that contain the word "and". 



#    b. How many sentences contain this word?



# 6. a. Replace all occurrences of the word "good" with "excellent" in the "sentences" dataset (make a new column). 



#    b. What does the dataset look like after these replacements?
#       In your final dataset, show only those sentences that actually changed. Include 
#       the original sentence, and the old sentence)



#    c. How many replacements were made, and 

