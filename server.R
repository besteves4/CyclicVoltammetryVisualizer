########################
### Shiny app server ###
########################

server <- function(input, output) {
  
  x1 <- reactive({
    fread(input$bufferFile$datapath[1], skip = 2)$V1
  })
  
  y1 <- reactive({
    fread(input$bufferFile$datapath[1], skip = 2)$V2
  })
  
  output$plot1 <- renderPlotly({
    plot1 <- plot_ly(
      x = x1(),
      y = y1(), 
      type = 'scatter',
      mode = 'markers')
  })
}