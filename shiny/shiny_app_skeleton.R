library(shiny)
library(bslib)

# Define user interface 
ui <- page_sidebar(
  
  # App title
  
  title = "APP TITLE HERE",
  
  # Sidebar
  
  sidebar = sidebar(
    width = 350, 
    "Description of app here", 
    
  # Widget code here
  
  
  ),
  
  # Main Panel
  
  titlePanel("Panel Title Here!"),
  
)


# Define server logic
server <- function(input, output) {
  
}

# Run the app 
shinyApp(ui = ui, server = server)