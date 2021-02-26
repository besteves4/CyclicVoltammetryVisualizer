########################
### Shiny app server ###
########################

server <- function(input, output) {

  ##############
  ### Buffer ###
  ##############
  
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
  
  output$buffer_plot <- renderPlotly(
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
  
  ################
  ### Mediator ###
  ################
  
  # Mediator Sample 1
  med_x1 <- reactive({
    fread(input$medFile$datapath[1], skip = 2)$V1
  })
  
  med_y1 <- reactive({
    fread(input$medFile$datapath[1], skip = 2)$V2
  })
  
  # Mediator Sample 2
  med_x2 <- reactive({
    fread(input$medFile$datapath[2], skip = 2)$V1
  })
  
  med_y2 <- reactive({
    fread(input$medFile$datapath[2], skip = 2)$V2
  })
  
  #  Mediator Sample 3
  med_x3 <- reactive({
    fread(input$medFile$datapath[3], skip = 2)$V1
  })
  
  med_y3 <- reactive({
    fread(input$medFile$datapath[3], skip = 2)$V2
  })
  
  # Mediator electrodes area
  med_electrodes_area <- reactive({
    as.numeric(input$med_electrodes_area)
  })
  
  # Mediator x axis
  med_x_axis <- reactive({
    input$med_x_axis
  })
  
  # Mediator y axis
  med_y_axis <- reactive({
    input$med_y_axis
  })
  
  # Mediator plot title
  med_title <- reactive({
    input$med_title
  })
  
  output$med_plot <- renderPlotly(
    plot_ly(x = med_x1(), y = med_y1() * 1000000 / med_electrodes_area(), type = 'scatter', mode = 'lines', name = "Sample 1") %>%
      add_trace(x = med_x2(), y = med_y2() * 1000000 / med_electrodes_area(), type = 'scatter', mode = 'lines', name = "Sample 2") %>%
      add_trace(x = med_x3(), y = med_y3() * 1000000 / med_electrodes_area(), type = 'scatter', mode = 'lines', name = "Sample 3") %>%
      layout(title = med_title(),
             xaxis = list(title=med_x_axis(), 
                          zerolinecolor = toRGB("white"), 
                          gridcolor = toRGB("white"), 
                          tickcolor = toRGB("black"), 
                          showline = TRUE), 
             yaxis = list(title=med_y_axis(), 
                          zerolinecolor = toRGB("white"), 
                          gridcolor = toRGB("white"), 
                          tickcolor = toRGB("black"), 
                          showline = TRUE))
  )
  
  #################
  ### Substrate ###
  #################
  
  # Substrate Sample 1
  sub_x1 <- reactive({
    fread(input$subFile$datapath[1], skip = 2)$V1
  })
  
  sub_y1 <- reactive({
    fread(input$subFile$datapath[1], skip = 2)$V2
  })
  
  # Substrate Sample 2
  sub_x2 <- reactive({
    fread(input$subFile$datapath[2], skip = 2)$V1
  })
  
  sub_y2 <- reactive({
    fread(input$subFile$datapath[2], skip = 2)$V2
  })
  
  #  Substrate Sample 3
  sub_x3 <- reactive({
    fread(input$subFile$datapath[3], skip = 2)$V1
  })
  
  sub_y3 <- reactive({
    fread(input$subFile$datapath[3], skip = 2)$V2
  })
  
  # Substrate electrodes area
  sub_electrodes_area <- reactive({
    as.numeric(input$sub_electrodes_area)
  })
  
  # Substrate x axis
  sub_x_axis <- reactive({
    input$sub_x_axis
  })
  
  # Substrate y axis
  sub_y_axis <- reactive({
    input$sub_y_axis
  })
  
  # Substrate plot title
  sub_title <- reactive({
    input$sub_title
  })
  
  output$sub_plot <- renderPlotly(
    plot_ly(x = sub_x1(), y = sub_y1() * 1000000 / sub_electrodes_area(), type = 'scatter', mode = 'lines', name = "Sample 1") %>%
      add_trace(x = sub_x2(), y = sub_y2() * 1000000 / sub_electrodes_area(), type = 'scatter', mode = 'lines', name = "Sample 2") %>%
      add_trace(x = sub_x3(), y = sub_y3() * 1000000 / sub_electrodes_area(), type = 'scatter', mode = 'lines', name = "Sample 3") %>%
      layout(title = sub_title(),
             xaxis = list(title=sub_x_axis(), 
                          zerolinecolor = toRGB("white"), 
                          gridcolor = toRGB("white"), 
                          tickcolor = toRGB("black"), 
                          showline = TRUE), 
             yaxis = list(title=sub_y_axis(), 
                          zerolinecolor = toRGB("white"), 
                          gridcolor = toRGB("white"), 
                          tickcolor = toRGB("black"), 
                          showline = TRUE))
  )
  
  ###########
  ### All ###
  ###########
  
  # All Sample 1
  all_x1 <- reactive({
    fread(input$allFile$datapath[1], skip = 2)$V1
  })
  
  all_y1 <- reactive({
    fread(input$allFile$datapath[1], skip = 2)$V2
  })
  
  # All Sample 2
  all_x2 <- reactive({
    fread(input$allFile$datapath[2], skip = 2)$V1
  })
  
  all_y2 <- reactive({
    fread(input$allFile$datapath[2], skip = 2)$V2
  })
  
  #  All Sample 3
  all_x3 <- reactive({
    fread(input$allFile$datapath[3], skip = 2)$V1
  })
  
  all_y3 <- reactive({
    fread(input$allFile$datapath[3], skip = 2)$V2
  })
  
  # All electrodes area
  all_electrodes_area <- reactive({
    as.numeric(input$all_electrodes_area)
  })
  
  # All x axis
  all_x_axis <- reactive({
    input$all_x_axis
  })
  
  # All y axis
  all_y_axis <- reactive({
    input$all_y_axis
  })
  
  # All plot title
  all_title <- reactive({
    input$all_title
  })
  
  output$all_plot <- renderPlotly(
    plot_ly(x = all_x1(), y = all_y1() * 1000000 / all_electrodes_area(), type = 'scatter', mode = 'lines', name = "Sample 1") %>%
      add_trace(x = all_x2(), y = all_y2() * 1000000 / all_electrodes_area(), type = 'scatter', mode = 'lines', name = "Sample 2") %>%
      add_trace(x = all_x3(), y = all_y3() * 1000000 / all_electrodes_area(), type = 'scatter', mode = 'lines', name = "Sample 3") %>%
      layout(title = all_title(),
             xaxis = list(title=all_x_axis(), 
                          zerolinecolor = toRGB("white"), 
                          gridcolor = toRGB("white"), 
                          tickcolor = toRGB("black"), 
                          showline = TRUE), 
             yaxis = list(title=all_y_axis(), 
                          zerolinecolor = toRGB("white"), 
                          gridcolor = toRGB("white"), 
                          tickcolor = toRGB("black"), 
                          showline = TRUE))
  )
  
  #########################
  ### Final buffer plot ###
  #########################
  
  # Get selected buffer sample data
  selected_buffer_x <- reactive({
    fread(input$bufferFile$datapath[as.numeric(input$buffer_select)], skip = 2)$V1
  })
  
  selected_buffer_y <- reactive({
    fread(input$bufferFile$datapath[as.numeric(input$buffer_select)], skip = 2)$V2
  })
  
  output$final_buffer_plot <- renderPlotly(
    plot_ly(x = selected_buffer_x(), 
            y = selected_buffer_y() * 1000000 / buffer_electrodes_area(), 
            type = 'scatter', mode = 'lines', name = "Sample") %>%
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
  
  # Get selected mediator sample data
  selected_med_x <- reactive({
    fread(input$medFile$datapath[as.numeric(input$med_select)], skip = 2)$V1
  })
  
  selected_med_y <- reactive({
    fread(input$medFile$datapath[as.numeric(input$med_select)], skip = 2)$V2
  })
  
  output$final_med_plot <- renderPlotly(
    plot_ly(x = selected_med_x(), 
            y = selected_med_y() * 1000000 / med_electrodes_area(), 
            type = 'scatter', mode = 'lines', name = "Sample") %>%
      layout(title = med_title(),
             xaxis = list(title=med_x_axis(), 
                          zerolinecolor = toRGB("white"), 
                          gridcolor = toRGB("white"), 
                          tickcolor = toRGB("black"), 
                          showline = TRUE), 
             yaxis = list(title=med_y_axis(), 
                          zerolinecolor = toRGB("white"), 
                          gridcolor = toRGB("white"), 
                          tickcolor = toRGB("black"), 
                          showline = TRUE))
  )
  
  # Get selected substrate sample data
  selected_sub_x <- reactive({
    fread(input$subFile$datapath[as.numeric(input$sub_select)], skip = 2)$V1
  })
  
  selected_sub_y <- reactive({
    fread(input$subFile$datapath[as.numeric(input$sub_select)], skip = 2)$V2
  })
  
  output$final_sub_plot <- renderPlotly(
    plot_ly(x = selected_sub_x(), 
            y = selected_sub_y() * 1000000 / sub_electrodes_area(), 
            type = 'scatter', mode = 'lines', name = "Sample") %>%
      layout(title = sub_title(),
             xaxis = list(title=sub_x_axis(), 
                          zerolinecolor = toRGB("white"), 
                          gridcolor = toRGB("white"), 
                          tickcolor = toRGB("black"), 
                          showline = TRUE), 
             yaxis = list(title=sub_y_axis(), 
                          zerolinecolor = toRGB("white"), 
                          gridcolor = toRGB("white"), 
                          tickcolor = toRGB("black"), 
                          showline = TRUE))
  )
  
  # Get selected all sample data
  selected_all_x <- reactive({
    fread(input$allFile$datapath[as.numeric(input$all_select)], skip = 2)$V1
  })
  
  selected_all_y <- reactive({
    fread(input$allFile$datapath[as.numeric(input$all_select)], skip = 2)$V2
  })
  
  output$final_all_plot <- renderPlotly(
    plot_ly(x = selected_all_x(), 
            y = selected_all_y() * 1000000 / all_electrodes_area(), 
            type = 'scatter', mode = 'lines', name = "Sample") %>%
      layout(title = all_title(),
             xaxis = list(title=all_x_axis(), 
                          zerolinecolor = toRGB("white"), 
                          gridcolor = toRGB("white"), 
                          tickcolor = toRGB("black"), 
                          showline = TRUE), 
             yaxis = list(title=all_y_axis(), 
                          zerolinecolor = toRGB("white"), 
                          gridcolor = toRGB("white"), 
                          tickcolor = toRGB("black"), 
                          showline = TRUE))
  )
  
}