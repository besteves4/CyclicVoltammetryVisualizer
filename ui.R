#######################
### Import packages ###
#######################
library('shinydashboard')
library('shiny')

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
        menuItem("Galactose oxidase", tabName = "gaox", icon = icon("dashboard")),
        selectInput("variable", "Variable:",
                    c("Buffer" = "buf",
                      "Buffer+Mediator" = "med",
                      "Buffer+Substrate" = "sub",
                      "Buffer+Mediator+Substrate" = "medsub")),
        menuItem("Plots", tabName = "plots", icon = icon("th"))
      )
    ),
    dashboardBody(
      tabItems(
        # First tab content
        tabItem(tabName = "gaox",
                fluidRow(
                  box(plotOutput("plot1", height = 250)),
                  
                  box(
                    title = "Controls",
                    sliderInput("slider", "Number of observations:", 1, 100, 50)
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
