library("shiny")
library("rauthoring")
library("DESeq2")
data(res)
res <- data.frame(res)[1:1000, ]


shinyServer(function(input, output) {

    output$nsig <- renderPrint({
        if (input$radio == "raw") x <- res$pvalue
        else x <- res$padj
        table(x < input$k)
    })
    
    output$pvhist <- renderPlot({
        if (input$radio == "raw") x <- res$pvalue
        else x <- res$padj

        hist(x, breaks = input$breaks,
             col = 'darkgray', border = 'white',
             xlab = "p-values", 
             main = "DESeq2 results")

        abline(v = input$k, col = "red")        
  })
})
