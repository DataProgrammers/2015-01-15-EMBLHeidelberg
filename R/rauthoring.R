msg <- list(c("open the 'rauthoring' vignette:",
              "vignette('rauthoring', package = 'rauthoring')"),
            c("open the 'knitrreptools' vignette:",
              "vignette('knitrreptools', package = 'rauthoring')"),
             c("copy a simple template in your working directory:",
               "rmdtemplate()"),
            c("display this message:",
              "rauthoring()"))

##' Copies a simple R markdown template file in your working directory.
##'
##' @title Simple Rmd template
##' @param to Where to copy the file to. Default if \code{getwd()}.
##' @param ... Additional paramters to be passed to \code{file.copy}.
##' @return Used to its side effect. Returns output of
##' \code{file.copy}.
##' @author Laurent Gatto
rmdtemplate <- function(to = getwd(), ...) {
    from <- system.file("extdata/rmdtemplate.Rmd", package = "rauthoring")
    file.copy(from, to, ...)    
}

##' Displays rauthoring info
##'
##' @title rauthoring information
##' @return Used for its side effect.
##' @author Laurent Gatto
##' @examples
##' rauthoring()
rauthoring <- function() {
    v <- packageVersion("rauthoring")
    cat(paste0("Getting started with 'rauthoring' version ",v , ":\n"))
    for (i in 1:length(msg))
        cat("To", msg[[i]][1], "\n ", msg[[i]][2], "\n")
}
