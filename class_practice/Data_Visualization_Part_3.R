######################################################### 
############## Data Visualization - Part 3 ##############
#########################################################

library(tidyverse)
library(mdsr)
library(viridis)
library(palmerpenguins)

###############
### ggplot2 ###
###############

# Fundamental components of ggplot2:

# Data: The dataset you're working with.
# Aesthetics Mapping (aes): How data variables map to plot aesthetics 
#                           like position, color, shape, etc.
# Geometric Objects (geom): The visual elements to represent the data 
#                           (points, lines, bars, etc.).
# Facets (facet_wrap or facet_grid): Splitting data into subplots based 
#                           on a variable.
# Theme: Controlling the overall appearance of the plot.

# Think of every command as a layer like the pipe for `dplyr`

####################
### Reading Data ###
####################

data("mtcars")
data("penguins")

################################
### Changing Colors in Plots ###
################################



###########################
### Univariate Displays ###
###########################

# Example 1: Univariate simple bar graph (no color)

fig_1 <- mtcars %>%
  ggplot(aes(x = factor(cyl))) +
  geom_bar() 
fig_1


# Example 2: Fills all the bars with the same color. 

fig_2 <- mtcars %>%
  ggplot(aes(x = factor(cyl))) +
  geom_bar(fill = "dodgerblue")
fig_2

# Example 3: Change each bar to a different color using fill inside "aes" 

fig_3 <- mtcars %>%
  ggplot(aes(x = factor(cyl), fill = factor(cyl))) +
  geom_bar() 
fig_3


# Example 4: Change each bar to a different color without the legend. 

fig_4 <- mtcars %>%
  ggplot(aes(x = factor(cyl))) +
  geom_bar(fill = c("dodgerblue", "pink", "red"))
fig_4

# Example 5: Attempt to change bar color using color instead of fill. 
#            What happens? 

fig_5 <- mtcars %>%
  ggplot(aes(x = factor(cyl))) +
  geom_bar(color = "dodgerblue")
fig_5 


# Example 6: Change the lines of the bars to dodgerblue and the bar 
#            colors to pink. 

fig_6 <- mtcars %>%
  ggplot(aes(x = factor(cyl))) +
  geom_bar(fill = "pink", color = "dodgerblue")
fig_6

# Example 7: Create a histogram for mpg variable with 6 bins. Then, change the 
#            lines of the histogram to red and the bar colors to green.

fig_7 <- mtcars %>%
  ggplot(aes(x = mpg)) +
  geom_histogram(bins = 6, fill = "green", color = "red")
fig_7


# Example 8: Create a boxplot for mpg variable. Then, change the 
#            lines of the plot to blue and the inside colors to pink.


fig_8 <- mtcars %>%
  ggplot(aes(x = mpg)) +
  geom_boxplot(color = "blue", fill = "pink")
fig_8


#############################
### Multivariate Displays ###
#############################

# For multivariate displays, you typically need to use color or fill inside 
# the aes. 
# To change the colors for a multivariable plot, you will need the functions: 
# `scale_fill_manual()`: manually changes fill in the aes. 
# `scale_color_manual()`: manually changes color in the aes. 


# Example 9: Create a stacked bar graph with cyl in the x axis and gear 
#            as the categorical variable to split each column.  

fig_9 <- mtcars %>%
  ggplot(aes(x = factor(cyl), fill = factor(gear)))+
  geom_bar()
fig_9

# Example 10: Change the colors from Example 9 to red, green, and blue 
#             (in that order). 

fig_10 <- mtcars %>%
  ggplot(aes(x = factor(cyl), fill = factor(gear)))+
  geom_bar()+
  scale_fill_manual(values = c("red", "green", "blue"))
fig_10

# Example 11: Create a scatter plot with x = bill_length_mm, y = bill_depth_mm, 
#             and species as the categorical variable. 

fig_11 <- penguins %>% 
  ggplot(aes(x = bill_length_mm, y = bill_depth_mm, color = species)) +
  geom_point()
fig_11

# Example 12: Change the colors from Example 11 to red, green, and blue, 
#             in that order. What is wrong with these codes? 
#             Why isn't this one working?
fig_12 <- penguins %>% 
  ggplot(aes(x = bill_length_mm, y = bill_depth_mm, color = species)) +
  geom_point() +
  scale_fill_manual(values = c("red", "green", "blue"))
fig_12

# Answer: Because it has to do with color, not fill.

# Example 13: Change the colors from Example 11 to red, green, and blue, 
#             in that order.
fig_13 <- penguins %>% 
  ggplot(aes(x = bill_length_mm, y = bill_depth_mm, color = species)) +
  geom_point() +
  scale_color_manual(values = c("red", "green", "blue"))
fig_13

#####################################
### Using External Color Packages ###
#####################################

