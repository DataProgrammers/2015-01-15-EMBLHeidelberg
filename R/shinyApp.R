##' Inspecting DESeq2's pvalues.
##'
##' @title A shiny app.
##' @return Used for its side effect
##' @author Laurent Gatto
app2 <- function() {
    require("DESeq2")
    runApp(system.file("extdata/app2/", package = "rauthoring"))
}
