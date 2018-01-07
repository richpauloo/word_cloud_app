# Define UI
ui <- fluidPage(theme = shinytheme("united"), 
  
  # App title
  titlePanel("Turn a .txt file into a Word Cloud"),
  
  # Sidebar layout with input and output definitions
  sidebarLayout(
    
    # Sidebar panel for inputs
    sidebarPanel(
      
      # Input: Slider for the number of words to display
      sliderInput(inputId = "num_words",
                  label = "Number of words to display:",
                  min = 1,
                  max = 100,
                  value = 50),
      
      # Input: .txt file
      fileInput("file", "Choose .txt File",
                accept = c(".txt")),
      
      # help Text describing .txt input
      helpText("On your computer, save a document you wish convert to a word cloud as a .txt file, and upload that .txt file here."),
      
      # Horizontal Line
      tags$hr(),
      
      # Output: Download word cloud
      downloadButton(outputId = "down", 
                     label = "Download the wordcloud"),
      
      # Horizontal Line
      tags$hr(),
      
      a(h4("View Source Code"), 
        target = "_blank", 
        href = "https://github.com/richpauloo/word_cloud_app")
      
    ),
    
    # Main panel for displaying outputs
    mainPanel(
      
      # Output: Word Cloud
      plotOutput("word_cloud")
      
    )
  )
)