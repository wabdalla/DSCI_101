library(shiny)
library(bslib)

# Define user interface
ui <- page_sidebar(
  # App title
  title = "Basic App with Text",
  # Sidebar
  sidebar = sidebar(
    width = 350, 
    "In this app, you will learn how to print text, based on a specific value 
    you chose on a widget. This example illustrates the basic aspects of coding 
    using shiny" 
  ),
  # Main Panel
  
  titlePanel("Selecting a number on slider, then printing it"),
  layout_columns(
    col_width = 3,
    card(
      card_header("Sliders"),
      sliderInput(
        inputId = "slider",
        label = "Set value",
        min = 0,
        max = 100,
        value = 50)
    ),
    
  ),
  card(
    textOutput("selected_var")
  ),
)

# Define server 
server <- function(input, output) {
  output$selected_var <- renderText({
    paste("You have selected", input$slider)
  })
}

# Run the app 
shinyApp(ui = ui, server = server)