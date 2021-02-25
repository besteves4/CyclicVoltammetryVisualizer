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
        # First tab content
        tabItem(tabName = "buf",
                fluidRow(
                  box(
                    width = 6,
                    title = "Controls",
                    fileInput("bufferFile", "Choose buffer file:", multiple = TRUE, accept = c(".ocw")),
                    textInput("buffer_electrodes_area", "Choose electrodes area:", 0.19),
                    textInput("buffer_x_axis", "X axis:", ""),
                    textInput("buffer_y_axis", "Y axis:", "")
                  ),
                  box(
                    width = 6,
                    plotlyOutput('initial_plot')
                  )
                )
        ),
        
        # Second tab content
        tabItem(tabName = "plots",
                h2("Widgets tab content")
        )
      )
    )
)