# Sometimes, you may want to use specialized color palettes from external 
# packages to enhance your data visualizations. Packages like `wesanderson` 
# and `viridis` provide aesthetically pleasing color palettes that can make 
# your plots more visually appealing.

# Example 14: Create a scatter plot with x = bill_length_mm, y = bill_depth_mm, 
#             and species as the categorical variable. 
#             Use the viridis package to change the colors.


fig_14 <- penguins %>%
  ggplot(aes(x = bill_length_mm, y = bill_depth_mm, color = species)) +
  geom_point() +
  scale_color_viridis(discrete = TRUE, option = "C", alpha = 1)
fig_14



# Example 15: Create a stacked bar graph with cyl in the x axis and gear 
#             as the categorical variable to split each column. 
#             Use the viridis package to change the colors.

fig_15 <- mtcars %>%
  ggplot(aes(x = factor(cyl), fill = factor(gear)))+
  geom_bar() + 
  scale_fill_viridis(discrete = TRUE, option = "C", alpha = 1)

fig_15

##############
### Themes ###
##############

# 1. theme_gray():
#    This is the default theme in ggplot2.
#    It uses a simple gray background with white gridlines.
#    A good choice when you want a clean, minimalist look for your plot.

# 2. theme_bw():
#    This theme provides a white background with black gridlines.
#    It offers a high-contrast, black-and-white appearance.
#    Useful for creating plots that need to be easily readable in 
#    black and white.

# 3. theme_minimal():
#    As the name suggests, this theme is minimalistic.
#    It removes gridlines and most background elements, leaving a clean, 
#    white canvas.
#    Suitable for plots where you want to focus on the data without 
#    distractions.

# 4. theme_void():
#    This theme removes nearly all elements, providing a blank canvas.
#    It's useful when you want to start with a clean slate and add 
#    custom elements.


# Example 16: Create a scatter plot with x = bill_length_mm, y = bill_depth_mm, 
#             and species as the categorical variable. 
#             Use a gray theme

# Theme Gray

fig_16 <- penguins %>% 
  ggplot(aes(x = bill_length_mm, y = bill_depth_mm, color = species)) +
  geom_point() +
  scale_color_manual(values = c("red", "green", "blue")) + 
  theme_gray()
fig_16

# Example 17: Create a scatter plot with x = bill_length_mm, y = bill_depth_mm, 
#             and species as the categorical variable. 
#             Use a black and white theme

# Theme Black and White

fig_17 <- penguins %>% 
  ggplot(aes(x = bill_length_mm, y = bill_depth_mm, color = species)) +
  geom_point() +
  scale_color_manual(values = c("red", "green", "blue")) + 
  theme_bw()
fig_17


# Example 18: Create a scatter plot with x = bill_length_mm, y = bill_depth_mm, 
#             and species as the categorical variable. 
#             Use a minimal theme

# Theme Minimal

fig_18 <- penguins %>% 
  ggplot(aes(x = bill_length_mm, y = bill_depth_mm, color = species)) +
  geom_point() +
  scale_color_manual(values = c("red", "green", "blue")) + 
  theme_minimal()
fig_18

# Example 19: Create a scatter plot with x = bill_length_mm, y = bill_depth_mm, 
#             and species as the categorical variable. 
#             Use a void theme

# Theme Void

fig_19 <- penguins %>% 
  ggplot(aes(x = bill_length_mm, y = bill_depth_mm, color = species)) +
  geom_point() +
  scale_color_manual(values = c("red", "green", "blue")) + 
  theme_void()
fig_19

######################################
### Customizing Labels with labs() ###
######################################

# The `labs()` function in ggplot2 allows you to customize plot labels, 
# including titles, subtitles, captions, and axis labels. 
# You can use `labs()` to change the text displayed in various parts 
# of your plot.

# Example 20: Customizing Plot Labels

fig_20 <- penguins %>%
  ggplot(aes(x = bill_length_mm, y = bill_depth_mm, color = species)) +
  geom_point() +
  labs(
    title = "Scatter Plot of Bill Length vs. Bill Depth",
    x = "Length of Bill (mm)",
    y = "Depth of Bill (mm)",
    subtitle = "Data from the PalmerPenguins dataset",
    caption = "Source: Penguin Data", 
    color = "La La La"
  )

fig_20

# Example 21: Customizing Plot Labels

fig_21 <- mtcars %>%
  ggplot(aes(x = factor(cyl), fill = factor(gear)))+
  geom_bar() + 
  labs(
    title = "Bar Graph",
    x = "Cylinders",
    y = "Total Number",
    fill = "La La La"  
  )

fig_21

########################################################
#################### Do it yourself ####################
########################################################

# Practice modifying colors and themes from plots you've 
# already created in parts a and b.

