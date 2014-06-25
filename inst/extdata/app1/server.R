library("shiny")
library("rauthoring")
library("DESeq2")
data(res)
res <- data.frame(res)[1:1000, ]


shinyServer(function(input, output) {
    ## Expression that generates a histogram. The expression is
    ## wrapped in a call to renderPlot to indicate that:
    ##
    ##  1) It is "reactive" and therefore should re-execute automatically
    ##     when inputs change
    ##  2) Its output type is a plot

    output$hist <- renderPlot({
        ## draw the histogram with the specified number of bins
        hist(res$pvalue, breaks = input$breaks,
             col = 'darkgray', border = 'white',
             main = "DESeq p-values")
    })
})
