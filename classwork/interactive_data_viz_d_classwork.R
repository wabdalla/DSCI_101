
###############################################
### Interactive Data Visualization (Part d) ###
###############################################

library(tidyverse)
library(plotly)


##################
### Histograms ###
##################


### Simple Histogram

dat <- data.frame(matrix(rnorm(6000, 3, 2), ncol = 2))%>%
  mutate(X3 = X2+2)

fig <- plot_ly(data = dat,  x = ~X1, type = "histogram")

fig


### Overlaid Histogram (alpha controls the level of transparency)

fig2 <- plot_ly(data = dat, x = ~X1, type = "histogram", alpha = 0.6) %>%
  add_histogram(x=~X3) %>%
  layout(barmode = "overlay")
fig2


################## 
### Bar Graphs ###
##################

# Data
data("mtcars")

dat2 <- mtcars%>%
  group_by(carb) %>%
  summarize(N = n())

### Simple Bar Graph

fig3 <- plot_ly(data = dat2, 
                x = ~carb, y = ~N, 
                type = "bar")
fig3               
            
### Changing colors 

fig4 <- plot_ly(data = dat2, 
                x = ~factor(carb), y = ~N, 
                type = "bar", 
                marker = list(color = c("red", "blue", "black", "purple", "green", "hotpink"))) %>%
  layout(xaxis = list(title = "Number of Carburetors"), 
         yaxis = list(title = "Count"))
fig4    

# Data 
Animals <- c("Elephants", "Lions", "Tigers")
OH_Zoo <- c(20, 15, 25)
IL_Zoo <- c(10, 17, 12)
dat3 <- data.frame(Animals, OH_Zoo, IL_Zoo)

### Grouped Bar Graph
fig5 <- plot_ly(data = dat3, x = ~Animals, y = ~OH_Zoo, 
                type = "bar", name = "Ohio Zoo") %>%
  add_trace(y = ~IL_Zoo, name = "Illinois Zoo") %>%
  layout(yaxis = list(title = "Count"), barmode = "group")
fig5

### Stacked Bar Grapah
fig6 <- plot_ly(data = dat3, x = ~Animals, y = ~OH_Zoo, 
                type = "bar", name = "Ohio Zoo") %>%
  add_trace(y = ~IL_Zoo, name = "Illinois Zoo") %>%
  layout(yaxis = list(title = "Count"), barmode = "stack")
fig6



################ 
### Boxplots ###
################

# Vertical 
fig7 <- plot_ly(data = dat, y = ~X1, type = "box")
fig7

# Horizontal
fig8 <- plot_ly(data = dat, x = ~X1, type = "box")
fig8

# Multiple
fig9 <- plot_ly(data = dat, y = ~X1, type = "box", name = "X1") %>%
   add_trace(y = ~X3, name = "X3")

fig9

# Multiple
data("diamonds")

fig10 <- plot_ly(data = diamonds, 
                 y = ~price, color = ~cut, type = "box")

fig10



########################################################
#################### Do it yourself ####################
########################################################

# Practice with "SAT_2010"
# Practice with "Diamonds"