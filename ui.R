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
                    textInput("buffer_y_axis", "Y axis:", "")
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
                    textInput("med_y_axis", "Y axis:", "")
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
                    textInput("sub_y_axis", "Y axis:", "")
                  ),
                  box(
                    width = 6,
                    plotlyOutput('sub_plot')
                  )
                )
        ),
        
        # Plots tab content
        tabItem(tabName = "plots",
                h2("Widgets tab content")
        )
      )
    )
)
