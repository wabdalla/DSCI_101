##################################################################### 
############## Data Visualization (Part c) - Classwork ##############
#####################################################################

library(tidyverse)
library(mdsr)
library(viridis)
library(palmerpenguins)


data("mtcars")
data("penguins")

#################################
### Guides and Themes ggplot2 ###
#################################
  
# Fundamental components of ggplot2

# Data: The dataset you're working with.
# Aesthetics Mapping (aes): How data variables map to plot aesthetics like position, color, shape, etc.
# Geometric Objects (geom): The visual elements to represent the data (points, lines, bars, etc.).
# Facets (facet_wrap or facet_grid): Splitting data into subplots based on a variable.
# Theme: Controlling the overall appearance of the plot.

##############
### Guides ###
##############
  

# `scale_fill_manual` and `scale_color_manual` are functions used 
#  to manually specify colors for fill and color aesthetics, respectively.


# Univariate simple bar graph
mtcars %>%
  ggplot(aes(x = factor(cyl))) +
  geom_bar() 

# I want to change the color of the bars. Is this the correct way?
mtcars %>%
  ggplot(aes(x = factor(cyl), color = "blue")) +
  geom_bar() 

# I want to change the color of the bars. Is this the correct way?
mtcars %>%
  ggplot(aes(x = factor(cyl), fill = "blue")) +
  geom_bar() 

# Fills all the bars with the same color
mtcars %>%
  ggplot(aes(x = factor(cyl))) +
  geom_bar(fill = "dodgerblue") 

# Fills all the lines with the same color
mtcars %>%
  ggplot(aes(x = factor(cyl))) +
  geom_bar(color = "dodgerblue")

mtcars %>%
  ggplot(aes(x = factor(cyl))) +
  geom_bar(fill = "pink", color = "dodgerblue")


# Adding a variable

mtcars %>%
ggplot(aes(x = factor(cyl), fill = factor(gear)))+
  geom_bar()

mtcars %>%
ggplot(aes(x = factor(cyl), fill = factor(gear)))+
  geom_bar()+
  scale_fill_manual(values = c("red", "green", "blue"))


mtcars %>%
  ggplot(aes(x = factor(cyl), fill = factor(cyl))) +
  geom_bar() + 
  scale_fill_manual(values = c("pink", "blue", "black")) 

# You should indicate in aes who you want filled. Otherwise it won't know.

mtcars %>%
  ggplot(aes(x = factor(cyl))) +
  geom_bar() + 
  scale_fill_manual(values = c("pink", "blue", "black")) 

# Default
penguins %>% 
ggplot(aes(x = bill_length_mm, y = bill_depth_mm, color = species)) +
  geom_point()

# What is wrong with this command? Why isn't this one working?
penguins %>% 
  ggplot(aes(x = bill_length_mm, y = bill_depth_mm, color = species)) +
  geom_point() +
  scale_fill_manual(values = c("red", "green", "blue"))

# Because it has to do with color, not fill. 
penguins %>% 
  ggplot(aes(x = bill_length_mm, y = bill_depth_mm, color = species)) +
  geom_point() +
  scale_color_manual(values = c("red", "green", "blue"))


### Using External Color Packages

# Sometimes, you may want to use specialized color palettes from external packages to enhance your data visualizations. Packages like `wesanderson` and `viridis` provide aesthetically pleasing color palettes that can make your plots more visually appealing.

# Example (using the viridis package):

penguins %>%
ggplot(aes(x = bill_length_mm, y = bill_depth_mm, color = species)) +
  geom_point() +
  scale_color_viridis(discrete = TRUE) 


penguins %>%
  ggplot(aes(x = bill_length_mm, y = bill_depth_mm, color = species)) +
  geom_point() +
  scale_color_viridis(discrete = TRUE, option = "C", alpha = 1)


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
#    Useful for creating plots that need to be easily readable in black and white.

# 3. theme_minimal():
#    As the name suggests, this theme is minimalistic.
#    It removes gridlines and most background elements, leaving a clean, white canvas.
#    Suitable for plots where you want to focus on the data without distractions.

# 4. theme_void():
#    This theme removes nearly all elements, providing a blank canvas.
#    It's useful when you want to start with a clean slate and add custom elements.


# Theme gray

penguins %>% 
  ggplot(aes(x = bill_length_mm, y = bill_depth_mm, color = species)) +
  geom_point() +
  scale_color_manual(values = c("red", "green", "blue")) + 
  theme_gray()

# Theme bw

penguins %>% 
  ggplot(aes(x = bill_length_mm, y = bill_depth_mm, color = species)) +
  geom_point() +
  scale_color_manual(values = c("red", "green", "blue")) + 
  theme_bw()

# Theme minimal

penguins %>% 
  ggplot(aes(x = bill_length_mm, y = bill_depth_mm, color = species)) +
  geom_point() +
  scale_color_manual(values = c("red", "green", "blue")) + 
  theme_minimal()

# Theme void

penguins %>% 
  ggplot(aes(x = bill_length_mm, y = bill_depth_mm, color = species)) +
  geom_point() +
  scale_color_manual(values = c("red", "green", "blue")) + 
  theme_void()

######################################
### Customizing Labels with labs() ###
######################################

# The `labs()` function in ggplot2 allows you to customize plot labels, 
# including titles, subtitles, captions, and axis labels. 
# You can use `labs()` to change the text displayed in various parts 
# of your plot.

# Example (customizing plot labels):

penguins %>%
ggplot(aes(x = bill_length_mm, y = bill_depth_mm, color = species)) +
  geom_point() +
  labs(
    title = "Scatter Plot of Bill Length vs. Bill Depth",
    x = "Length of Bill (mm)",
    y = "Depth of Bill (mm)",
    subtitle = "Data from the PalmerPenguins dataset",
    caption = "Source: Penguin Data"
  )

########################################################
#################### Do it yourself ####################
########################################################

# Practice modifying colors and themes from plots you've 
# already created in parts a and b.

