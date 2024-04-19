library(shiny)
library(bslib)

# Define user interface
ui <- page_sidebar(
  # App title
  title = "Hello Shiny!!!",
  # Sidebar
  sidebar = sidebar(
    width = 350, 
    "This is what I want to write on my sidebar. In the next line you'll 
    see how you can write codes:", 
    code('x<-c(1, 2, 3)')
  ),
  # Main Panel
  
  titlePanel("Basic widgets"),
  layout_columns(
    col_width = 3,
    card(
      card_header("Checkbox group"),
      checkboxGroupInput(
        inputId = "checkGroup",
        label = "Select all that apply",
        choices = list("Choice 1" = 1, "Choice 2" = 2, "Choice 3" = 3),
        selected = 1)
    ),
    card(
      card_header("Radio buttons"),
      radioButtons(
        inputId = "radio",
        label = "Select option",
        choices = list("Choice 1" = 1, "Choice 2" = 2, "Choice 3" = 3),
        selected = 1)
    ),
    card(
      card_header("Select box"),
      selectInput(
        inputId = "select",
        label = "Select option",
        choices = list("Choice 1" = 1, "Choice 2" = 2, "Choice 3" = 3),
        selected = 1)
    ),
    card(
      card_header("Sliders"),
      sliderInput(
        inputId = "slider",
        label = "Set value",
        min = 0,
        max = 100,
        value = 50)
    ),
    
  )
)

# Define server 
server <- function(input, output) {
  
}

# Run the app 
shinyApp(ui = ui, server = server)