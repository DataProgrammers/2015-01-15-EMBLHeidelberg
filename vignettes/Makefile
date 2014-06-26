
all:
	make rauthoring.html
	make knitrreptools.html

.PHONY: clean


setvars:
ifeq (${R_HOME},)
R_HOME=	$(shell R RHOME)
endif

rauthoring.html: rauthoring.Rmd
	## "$(R_HOME)/bin/R" --vanilla -e "library(rmarkdown); render('rauthoring.Rmd', 'html_document')"
	"$(R_HOME)/bin/R" --vanilla -e "library(knitr); library(markdown); opts <- options('markdown.HTML.options')[[1]]; opts <- opts[-grep('mathjax', opts)]; options(markdown.HTML.options = opts); knit2html('rauthoring.Rmd')"


knitrreptools.html: knitrreptools.Rmd
	"$(R_HOME)/bin/R" --vanilla -e "library(knitr); library(markdown); opts <- options('markdown.HTML.options')[[1]]; opts <- opts[-grep('mathjax', opts)]; options(markdown.HTML.options = opts); knit2html('knitrreptools.Rmd')"

clean: 
	rm -f *~
	rm -rf csslib jslib
	rm -f *.md *.R
	rm -f .build.timestamp
