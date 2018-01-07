# Define server logic
server <- function(input, output) {
  
  # Output: create word cloud plot
  output$word_cloud <- renderPlot({
    
   if(!is.null(input$file)) {
      input$file$datapath %>% read.table(header = FALSE, fill = TRUE) %>%
      clean_txt() %>% 
      with(wordcloud(word, n, 
                     random.order = FALSE, 
                     max.words = input$num_words, 
                     colors=pal))
   }

   if(is.null(input$file)) { 
      placeholder %>% 
      with(wordcloud(word, n, 
                     random.order = FALSE, 
                     min.freq = 1, 
                     colors=pal)) 
   }
    
  })
  
  test <- reactive( { 
    output$word_cloud
    } )
  
  # the file to download: the word cloud
  output$down <- downloadHandler(
    filename = function() { paste('wordcloud', '.png', sep='') },
    
    # this is admitedly sloppy because it recomputes the word cloud, but was a quick solution
    content = function(file) {
      png(file)
      input$file$datapath %>% read.table(header = FALSE, fill = TRUE) %>%
        clean_txt() %>% 
        with(wordcloud(word, n, 
                       random.order = FALSE, 
                       max.words = input$num_words, 
                       colors=pal))
      dev.off()
    }
  )
}
