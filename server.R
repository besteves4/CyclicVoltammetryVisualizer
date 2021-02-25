########################
### Shiny app server ###
########################

server <- function(input, output) {

  # Buffer Sample 1
  buffer_x1 <- reactive({
    fread(input$bufferFile$datapath[1], skip = 2)$V1
  })

  buffer_y1 <- reactive({
    fread(input$bufferFile$datapath[1], skip = 2)$V2
  })
  
  # Buffer Sample 2
  buffer_x2 <- reactive({
    fread(input$bufferFile$datapath[2], skip = 2)$V1
  })
  
  buffer_y2 <- reactive({
    fread(input$bufferFile$datapath[2], skip = 2)$V2
  })

  #  Buffer Sample 3
  buffer_x3 <- reactive({
    fread(input$bufferFile$datapath[3], skip = 2)$V1
  })
  
  buffer_y3 <- reactive({
    fread(input$bufferFile$datapath[3], skip = 2)$V2
  })
  
  # Buffer electrodes area
  buffer_electrodes_area <- reactive({
    as.numeric(input$buffer_electrodes_area)
  })
  
  # Buffer x axis
  buffer_x_axis <- reactive({
    input$buffer_x_axis
  })
  
  # Buffer y axis
  buffer_y_axis <- reactive({
    input$buffer_y_axis
  })
  
  # Buffer plot title
  buffer_title <- reactive({
    input$buffer_title
  })
  
  output$initial_plot <- renderPlotly(
    plot_ly(x = buffer_x1(), y = buffer_y1() * 1000000 / buffer_electrodes_area(), type = 'scatter', mode = 'lines', name = "Sample 1") %>%
      add_trace(x = buffer_x2(), y = buffer_y2() * 1000000 / buffer_electrodes_area(), type = 'scatter', mode = 'lines', name = "Sample 2") %>%
      add_trace(x = buffer_x3(), y = buffer_y3() * 1000000 / buffer_electrodes_area(), type = 'scatter', mode = 'lines', name = "Sample 3") %>%
      layout(title = buffer_title(),
             xaxis = list(title=buffer_x_axis(), 
                          zerolinecolor = toRGB("white"), 
                          gridcolor = toRGB("white"), 
                          tickcolor = toRGB("black"), 
                          showline = TRUE), 
             yaxis = list(title=buffer_y_axis(), 
                          zerolinecolor = toRGB("white"), 
                          gridcolor = toRGB("white"), 
                          tickcolor = toRGB("black"), 
                          showline = TRUE))
  )
  
}