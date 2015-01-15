library("shiny")

## Define UI for application that draws a histogram
ui <- fluidPage(
    ## Application title
    titlePanel("DESeq2 results"),
    
    ## Sidebar with a slider input for the number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput("breaks",
                        "Number of breaks:",
                        min = 10,
                        max = 100,
                        value = 50)
        ),

        ## Show a plot of the generated distribution
        mainPanel(
            plotOutput("hist")
        )
    )
)

shinyUI(ui)
