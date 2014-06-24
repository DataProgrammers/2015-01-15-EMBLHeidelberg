
all:
	make rauthoring.html
	make knitrreptools.html

.PHONY: clean

setvars:
ifeq (${R_HOME},)
## R_HOME=	$(shell R RHOME)
R_HOME=/opt/Rpatched
endif

rauthoring.html: rauthoring.Rmd
	"$(R_HOME)/bin/R" --vanilla -e "library(rmarkdown); render('rauthoring.Rmd', 'html_document')"

knitrreptools.html: knitrreptools.Rmd
	"$(R_HOME)/bin/R" --vanilla -e "library(knitr); knit2html('knitrreptools.Rmd')"

clean: 
	rm -f *~
	rm -rf csslib jslib
	rm -f *html
	rm -f *.md *.R
	rm -f .build.timestamp
