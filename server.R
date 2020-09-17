########################
### Shiny app server ###
########################

server <- function(input, output) {

  # Sample 1
  x1 <- reactive({
    fread(input$bufferFile$datapath[1], skip = 2)$V1
  })

  y1 <- reactive({
    fread(input$bufferFile$datapath[1], skip = 2)$V2
  })
  
  # Sample 2
  x2 <- reactive({
    fread(input$bufferFile$datapath[2], skip = 2)$V1
  })
  
  y2 <- reactive({
    fread(input$bufferFile$datapath[2], skip = 2)$V2
  })

  # Sample 3
  x3 <- reactive({
    fread(input$bufferFile$datapath[3], skip = 2)$V1
  })
  
  y3 <- reactive({
    fread(input$bufferFile$datapath[3], skip = 2)$V2
  })
  
  # Sample 4
  x4 <- reactive({
    fread(input$bufferFile$datapath[4], skip = 2)$V1
  })
  
  y4 <- reactive({
    fread(input$bufferFile$datapath[4], skip = 2)$V2
  })
  
  output$initial_plot <- renderPlotly(
    plot_ly(x = x1(), y = y1() * 1000000 / 0.07, type = 'scatter', mode = 'lines', name = "Sample 1") %>%
      add_trace(x = x2(), y = y2() * 1000000 / 0.07, type = 'scatter', mode = 'lines', name = "Sample 2") %>%
      add_trace(x = x3(), y = y3() * 1000000 / 0.07, type = 'scatter', mode = 'lines', name = "Sample 3") %>%
      add_trace(x = x4(), y = y4() * 1000000 / 0.07, type = 'scatter', mode = 'lines', name = "Sample 4")
  )
  
}