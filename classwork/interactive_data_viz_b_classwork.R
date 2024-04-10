
###############################################
### Interactive Data Visualization (Part b) ###
###############################################

library(plotly)
library(tidyverse)
library(mdsr)
library(babynames)


# Creating a dataframe: by creating three random vectors 
# (trace_0, trace_1, and trace_2) with 100 data points each.
# The dataframe is created, containing these three vectors 
# and a sequence of numbers x from 1 to 100.

trace_0 <- rnorm(100, mean = 5)
trace_1 <- rnorm(100, mean = 0)
trace_2 <- rnorm(100, mean = -5)
x <- c(1:100)

dummy_data <- data.frame(x, trace_0, trace_1, trace_2)

###################
### Line Plots ####
###################


fig1 <- plot_ly(data = dummy_data, x = ~x, y = ~trace_0, 
               type = "scatter", mode = "lines")

fig1

###############################
### Line Plot with Markers ####
###############################


fig2 <- plot_ly(data = dummy_data, x = ~x, y = ~trace_0, 
                type = "scatter", mode = "lines+markers")

fig2

################################
### Combining Multiple Plots ###
################################


fig3 <- plot_ly(data = dummy_data, x = ~x, y = ~trace_0, name = "First Plot", 
                type = "scatter", mode = "lines") %>%
        add_trace(y = ~trace_1, name = "Second Plot", 
                type = "scatter", mode = "lines+markers") %>%
        add_trace(y = ~trace_2, name = "Third Plot", 
                type = "scatter", mode = "markers")

fig3

#################################
### Style- Multiple Line Plot ###
#################################

# Creating a new dataframe

month <- c('January', 'February', 'March', 'April', 'May', 'June', 'July',
          'August', 'September', 'October', 'November', 'December')

year_2007 <- c(36.5, 26.6, 43.6, 52.3, 71.5, 81.4, 80.5, 82.2, 76.0, 67.3, 46.1, 35.0)
year_2010 <- c(28.8, 28.5, 37.0, 56.8, 69.7, 79.7, 78.5, 77.8, 74.1, 62.6, 45.3, 39.9)
year_2014 <- c(12.7, 14.3, 18.6, 35.5, 49.9, 58.0, 60.0, 58.6, 51.7, 45.2, 32.2, 29.1)

dummy_data_2 <- data.frame(month, year_2007, year_2010, year_2014)

#The default order will be alphabetized unless specified as below:
ordered_month_data <- dummy_data_2 %>%
  mutate(month = factor(month, levels = dummy_data_2[["month"]]))



fig4 <- plot_ly(ordered_month_data, x = ~month, y = ~year_2010, name = "Year 2010", 
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

fig4





####################################
## Combining ggplot2 with Plotly ###
####################################

# You can enhance static ggplot2 plots with interactivity by using ggplotly().
# The plot is created using the babynames dataset and represents the popularity 
# of names of The Beatles members. 

# Here's the explanation:
# A ggplot object called beatles_plot is created using ggplot2.
# The ggplotly() function is used to convert the ggplot plot to a Plotly 
# interactive plot.



Beatles <- babynames %>%
  filter(name %in% c("John", "Paul", "George", "Ringo") & sex == "M") 

beatles_plot <- ggplot(data = Beatles, aes(x = year, y = n)) +
  geom_line(aes(color = name), size = 2)
beatles_plot

ggplotly(beatles_plot)


########################################################
#################### Do it yourself ####################
############### Practice with "SAT_2010" ###############
########################################################



# 1. Make a line plot using the SAT_2010 dataset, plot with state in the x axis 
#    and salary in the y axis.. 
#    Label axis, plot title, use grid colors... etc. 





# 2. Plot three line plots into one plot using variable state on x and math, write, and read 
#    variables as the y. One of the plots has to be a line with markers, the other a dotted line,  
#    the last one a line with dashes. Each line has to be a different color. 
#    Label axis and title of the graph. 





# 3. Create a new variable in SAT_2010, that categorizes the salaries as low (less than 52000), 
#    medium (between 52000 and 60000), and hight (greater than 60000). Use this new varible 
#    to create a bar graph using ggplot. Then turn it into an interactive plot with ggplotly


