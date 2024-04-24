library(shiny)
library(bslib)
library(mdsr)
library(tidyverse)

# Define user interface
ui <- page_sidebar(
  # App title
  title = "Basic App with 2 Outcomes",
  # Sidebar
  sidebar = sidebar(
    width = 350, 
    "This app illustrates how to build a shiny app that plots a 
    scatter plot based on two variables of your selection.", 
    card(
      card_header("Diamonds Dataset Variable Selection"),
      height = "350px",
      selectInput(
        inputId = "select",
        label = "Select the Variable on the x Axis",
        choices = list("Price" = "price", "Carat" = "carat", "Depth" = "depth"),
        selected = "price"), 
      selectInput(
        inputId = "select2",
        label = "Select the Variable on the y Axis",
        choices = list("Price" = "price", "Carat" = "carat", "Depth" = "depth"),
        selected = "price"), 
    )
  ),
  # Main Panel
  
  titlePanel("Selecting two variables, then making a scatter plot"),
  card(
    plotOutput("plot_var")
  ),
  card(
    textOutput("text_var")
  )
)

# Define server 
server <- function(input, output) {
  output$plot_var <- renderPlot({
    diamonds %>% 
      ggplot(aes(x = .data[[input$select]], y = .data[[input$select2]])) +
      geom_point()  
  }) 
  output$text_var <- renderText({
    paste("The variables you selected are", input$select, "and", input$select2)
  })

}

# Run the app 
shinyApp(ui = ui, server = server)