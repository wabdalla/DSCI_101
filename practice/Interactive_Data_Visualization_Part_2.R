###############################################
### Interactive Data Visualization - Part 2 ###
###############################################

#install.packages("DT")
#install.packages("dygraphs")

library(tidyverse)
library(plotly)
library(DT)
library(dygraphs)
library(babynames)

##################
### Histograms ###
##################

### Dataset:

data_1 <- data.frame(x = c(1:3000), 
                           col_1 = rnorm(3000, mean = 5),
                           col_2 = rnorm(3000, mean = 3),
                           col_3 = rnorm(3000, mean = 0),
                           col_4 = rnorm(3000, mean = -5))

### Simple Histogram

fig1 <- plot_ly(data = data_1,  x = ~col_1, 
                type = "histogram", nbinsx = 100)

fig1

### Overlaid Histogram (alpha controls the level of transparency)

fig2 <- plot_ly(data = data_1, x = ~col_1, 
                type = "histogram", alpha = 0.6, name = "Hist 1") %>%
  add_histogram(x = ~col_2, name = "Hist 2") %>%
  layout(barmode = "overlay")
fig2


################## 
### Bar Graphs ###
##################

### Dataset:

data("mtcars")
data_2 <- mtcars%>%
  group_by(carb) %>%
  summarize(N = n())


### Simple Bar Graph

fig3 <- plot_ly(data = data_2, 
                x = ~carb, y = ~N, 
                type = "bar")
fig3               

### Changing colors 

fig4 <- plot_ly(data = data_2, 
                x = ~factor(carb), y = ~N, 
                type = "bar", 
                marker = list(color = c("red", "blue", "black", "purple", "green", "hotpink"))) %>%
  layout(xaxis = list(title = "Number of Carburetors"), 
         yaxis = list(title = "Count"))
fig4    

### Dataset:

data_3 <- data.frame(
  Animals = c("Elephants", "Lions", "Tigers"),
  OH_Zoo = c(20, 15, 25),
  IL_Zoo = c(10, 17, 12))

### Grouped Bar Graph
fig5 <- plot_ly(data = data_3, x = ~Animals, y = ~OH_Zoo, 
                type = "bar", name = "Ohio Zoo") %>%
  add_trace(y = ~IL_Zoo, name = "Illinois Zoo") %>%
  layout(yaxis = list(title = "Count"), barmode = "group")
fig5

### Stacked Bar Graph
fig6 <- plot_ly(data = data_3, x = ~Animals, y = ~OH_Zoo, 
                type = "bar", name = "Ohio Zoo") %>%
  add_trace(y = ~IL_Zoo, name = "Illinois Zoo") %>%
  layout(yaxis = list(title = "Count"), barmode = "stack")
fig6



################ 
### Boxplots ###
################

### Dataset: data_1 was defined above for the first example. 

# Vertical 
fig7 <- plot_ly(data = data_1, y = ~col_1, type = "box")
fig7

# Horizontal
fig8 <- plot_ly(data = data_1, x = ~col_1, type = "box")
fig8

# Multiple
fig9 <- plot_ly(data = data_1, y = ~col_1, type = "box", name = "Column 1") %>%
  add_trace(y = ~col_2, name = "Column 2")

fig9

# Multiple

### Dataset:

data("diamonds")

fig10 <- plot_ly(data = diamonds, 
                 y = ~price, color = ~cut, type = "box")

fig10


#########################################
### Interactive Tables with Datatable ###
#########################################


### Dataset: 
data("babynames")
Beatles <- babynames %>%
  filter(name %in% c("John", "Paul", "George", "Ringo") & sex == "M") 

# In this section, an interactive table is generated using the DT package. 
# with the function datatable() we will turn a dataframe into an interactive
# table. 


interactive_table <- datatable(Beatles, options = list(pageLength = 10))
interactive_table

############### 
### Dygraph ###
###############

# This code generates an interactive time series plot showing the popularity of 
# Beatles names over time. You can adjust the date range and explore the data 
# dynamically. 

# Dygraphs is a powerful tool for visualizing time-dependent information.

# * We use the Beatles dataset.
# * We select the relevant columns, such as year, name, and prop (popularity).
# * We use pivot_wider to reformat the data.
# * dygraph(main = "Popularity of Beatles names over time") initializes a 
#   Dygraph plot and sets the title.
# * dyRangeSelector(dateWindow = c("1900", "1980")) provides a range selector 
#   to focus on specific years.


fig11 <- Beatles %>% 
  select(year, name, prop) %>%
  pivot_wider(names_from = name, values_from = prop) %>%
  dygraph(main = "Popularity of Beatles names over time") %>% 
  dyRangeSelector(dateWindow = c("1900", "1980"))
fig11


########################################################
#################### Do it yourself ####################
########################################################

# Practice each kind of plot with "SAT_2010" and/or with "Diamonds"
