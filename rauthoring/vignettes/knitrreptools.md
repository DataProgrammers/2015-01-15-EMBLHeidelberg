<!--
%\VignetteEngine{knitr::knitr}
%\VignetteIndexEntry{ReportingTools and knitr R markdown}
%\VignetteKeywords{vignette, markdown, knitr, ReportingTools}
%\VignettePackage{rauthoring}
-->

ReporingTools and knitr
========================

## Introduction

It is possible to include `ReportingTools` elements into `knitr` R
markdown documents. Compiling such documents must be done with
`knitr::knit2html` (instead of `rmarkdown::render`).

## A table


```
## Error in library("ReportingTools"): there is no package called 'ReportingTools'
```

The following code chunk, with argument `results='asis'` will produce
the dynamic table below. Note that we need to specify the final
vignette destination directory (`instDoc`) for the JavaScript code to
be effectively inserted in the vignette. If it were not for a
vignette, the `reportDirectory` would be the directory containing
the report file.


```r
library("rauthoring")
data(res)
## must not be an instance of class DESeqResults
res <- data.frame(res[1:100, ])
library("ReportingTools")
library("XML")
instDoc <- file.path("..", "inst", "doc")
htmlRep <- HTMLReport(shortName = "knitrReport",
                      handlers = knitrHandlers,
                      reportDirectory = instDoc)
htmlRep[["res"]] <- res
```


```
## Error in library("ReportingTools"): there is no package called 'ReportingTools'
```

```
## Error in eval(expr, envir, enclos): could not find function "HTMLReport"
```

```
## Error in htmlRep[["res"]] <- res: object 'htmlRep' not found
```

See also `ReporterTools`'s `knitr` vignette.
