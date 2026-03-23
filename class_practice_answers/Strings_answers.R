
######################################
############## Strings  ##############
######################################

library(tidyverse)

###############################
### Introduction to stringr ###
###############################


# stringr is a versatile package for working with strings in R. 
# It provides functions for string manipulation, pattern matching, 
# and cleaning. These functions make it easier to perform various 
# text-related tasks when working with data.



######################
### Detect Matches ###
######################

# str_detect(): Detects Patterns - checks if a string contains a 
#               specific pattern. Output: TRUE/FALSE. 

# Example 1: Detect whether the word fox is in the string or not. 

my_string <- "The quick brown fox jumps over the lazy dog."
str_detect(my_string, "fox")  # Output: TRUE


# All these examples are illustrated with a vector, but they can be used in 
# dataframes, typically with mutate. For example: 


illustration_data <- data.frame(
  Example = c("the quick brown fox jumps over the lazy dog.", 
              "hello, world!", 
              "fox and cat")
)

# Example 2: Use str_detect in illustration data above to detect whether on 
#            each sentence there is the word fox.

example_2 <- illustration_data %>%
  mutate(fox_check = str_detect(Example, "fox"))

#####################
### Manage Length ###
#####################

# str_length(): Finds the length (the number of characters) in a string. 

# Example 3: Count how many characters are in the following string. 

my_string <- "Hello, World!"
str_length(my_string) # Output: 13


# str_trim(): Trims white space - removes leading and trailing white space 
#             from a string.


# Example 4: Remove the white space from the beginning and the end of the string.  

my_string <- "  Trim me!   "
str_trim(my_string) # Output: "Trim me!"

# str_squish(): Removes extra white space withing a string, as well as the beginning, 
#               and the end. 

# Example 5: Remove all whitespace from the string. 

my_string <- "   Hello   world    from    R!    "
str_squish(my_string)  # Output: "Hello world from R!"



########################
### Mutating Strings ###
########################


# str_sub(): extracts substrings from a string:

# Example 6: Extract the string from position 8 to position 13. 

my_string <- "Extract this part"
str_sub(my_string, start = 9, end = 13)  # Output: "this "


# str_replace(): replaces a pattern with another string:

# Example 7: Substitute the word fox with the word cat. 

my_string <- "The quick brown fox jumps over the lazy dog."
str_replace(my_string, "fox", "cat")  # Output: "The quick brown cat jumps over the lazy dog."



# str_to_lower(): Changes the case to all lower case of a string. 
# str_to_upper(): Changes the case to all upper case of a string.

# Example 8: Change the following string to all lower case and then to all upper. 

my_string <- "Hello, World!"
str_to_lower(my_string)  # Output: "hello, world!"
str_to_upper(my_string)  # Output: "HELLO, WORLD!"

####################
### Join & Split ###
####################

# str_c(): Combining Strings - concatenates strings together.

# Example 9: combine the following two strings. Separate them by "-".

first_name <- "John"
last_name <- "Doe"
str_c(first_name, "-", last_name) # Output: "John-Doe"

# str_split(): splits a string into a character vector using a specified delimiter. 

# Example 10: Separate the following string by ",". 

my_string <- "apple,banana,cherry"
str_split(my_string, ",")  # Output:  "apple"  "banana"  "cherry"


######################
### Subset Strings ###
######################

# str_extract(): extracts the first occurrence of a pattern from a string.

# Example 11: Extract the phone number from the following string. 

my_string <- "Email me at john@example.com or call at 555-123-4567."
str_extract(my_string, "\\d{3}-\\d{3}-\\d{4}")  # Output: "555-123-4567"



########################################################
#################### Do it yourself ####################
########################################################

# Use the `sentences` dataset. This is a vector that we will change 
# to a dataframe, then practice the following questions:

?sentences
sentences <- as.data.frame(sentences)

# 1. Calculate and report the average character length of sentences 
#    in the "sentences" dataset. 

question_1 <- sentences %>%
  mutate(Sentence_Length = str_length(sentences)) %>%
  summarise(Avg_Length = mean(Sentence_Length))


# 2. Which sentences are the shortest and longest and what are their length?

question_2 <- sentences %>%
  mutate(Sentence_Length = str_length(sentences)) %>%
  filter(Sentence_Length== min(Sentence_Length)|Sentence_Length == max(Sentence_Length))


# 3. a. Find all the sentences in the "sentences" dataset that use a comma. 

question_3a <- sentences %>%
  mutate(comma_sentences = str_detect(sentences, ",")) %>%
  filter(comma_sentences == TRUE)

#    b. How many such sentences are there?
question_3b <- question_3a %>%
  summarize(N_Comma_Sentences = n())


# 4. a. Count how many occurrence of the letter "t" (lower case) is in each sentence.
#       Hint: use str_count under "Detect Matches".

question_4a <- sentences %>%
  mutate(Count_t = str_count(sentences, "t"))

#    b. Which sentence has the most? 
question_4b <- question_4a %>%
  filter(Count_t == max(Count_t))

#    c. How many have 0?

question_4c <- question_4a %>%
  filter(Count_t == 0) %>%
  summarize(N_sentences_0 = n())

# 5. a. In the "sentences" dataset, extract and list all the sentences that contain the word "and". 

question_5a <- sentences %>%
  mutate(Sentences_and = str_detect(sentences, "and")) %>%
  filter(Sentences_and == TRUE) %>%
  select(sentences)

#    b. How many sentences contain this word?

question_5b <- question_5a %>%
  summarize(N_Sent_and = n())

# 6. a. Replace all occurrences of the word "good" with "excellent" in the "sentences" dataset (make a new column). 

question_6a <- sentences %>%
  mutate(good_excellent = str_replace(sentences, "good", "excellent"))

#    b. What does the dataset look like after these replacements?
#       In your final dataset, show only those sentences that actually changed. Include 
#       the original sentence, and the old sentence)

question_6b <- question_6a %>%
  mutate(Equal = ifelse(sentences == good_excellent, "Not Changed", "Changed")) %>%
  filter(Equal == "Changed") %>%
  select(-Equal)

#    c. How many replacements were made, and 
question_6c <- question_6b %>%
  summarise(N_Replacement = n())
