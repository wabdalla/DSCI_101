
###############################################
### Interactive Data Visualization - Part 1 ###
###############################################

library(tidyverse)
library(plotly)
library(mdsr)

################
### Datasets ###
################


data("iris")

### Dummy Data 1

dummy_data_1 <- data.frame(x = c(1:100), 
  col_1 = rnorm(100, mean = 5),
  col_2 = rnorm(100, mean = 0),
  col_3 = rnorm(100, mean = 0),
  col_4 = rnorm(100, mean = -5))

### Dummy Data 2

dummy_data_2 <- data.frame(month = c('January', 'February', 'March', 'April', 'May', 
           'June', 'July','August', 'September', 'October', 'November', 'December'),
year_2007 = c(36.5, 26.6, 43.6, 52.3, 71.5, 81.4, 80.5, 82.2, 76.0, 67.3, 46.1, 35.0),
year_2010 = c(28.8, 28.5, 37.0, 56.8, 69.7, 79.7, 78.5, 77.8, 74.1, 62.6, 45.3, 39.9),
year_2014 = c(12.7, 14.3, 18.6, 35.5, 49.9, 58.0, 60.0, 58.6, 51.7, 45.2, 32.2, 29.1)) %>%
  mutate(month = factor(month, levels = c('January', 'February', 'March', 'April', 'May', 
                                          'June', 'July','August', 'September', 'October', 'November', 'December')))


#################################
### Scatter Plots with Plotly ###
#################################

### Simple Scatter Plot 

fig1 <- plot_ly(data = iris, x = ~Sepal.Length, y = ~Petal.Length,
                type = "scatter", mode = "markers")
fig1

### Stylish Dots

fig2 <- plot_ly(data = iris, x = ~Sepal.Length, y = ~Petal.Length,
                type = "scatter", mode = "markers",
                marker = list(size = 10,
                              color = "red",
                              line = list(color = "blue",
                                          width = 2)))
fig2


### Three Variables

fig3 <- plot_ly(data = iris, x = ~Sepal.Length, y = ~Petal.Length, 
                color = ~Species, 
                type = "scatter", mode = "markers")
fig3


### Manually Change the Colors for the Third Variable
fig4 <- plot_ly(data = iris, x = ~Sepal.Length, y = ~Petal.Length, 
                color = ~Species,
                type = "scatter", mode = "markers", 
                colors = c("red", "blue", "green"))

fig4

### Symbols

fig5 <- plot_ly(data = iris, x = ~Sepal.Length, y = ~Petal.Length, 
                symbol = ~Species,
                type = 'scatter', mode = 'markers')

fig5

### Changing the colors of the symbols.

fig6 <- plot_ly(data = iris, x = ~Sepal.Length, y = ~Petal.Length, 
                symbol = ~Species,
                color = ~Species,
                type = 'scatter', mode = 'markers',
                colors = c("hotpink", "cyan", "black"))

fig6


### Layout (titles, background...etc) 

# Figure without layout
fig_7 <- plot_ly(data = dummy_data_1, x = ~col_2, y = ~col_3, 
                         type = "scatter", mode = "markers") 
fig_7

# Figure witht layout

fig8 <- plot_ly(data = dummy_data_1, x = ~col_2, y = ~col_3, 
                type = "scatter", mode = "markers") %>%
  layout(title = "This is the Title of the Plot", 
         legend = list(title=list(text="Legend Title")),
         plot_bgcolor="yellow", 
         xaxis = list( 
           title = "This is my x axis",
           zerolinecolor = "blue", 
           zerolinewidth = 10, 
           gridcolor = "red"), 
         yaxis = list( 
           title = "This is my y axis",
           zerolinecolor = "pink", 
           zerolinewidth = 10, 
           gridcolor = "black"))
fig8

# Figure with layout (zeroline)
fig9 <- plot_ly(data = dummy_data_1, x = ~col_2, y = ~col_3, 
                type = "scatter", mode = "markers") %>%
  layout(title = "This is the Title of the Plot", 
         xaxis = list( 
           title = "This is my x axis",
           zeroline = FALSE), 
         yaxis = list( 
           title = "This is my y axis"))
fig9


###################
### Line Plots ####
###################


fig10 <- plot_ly(data = dummy_data_1, x = ~x, y = ~col_1, 
                type = "scatter", mode = "lines")

fig10


### Line Plot with Markers

fig11 <- plot_ly(data = dummy_data_1, x = ~x, y = ~col_1, 
                type = "scatter", mode = "lines+markers")

fig11


### Combining Multiple Plots 


fig12 <- plot_ly(data = dummy_data_1, x = ~x, y = ~col_1, name = "First Plot", 
                type = "scatter", mode = "lines") %>%
  add_trace(y = ~col_2, name = "Second Plot", 
            type = "scatter", mode = "lines+markers") %>%
  add_trace(y = ~col_4, name = "Third Plot", 
            type = "scatter", mode = "markers")

fig12


### Style- Multiple Line Plot 

fig13 <- plot_ly(dummy_data_2, x = ~month, y = ~year_2010, name = "Year 2010", 
                type = "scatter", mode = "lines",
                line = list(color = "red", width = 4))%>%
  add_trace(y = ~year_2014, name = "Year 2014", 
            type = "scatter", mode = "lines",
            line = list(color = "blue", width = 4, dash = "dot")) %>%
  add_trace(y = ~year_2007, name = "Year 2007", 
            type = "scatter", mode = "lines",
            line = list(color = "green", width = 4, dash = "dash")) %>%
  layout(title = "Average High and Low Temperatures in New York",
         xaxis = list(title = "Months"),
         yaxis = list (title = "Temperature (degrees F)"))

fig13


####################################
## Combining ggplot2 with Plotly ###
####################################

# You can enhance static ggplot2 plots with interactivity by using ggplotly().
# The ggplotly() function is used to convert the ggplot plot to a Plotly 
# interactive plot.


fig14 <- dummy_data_1 %>%
  ggplot(aes(x = col_1, y = col_2))+
  geom_point()
fig14

ggplotly(fig14)


########################################################
#################### Do it yourself ####################
############### Practice with "SAT_2010" ###############
########################################################


# 1. Make a scatterplot using the SAT_2010 dataset, plot any two variables, with a 
#    third variable as the third. Label axis, plot title, use grid colors... etc. 


# 2. Build a scatter plot such that the border of the dots is one color and the filling
#    is another. 


# 3. Build a scatter plot with three variables such that you use the following colors: 
#    deepskyblue, hotpink, orangered


# 4. Build a scatter plot with three variables and the following symbols: "square", "circles", "x"


# 5. Make a line plot using the SAT_2010 dataset, plot with state in the x axis 
#    and salary in the y axis.. 
#    Label axis, plot title, use grid colors... etc. 





# 6. Plot three line plots into one plot using variable state on x and math, write, and read 
#    variables as the y. One of the plots has to be a line with markers, the other a dotted line,  
#    the last one a line with dashes. Each line has to be a different color. 
#    Label axis and title of the graph. 




# 7. Create a new variable in SAT_2010, that categorizes the salaries as low (less than 52000), 
#    medium (between 52000 and 60000), and hight (greater than 60000). Use this new varible 
#    to create a bar graph using ggplot. Then turn it into an interactive plot with ggplotly

