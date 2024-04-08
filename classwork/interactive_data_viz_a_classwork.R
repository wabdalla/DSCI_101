
###############################################
### Interactive Data Visualization (Part a) ###
###############################################


library(tidyverse)
library(plotly)
library(palmerpenguins)
library(mdsr)


################################
### Scatterplots with Plotly ###
################################

#########################
## Simple Scatter Plot ##
#########################

fig1 <- plot_ly(data = penguins, x = ~bill_length_mm, 
                y = ~flipper_length_mm, type = "scatter", 
                mode = "markers")

fig1


##################################
## Three Variable Scatter Plots ##
##################################

fig2 <- plot_ly(data = penguins, x = ~bill_length_mm, y = ~bill_depth_mm, 
                color = ~species, 
                type = "scatter", mode = "markers") %>%
  layout(title="A Plotly Figure", legend=list(title=list(text='Species')),
         plot_bgcolor="aliceblue", 
         xaxis = list( 
           zerolinecolor = "white", 
           zerolinewidth = 2, 
           gridcolor = "white"), 
         yaxis = list( 
           zerolinecolor = "white", 
           zerolinewidth = 2, 
           gridcolor = "white"))
fig2


#########################
## Styled Scatter Plot ##
#########################

fig3 <- plot_ly(data = iris, x = ~Sepal.Length, y = ~Petal.Length,
                type = "scatter", mode = "markers",
               marker = list(size = 10,
                             color = 'red',
                             line = list(color = 'blue',
                                         width = 2))) %>%
              layout(title = 'Styled Scatter',
                     yaxis = list(zeroline = FALSE),
                     xaxis = list(zeroline = FALSE))

fig3

################################
## Manually change the colors ##
################################


# This one plots default colors
fig4 <- plot_ly(data = iris, x = ~Sepal.Length, y = ~Petal.Length, color = ~Species, 
                type = "scatter", mode = "markers")
fig4

# Define of a vector of colors

pal <- c("red", "blue", "green")

# Manually change the colors
fig5 <- plot_ly(data = iris, x = ~Sepal.Length, y = ~Petal.Length, 
                type = "scatter", mode = "markers", 
                color = ~Species, colors = pal)

fig5

############################
## Scatter Plot - Symbols ##
############################


fig6 <- plot_ly(data = iris, x = ~Sepal.Length, y = ~Petal.Length, 
                type = 'scatter', mode = 'markers', 
                symbol = ~Species, symbols = c('circle','x','o'),
                color = ~Species, marker = list(size = 10))

fig6

# Forcing all to be one same color.

fig7 <- plot_ly(data = iris, x = ~Sepal.Length, y = ~Petal.Length, type = 'scatter',
               mode = 'markers', symbol = ~Species, symbols = c('circle','x','o'),
               color = I('black'), marker = list(size = 10))

fig7


## Symbols and Manual Color


pal<-c("green", "cyan", "deeppink")
fig8 <- plot_ly(data = iris, x = ~Sepal.Length, y = ~Petal.Length, type = 'scatter',
                mode = 'markers', symbol = ~Species, symbols = c('circle','x','o'),
                color = ~Species, marker = list(size = 10), colors = pal)

fig8


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


