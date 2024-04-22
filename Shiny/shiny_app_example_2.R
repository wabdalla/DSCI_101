library(shiny)
library(bslib)
library(mdsr)
library(tidyverse)

# Define user interface
ui <- page_sidebar(
  # App title
  title = "Basic App with Histogram",
  # Sidebar
  sidebar = sidebar(
    width = 350, 
    "This app illustrates how to build a shiny app that plots a 
    histogram with different values of bin numbers using shiny." 
  ),
  # Main Panel
  
  titlePanel("Selecting a number on slider, then plotting a histogram"),
  layout_columns(
    card(
      card_header("Bin Number"),
      sliderInput(
        inputId = "slider",
        label = "Select number of bins",
        min = 0,
        max = 100,
        value = 50)
    ),
    
  ),
  card(
    plotOutput("selected_var")
  ),
)

# Define server 
server <- function(input, output) {
  output$selected_var <- renderPlot({
    SAT_2010 %>% 
      ggplot(aes(x = math)) +
      geom_histogram(bins = input$slider)  
  })
}

# Run the app 
shinyApp(ui = ui, server = server)