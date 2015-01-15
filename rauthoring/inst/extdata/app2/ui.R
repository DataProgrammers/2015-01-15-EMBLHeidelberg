library("shiny")

## Define UI for application that draws a histogram
shinyUI(fluidPage(
    ## Application title
    titlePanel("Interactive shiny report"),

    sidebarLayout(
        sidebarPanel(

            numericInput("k", label = h3("p-value cutoff"),
                         value = 0.05),
            
            radioButtons("radio",
                         label = h3("P-values"),
                         choices = list(
                             "Raw" = "raw",
                             "Adjusted" = "adj"), 
                         selected = "raw"),
            
            sliderInput("breaks",
                        "Number of breaks:",
                        min = 10,
                        max = 100,
                        value = 50)
        ),

        ## Show a plot of the generated distribution
        mainPanel(            
            plotOutput("pvhist"),

            verbatimTextOutput("nsig")
        )
    )
))
