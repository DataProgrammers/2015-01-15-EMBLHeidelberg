##' Inspecting DESeq2's pvalues.
##'
##' @title A shiny app.
##' @return Used for its side effect
##' @author Laurent Gatto
##' @aliases app1
app2 <- function() {
    require("DESeq2")
    runApp(system.file("extdata/app2/", package = "rauthoring"))
}


app1 <- function() {
    require("DESeq2")
    runApp(system.file("extdata/app1/", package = "rauthoring"))
}
