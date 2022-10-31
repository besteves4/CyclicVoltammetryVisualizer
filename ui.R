#######################
### Import packages ###
#######################
library('shinydashboard')
library('shiny')
library('data.table')
library('DT')
library('plotly')

######################
### User Interface ###
######################

ui <- dashboardPage(
    dashboardHeader(
      title = "Cyclic Voltammetry Visualizer",
      titleWidth = 350
    ),
    dashboardSidebar(
      width = 350,
      sidebarMenu(
        menuItem("Buffer", tabName = "buf", icon = icon("dashboard")),
        menuItem("Buffer+Mediator", tabName = "med", icon = icon("dashboard")),
        menuItem("Buffer+Substrate", tabName = "sub", icon = icon("dashboard")),
        menuItem("Buffer+Mediator+Substrate", tabName = "all", icon = icon("dashboard")),
        menuItem("Plots", tabName = "plots", icon = icon("th"))
      )
    ),
    dashboardBody(
      tabItems(
        # Buffer tab content
        tabItem(tabName = "buf",
                fluidRow(
                  box(
                    width = 6,
                    title = "Controls",
                    fileInput("bufferFile", "Choose files:", multiple = TRUE, accept = c(".ocw")),
                    textInput("buffer_electrodes_area", "Choose electrodes area:", 0.19),
                    textInput("buffer_title", "Title:", ""),
                    textInput("buffer_x_axis", "X axis:", ""),
                    textInput("buffer_y_axis", "Y axis:", ""),
                    selectInput("buffer_select", "Select plot:",
                                choices = c("Sample 1" = 1,
                                            "Sample 2" = 2,
                                            "Sample 3" = 3))
                  ),
                  box(
                    width = 6,
                    plotlyOutput('buffer_plot')
                  )
                )
        ),
        
        # Mediator tab content
        tabItem(tabName = "med",
                fluidRow(
                  box(
                    width = 6,
                    title = "Controls",
                    fileInput("medFile", "Choose files:", multiple = TRUE, accept = c(".ocw")),
                    textInput("med_electrodes_area", "Choose electrodes area:", 0.19),
                    textInput("med_title", "Title:", ""),
                    textInput("med_x_axis", "X axis:", ""),
                    textInput("med_y_axis", "Y axis:", ""),
                    selectInput("med_select", "Select plot:",
                                choices = c("Sample 1" = 1,
                                            "Sample 2" = 2,
                                            "Sample 3" = 3))
                  ),
                  box(
                    width = 6,
                    plotlyOutput('med_plot')
                  )
                )
        ),
        
        # Substrate tab content
        tabItem(tabName = "sub",
                fluidRow(
                  box(
                    width = 6,
                    title = "Controls",
                    fileInput("subFile", "Choose files:", multiple = TRUE, accept = c(".ocw")),
                    textInput("sub_electrodes_area", "Choose electrodes area:", 0.19),
                    textInput("sub_title", "Title:", ""),
                    textInput("sub_x_axis", "X axis:", ""),
                    textInput("sub_y_axis", "Y axis:", ""),
                    selectInput("sub_select", "Select plot:",
                                choices = c("Sample 1" = 1,
                                            "Sample 2" = 2,
                                            "Sample 3" = 3))
                  ),
                  box(
                    width = 6,
                    plotlyOutput('sub_plot')
                  )
                )
        ),
        
        # All tab content
        tabItem(tabName = "all",
                fluidRow(
                  box(
                    width = 6,
                    title = "Controls",
                    fileInput("allFile", "Choose files:", multiple = TRUE, accept = c(".ocw")),
                    textInput("all_electrodes_area", "Choose electrodes area:", 0.19),
                    textInput("all_title", "Title:", ""),
                    textInput("all_x_axis", "X axis:", ""),
                    textInput("all_y_axis", "Y axis:", ""),
                    selectInput("all_select", "Select plot:",
                                choices = c("Sample 1" = 1,
                                            "Sample 2" = 2,
                                            "Sample 3" = 3))
                  ),
                  box(
                    width = 6,
                    plotlyOutput('all_plot')
                  )
                )
        ),
        
        # Final plots tab content
        tabItem(tabName = "plots",
                fluidRow(
                  box(
                    width = 6,
                    title = "Controls",
                    textInput("final_plot_buffer", "Buffer sample title:", ""),
                    textInput("final_plot_med", "Buffer+Mediator sample title:", ""),
                    textInput("final_plot_sub", "Buffer+Substrate sample title:", ""),
                    textInput("final_plot_all", "Buffer+mediator+sample sample title:", ""),
                    textInput("final_plot_title", "Title:", ""),
                    textInput("final_plot_x_axis", "X axis:", ""),
                    textInput("final_plot_y_axis", "Y axis:", ""),
                  ),
                  box(
                    width = 6,
                    title = "Plot",
                    plotlyOutput('final_plot')
                  )
                )
        )
      )
    )
)
