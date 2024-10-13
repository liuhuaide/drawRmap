library(shiny)
library(shiny.fluent)

if (!requireNamespace("CntoAPI", quietly = TRUE)) {
    if (!requireNamespace("remotes", quietly = TRUE)) {
        install.packages("remotes")
    }
    remotes::install_github("liuhuaide/CntoAPI")
}

library(CntoAPI)

# Define UI
ui <- fluidPage(
    titlePanel("Interactive Map Viewer"),
    
    sidebarLayout(
        sidebarPanel(
            textInput("location", "Enter a Location:", value = "Linköping"),
            selectInput("maptype", "Choose Map Type:", 
                        choices = c("outdoors","stamen_toner", "stamen_toner_lite", 
                                    "stamen_terrain", "stamen_terrain_background",
                                    "stamen_terrain_labels", "stamen_terrain_lines",
                                    "alidade_smooth", "alidade_smooth_dark")),
            sliderInput("zoom",
                        "Select Zoom Level:", 
                        min = 5, max = 18, value = 11)
        ),
        
        mainPanel(
            plotOutput("mapPlot")
        )
    )
)

# Define server
server <- function(input, output) {
    
    reactive_location <- reactive({
        req(input$location) 
        input$location
    })
    
    output$mapPlot <- renderPlot({
        drawRmap(location = reactive_location(),
                 maptype = input$maptype, zoom = input$zoom)
    })
}

shinyApp(ui = ui, server = server)