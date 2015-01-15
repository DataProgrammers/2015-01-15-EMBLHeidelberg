<!--
%\VignetteEngine{knitr::knitr}
%\VignetteIndexEntry{R Authoring}
%\VignetteKeywords{vignette, markdown, knitr, shiny, ReportingTools}
%\VignettePackage{rauthoring}
-->

Authoring document for R
========================



# Introduction

This first section introduces some tools to author documents that
contain analysis results produced with R. Bringing data, results and
their interpretation is essential to assure reproducibility of an
analysis pipeline and to comprehensively communicate these results to
collaborators. A popular solution for this is *literate programming*,
a technique and set of tools that permit to

1. Write text and code within a single document. Here we will use the
   simple markdown syntax and include R code chunks; such documents
   are denoted *R markdown* and have the `Rmd` extension.
2. Extract (called *tangling*) and execute the code
3. Replace the original code chunks by their results into the original
   document (called *weaving*).
4. Compile the document into a final easily read format such as pdf or
   html.

Steps 2 to 4 are can be executed individually or automated into a
single command such as `knit2html` from the `knitr` package or using
editors such as Rstudio.

Other types of document and frameworks that combine a programming and
authoring languages are Sweave and knitr files `Rnw` (combining LaTeX
and R), [IPython](http://ipython.org/) for python and other languages,
[orgmode](http://orgmode.org/manual/Working-With-Source-Code.html#Working-With-Source-Code),
...

The second section introduces the
[`ReportingTools`](http://www.bioconductor.org/packages/release/bioc/html/ReportingTools.html)
package, in particular generation of interactive tables.

The last part very briefly presents the
[`shiny`](http://cran.r-project.org/web/packages/shiny/) package by
describing a simple application and suggesting a few ways to improve
it.

The test data used throughout this document is a `DESeq2` result, available with


```r
library("rauthoring")
data(res)
head(res)
```

```
## log2 fold change (MAP): treatment DPN vs Control 
## Wald test p-value: treatment DPN vs Control 
## DataFrame with 6 rows and 6 columns
##                    baseMean log2FoldChange      lfcSE        stat
##                   <numeric>      <numeric>  <numeric>   <numeric>
## ENSG00000000003 613.8196191    -0.01721595 0.08665378 -0.19867508
## ENSG00000000005   0.5502103    -0.10343711 1.09363241 -0.09458124
## ENSG00000000419 304.0481844    -0.01694580 0.09516592 -0.17806589
## ENSG00000000457 183.5157367    -0.09653608 0.12137865 -0.79532995
## ENSG00000000460 207.4336125     0.35003672 0.14375420  2.43496684
## ENSG00000000938  11.1597870    -0.06361400 0.44906886 -0.14165757
##                     pvalue      padj
##                  <numeric> <numeric>
## ENSG00000000003 0.84251692 0.9763738
## ENSG00000000005 0.92464745        NA
## ENSG00000000419 0.85867123 0.9797399
## ENSG00000000457 0.42642160 0.8887238
## ENSG00000000460 0.01489315 0.2727659
## ENSG00000000938 0.88735049        NA
```

```r
class(res)
```

```
## [1] "DESeqResults"
## attr(,"package")
## [1] "DESeq2"
```

# R Markdown

## Markdown syntax

The figures below, taken from
[the Rstudio markdown (v2) tutorial](http://rmarkdown.rstudio.com/authoring_pandoc_markdown.html)
illustrates basic markdown syntax and its output using Rstudio.

- Headers can be defined using `======` or `-----` (level 1 and 2
  respectively) or one or multiple `#` (for level 1, 2,
  ... respectively).

- Italic and bold fonts are defined using one to two `*` around the
  text.

- Bullet lists items start with a `-`.

- In-line code and verbatim expression are surrounded by  `` ` ``.

- Code blocks start and end with three back ticks.

- Starting a line with `>` offsets the text. 

![Markdow basics](./Figures/markdownOverview.png)

## R code chunks

To include R code in the R markdown file, the native code chunk
syntax is augmented with code chunk tags inside `{r, ...}`, as
illustrated below:

![Markdown code chunk](./Figures/markdownChunk.png)

The following optimal code chunk options are available:

- `{r, chunkname}` the first unnamed string is used to name the code
  chunk; useful for following the code execution and debugging.

- `{r, eval=TRUE}` by default the code in the chunk is
  executed. Alternatively, set `eval=FALSE`.

- `{r, echo=TRUE}` by default, the code is displayed before the
  output. Use `echo=FALSE` to hide the code.

- Control if messages, warnings or errors are to be displayed with
  `{r, message=TRUE, warning=TRUE, error=TRUE}`.

- Figure dimensions can be controlled with `fig.height` and
  `fig.width`.

To execute in-line code, use `` ` r 1+1` `` (no space between `` ` ``
and `r`).

## From `Rmd` to `html`

If you are using Rstudio, the simplest way to generate your final
output is to open your `Rmd` file and click the `Knit HTML` (or `Knit
PDF`, ...) button. From R, you can use the `knit2html` function and
give the `Rmd` as input. Both options will use the `knit` function to
*weave* the document and generate the markdown `md` file that includes
the code outputs. The generation of the final output will depend on
the software version you use: either `markdown::markdownToHTML` or the
more recent `rmarkdown::render` functions. 

> Exercise: Experiment with R markdown and the features described so
> far. Either create your `Rmd` file from scratch or use the simple
> template from the `rauthoring` package with `rmdtemplate()`.

## More markdown

- Superscript^2^ using `  ^2^  ` and ~~strikethrough~~ using `  ~~strikethrough~~  `.

- To use ordered lists, just precede to list items by their respective number:
    1. first item
    2. second item
    3. and so on ...


- To use links, enclose the link text in `[]` and the the actual link
  in `()`: ` [my link](http://linkurl.com) `

- To add a static figure to the document, use the link syntax and
  precede it by `!`: ` ![image text](./fig/myfig.png) `.

- Tables can easily be printed inside an R chunk. Below, we explicitly
  convert `res` to a `data.frame`. Although the next code chunk would
  also work, not every function to display a table would accept a
  specific class such as `DESeqResults`.


```r
library("rauthoring")
library("DESeq2")
data(res)
head(res)
```

```
## log2 fold change (MAP): treatment DPN vs Control 
## Wald test p-value: treatment DPN vs Control 
## DataFrame with 6 rows and 6 columns
##                    baseMean log2FoldChange      lfcSE        stat
##                   <numeric>      <numeric>  <numeric>   <numeric>
## ENSG00000000003 613.8196191    -0.01721595 0.08665378 -0.19867508
## ENSG00000000005   0.5502103    -0.10343711 1.09363241 -0.09458124
## ENSG00000000419 304.0481844    -0.01694580 0.09516592 -0.17806589
## ENSG00000000457 183.5157367    -0.09653608 0.12137865 -0.79532995
## ENSG00000000460 207.4336125     0.35003672 0.14375420  2.43496684
## ENSG00000000938  11.1597870    -0.06361400 0.44906886 -0.14165757
##                     pvalue      padj
##                  <numeric> <numeric>
## ENSG00000000003 0.84251692 0.9763738
## ENSG00000000005 0.92464745        NA
## ENSG00000000419 0.85867123 0.9797399
## ENSG00000000457 0.42642160 0.8887238
## ENSG00000000460 0.01489315 0.2727659
## ENSG00000000938 0.88735049        NA
```

```r
class(res)
```

```
## [1] "DESeqResults"
## attr(,"package")
## [1] "DESeq2"
```

```r
res <- data.frame(res)
```

   The most recent version of R Markdown also has a table syntax
   described
   [here](http://rmarkdown.rstudio.com/authoring_pandoc_markdown.html#tables). Such
   tables can be generated with the helper function
   `knitr::kable`. Such tables are then displayed as html
   tables. Instead of copy/pasting the output of `kabble` into the R
   markdown document, one can specify `results='asis'` for the output
   of the code chunk to be interpreted as is, i.e. write raw results
   from R into the output document.


```r
library("knitr")
kable(head(res))
```



|                |    baseMean| log2FoldChange|     lfcSE|       stat|    pvalue|      padj|
|:---------------|-----------:|--------------:|---------:|----------:|---------:|---------:|
|ENSG00000000003 | 613.8196191|     -0.0172159| 0.0866538| -0.1986751| 0.8425169| 0.9763738|
|ENSG00000000005 |   0.5502103|     -0.1034371| 1.0936324| -0.0945812| 0.9246475|        NA|
|ENSG00000000419 | 304.0481844|     -0.0169458| 0.0951659| -0.1780659| 0.8586712| 0.9797399|
|ENSG00000000457 | 183.5157367|     -0.0965361| 0.1213787| -0.7953300| 0.4264216| 0.8887238|
|ENSG00000000460 | 207.4336125|      0.3500367| 0.1437542|  2.4349668| 0.0148932| 0.2727659|
|ENSG00000000938 |  11.1597870|     -0.0636140| 0.4490689| -0.1416576| 0.8873505|        NA|


|                |    baseMean| log2FoldChange|     lfcSE|       stat|    pvalue|      padj|
|:---------------|-----------:|--------------:|---------:|----------:|---------:|---------:|
|ENSG00000000003 | 613.8196191|     -0.0172159| 0.0866538| -0.1986751| 0.8425169| 0.9763738|
|ENSG00000000005 |   0.5502103|     -0.1034371| 1.0936324| -0.0945812| 0.9246475|        NA|
|ENSG00000000419 | 304.0481844|     -0.0169458| 0.0951659| -0.1780659| 0.8586712| 0.9797399|
|ENSG00000000457 | 183.5157367|     -0.0965361| 0.1213787| -0.7953300| 0.4264216| 0.8887238|
|ENSG00000000460 | 207.4336125|      0.3500367| 0.1437542|  2.4349668| 0.0148932| 0.2727659|
|ENSG00000000938 |  11.1597870|     -0.0636140| 0.4490689| -0.1416576| 0.8873505|        NA|

- To avoid wasting time in repeating long calculations over and over
  again, it is possible to cache specific code chunks specifying
  `cache=TRUE` in the chunk header.


- The most recent release of [R markdown (version 2)]() supports many
  more features and requires a recent version of
  [`pandoc`](http://johnmacfarlane.net/pandoc/), the workhorse that
  converts markdown to html and many other formats.

> Try out some of these additional features in your own `Rmd` file or
> look at this vignettes source code. Find where it is with
> `system.file("doc/rauthoring.Rmd", package = "rauthoring")`.

# ReportingTools

The Bioconductor
[`ReportingTools`](http://www.bioconductor.org/packages/release/bioc/html/ReportingTools.html)
provides additional features to generate reports. From the
[Bioc landing page](http://www.bioconductor.org/packages/release/bioc/html/ReportingTools.html):

    The ReportingTools software package enables users to easily
	display reports of analysis results generated from sources such as
	microarray and sequencing data. The package allows users to create
	HTML pages that may be viewed on a web browser such as Safari, or
	in other formats readable by programs such as Excel. Users can
	generate tables with sortable and filterable columns, make and
	display plots, and link table entries to other data sources such
	as NCBI or larger plots within the HTML page. Using the package,
	users can also produce a table of contents page to link various
	reports together for a particular project that can be viewed in a
	web browser. For more examples, please visit our site:
	http://research-pub.gene.com/ReportingTools.


For example, to create a html report that contains an interactive html table:


```r
library("ReportingTools")
htmlRep <- HTMLReport(shortName = "htmltable",
                      reportDirectory = "./reports")
publish(res, htmlRep)
finish(htmlRep)
browseURL("./reports/htmltable.html")
```

Note that the code above requires a `data.frame` and would not work
with `DESeqResults`.

> Generate the ReportingTools dynamic html table as shown above.

In particular, it seamlessly integrates with `knitr` and R markdown
documents, as illustrated in the
[`knitrreptools` vignette](./knitrreptools.html). 

See the `ReportingTools` vignettes for more details and other use cases:


```r
vignette(package = "ReportingTools")
```

# Web applications with `shiny`

`shiny` is an R package that allows to build interactive web
applications from R. These apps are composed of a user interface part
and a server back end. These are saved in the `ui.R` and `server.R`
files respectively. Both files are stored in a directory, `app1`
below. Both sides continuously react to their respective updates,
hence the term of *reactive programming*.

## Server

The server back end defines the server functionality through the
`shinyServer` function, which itself takes an anonymous function as
input with parameters `input` and `output`. The former corresponds to
data that stems for the user interface (see below) and the latter
defines the server output that will be available to the interface.


```
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
```

## Interface

The interface is handled by the `shinyUI` function that draws the
interface
[layout](http://shiny.rstudio.com/articles/layout-guide.html). Below,
we create a `fluidPage` layout composed by a title and a side bar
layout. The latter contains a side bar and a main panel. The side bar
get a slider input widget with ranges from 10 to 100 and default value
50 - the value will be available in the server input as
`input$breaks`. The main panel is composed by a plot renderer that
display the value `"hist"`, that is returned by the server back end.


```
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
```


To start this application use the `runApp` function with the name of
the directory containing the server and interface definitions. 


```r
runApp("./app1")
```

> Create the `ui.R` and `server.R` files, store them in a directory,
> and start you shiny app.

Let's try to improve our simple first app. A suggestion is available
by running the `app2()` function. The additional widgets added to the
interface are `radioButtons`, a `numericInput` field (side bar) and a
`verbatimTextOutput` (main panel). The server back end takes advantage
of two new inputs to add a vertical line to the histogram and displays
a table of significant/non-significant features.

A few useful links : 
- [`shiny` tutorial](http://shiny.rstudio.com/tutorial/)
- The [`shiny` gallery][widgets](http://shiny.rstudio.com/gallery).
- [Application layouts](http://shiny.rstudio.com/articles/layout-guide.html)

# Session information


```
## R Under development (unstable) (2014-11-01 r66923)
## Platform: x86_64-unknown-linux-gnu (64-bit)
## 
## locale:
##  [1] LC_CTYPE=en_GB.UTF-8       LC_NUMERIC=C              
##  [3] LC_TIME=en_GB.UTF-8        LC_COLLATE=en_GB.UTF-8    
##  [5] LC_MONETARY=en_GB.UTF-8    LC_MESSAGES=en_GB.UTF-8   
##  [7] LC_PAPER=en_GB.UTF-8       LC_NAME=C                 
##  [9] LC_ADDRESS=C               LC_TELEPHONE=C            
## [11] LC_MEASUREMENT=en_GB.UTF-8 LC_IDENTIFICATION=C       
## 
## attached base packages:
## [1] parallel  stats4    stats     graphics  grDevices utils     datasets 
## [8] methods   base     
## 
## other attached packages:
##  [1] XML_3.98-1.1            DESeq2_1.7.16          
##  [3] RcppArmadillo_0.4.600.0 Rcpp_0.11.3            
##  [5] GenomicRanges_1.19.32   GenomeInfoDb_1.3.12    
##  [7] IRanges_2.1.35          S4Vectors_0.5.16       
##  [9] BiocGenerics_0.13.4     rauthoring_0.2.4       
## [11] knitr_1.8              
## 
## loaded via a namespace (and not attached):
##  [1] acepack_1.3-3.3       annotate_1.45.0       AnnotationDbi_1.29.12
##  [4] base64enc_0.1-2       BatchJobs_1.5         BBmisc_1.8           
##  [7] Biobase_2.27.1        BiocParallel_1.1.10   brew_1.0-6           
## [10] checkmate_1.5.1       cluster_1.15.3        codetools_0.2-9      
## [13] colorspace_1.2-4      DBI_0.3.1             digest_0.6.8         
## [16] evaluate_0.5.5        fail_1.2              foreach_1.4.2        
## [19] foreign_0.8-61        formatR_1.0           Formula_1.1-2        
## [22] genefilter_1.49.2     geneplotter_1.45.0    ggplot2_1.0.0        
## [25] grid_3.2.0            gtable_0.1.2          Hmisc_3.14-6         
## [28] htmltools_0.2.6       httpuv_1.3.2          iterators_1.0.7      
## [31] lattice_0.20-29       latticeExtra_0.6-26   locfit_1.5-9.1       
## [34] MASS_7.3-35           mime_0.2              munsell_0.4.2        
## [37] nnet_7.3-8            plyr_1.8.1            proto_0.3-10         
## [40] R6_2.0.1              RColorBrewer_1.1-2    reshape2_1.4.1       
## [43] RJSONIO_1.3-0         rpart_4.1-8           RSQLite_1.0.0        
## [46] scales_0.2.4          sendmailR_1.2-1       shiny_0.10.2.2       
## [49] splines_3.2.0         stringr_0.6.2         survival_2.37-7      
## [52] tools_3.2.0           xtable_1.7-4          XVector_0.7.3
```

# References

- The [`knitr`](http://yihui.name/knitr/) package
- [`markdown`](http://cran.r-project.org/web/packages/markdown/index.html)
  and [`rmarkdown`](https://github.com/rstudio/rmarkdown/) packages
- [R markdown](http://rmarkdown.rstudio.com/) documentation
- The [`ReportingTools`](http://www.bioconductor.org/packages/release/bioc/html/ReportingTools.html) package.
- [`shiny`](http://cran.r-project.org/web/packages/shiny/) package and
  [web page](http://shiny.rstudio.com/).
- [R markdown video](http://vimeo.com/94181521)
- [`rauthoring` public repository](https://github.com/lgatto/rauthoring)
