
###############################################
### Interactive Data Visualization (Part c) ###
###############################################

#install.packages("DT")

library(plotly)
library(DT)
library(dygraphs)
library(tidyverse)
library(babynames)


###################################### 
### Interactive Tables with Plotly ###
######################################

fig <- plot_ly(
  type = "table",
  header = list(
    values = c("<b>Cars</b>", names(mtcars)),
    align = c("right", rep("center", ncol(mtcars))),
    line = list(width = 1, color = 'black'),
    fill = list(color = 'blue'),
    font = list(family = "Arial", size = 14, color = "white")
  ),
  cells = list(
    values = rbind(
      rownames(mtcars), 
      t(as.matrix(unname(mtcars)))
    ),
    align = c("left", rep("center", ncol(mtcars))),
    line = list(color = "black", width = 1),
    fill = list(color = c("pink", "yellow")),
    font = list(family = "Arial", size = 12, color = c("black"))
  ))


fig





#########################################
### Interactive Tables with Datatable ###
#########################################


# In this section, an interactive table is generated using the DT package. 
# The datatable() function is used to create the table from the Beatles dataset.
# Here's how it works:

# datatable() initializes an interactive table using the Beatles dataset.
# The options argument can be used to set various table options, like the number 
# of rows to display per page.

# The result is an interactive table that allows you to sort, search, and explore 
# the data efficiently.

Beatles <- babynames %>%
  filter(name %in% c("John", "Paul", "George", "Ringo") & sex == "M") 



interactive_table <- datatable(Beatles, options = list(pageLength = 10))
interactive_table

############### 
### Dygraph ###
###############

# This code generates an interactive time series plot showing the popularity of 
# Beatles names over time. You can adjust the date range and explore the data 
# dynamically. 

# Dygraphs is a powerful tool for visualizing time-dependent information and 
# can be customized further to suit your needs.

# * We filter the Beatles dataset for male names.
# * We select the relevant columns, such as year, name, and prop (popularity).
# * We use pivot_wider to reformat the data.
# * dygraph(main = "Popularity of Beatles names over time") initializes a 
#   Dygraph plot and sets the title.
# * dyRangeSelector(dateWindow = c("1900", "1980")) provides a range selector 
#   to focus on specific years.


fig1 <- Beatles %>% 
  filter(sex == "M") %>% 
  select(year, name, prop) %>%
  pivot_wider(names_from = name, values_from = prop) %>%
  dygraph(main = "Popularity of Beatles names over time") %>% 
  dyRangeSelector(dateWindow = c("1900", "1980"))
fig1

