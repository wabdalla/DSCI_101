
# install.packages("shiny")
# install.packages("bslib")
library(shiny)
library(bslib)

# Define your user interface (ui) for app
ui <- page_sidebar(
  # App title
  title = "Hello Shiny!!!",
  # Sidebar panel for inputs
  sidebar = sidebar(
    # Input: Slider for the number of bins ----
    sliderInput(
      inputId = "bins",
      label = "Number of bins:",
      min = 5,
      max = 50,
      value = 30
    )
  ),
  # Output: Histogram
  plotOutput(outputId = "distPlot")
)


# Define server logic required to draw a histogram

server <- function(input, output) {
  
  # Histogram of the Old Faithful Geyser Data ----
  # with requested number of bins
  # This expression that generates a histogram is wrapped in a call
  # to renderPlot to indicate that:
  #
  # 1. It is "reactive" and therefore should be automatically
  #    re-executed when inputs (input$bins) change
  # 2. Its output type is a plot
  
  output$distPlot <- renderPlot({
    
    x    <- faithful$waiting
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    hist(x, breaks = bins, col = "blue", border = "orange",
         xlab = "Waiting time to next eruption (in mins)",
         main = "Histogram of waiting times")
    
  })
  
}

shinyApp(ui = ui, server = server)
