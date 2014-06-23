
all:
	make rauthoring.html


setvars:
ifeq (${R_HOME},)
R_HOME=	$(shell R RHOME)
endif

rauthoring.html: rauthoring.Rmd
	"$(R_HOME)/bin/R" --vanilla -e "library(rmarkdown); render('rauthoring.Rmd', 'html_document')"
