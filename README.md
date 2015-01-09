# Advanced Course: R programming and development

- EMBL Heidelberg, 15 - 16 Jan 2015
- [Course Details](http://www.dataprogrammers.net/embl_jan2015/)

## Setup

A laptop with a recent R (>= 3.1.1), including developer tools (for
Windows, this means
[Rtools](http://cran.r-project.org/bin/windows/Rtools/)). See
[here](https://github.com/lgatto/TeachingMaterial/wiki) for
installation details.

To test your R installation, try the following

```r
## If you don't have devtools
install.packages("devtools")

library("devtools")
install_github("lgatto/sequences")
```

If you do not have any favourite editor, have a go with
[Rstudio](http://www.rstudio.com/products/rstudio/).

## Programme 

###  Day 1

| When          | What                                           |     |
|---------------|------------------------------------------------|-----|
|               | Setup and welcome                                        | LG |
| 09:15 - 10:30 | [OO Introduction](https://github.com/DataProgrammers/2015-01-15-EMBLHeidelberg/raw/master/roo/roo.pdf)                         | RS |
|               | Break                                                    |    |
| 11:00 - 12:30 | [S3/S4 object-oriented programming](https://github.com/DataProgrammers/2015-01-15-EMBLHeidelberg/raw/master/roo/roo.pdf)       | RS |
|               | Lunch                                                    |    |
| 13:30 - 15:30 | [Package development](https://github.com/DataProgrammers/2015-01-15-EMBLHeidelberg/raw/master//RPackageDevelopment/rpd.pdf)     | RS |
|               | Break                                                    |    |
| 16:00 - 17:30 | [Advanced issues in package development and documentation](https://github.com/DataProgrammers/2015-01-15-EMBLHeidelberg/raw/master//RPackageDevelopment/rpd.pdf)) | RS |

### Day 2

| When          | What                                           |     |
|---------------|------------------------------------------------|-----|
| 09:15 - 10:30 | [Testing](https://github.com/DataProgrammers/2015-01-15-EMBLHeidelberg/blob/master/R-debugging/testing.md), [Unit testing](https://github.com/DataProgrammers/2015-01-15-EMBLHeidelberg/blob/master/R-debugging/unittesting.md) and [debugging](https://github.com/DataProgrammers/2015-01-15-EMBLHeidelberg/raw/master/R-debugging/debugging.pdf)  | LG |
|               | Break                                                     |    |
| 11:00 - 12:30 | [Profiling] and calling [C/C++ code]                      | LG |
|               | Lunch                                                     |    |
| 13:30 - 15:30 | Vectorisation, functional programming and parallelisation | LG |
|               | Break                                                     |    |
| 16:00 - 17:30 | Building web interfaces: shiny                            | LG |
|               | Wrap up                                                   |    |


## Useful refs
- Various teaching material: https://github.com/lgatto/teachingmaterial
- [Advanced R](http://adv-r.had.co.nz/) by Hadley Wickham
- [Package development](http://r-pkgs.had.co.nz/)
- [Bioconductor package development](http://www.bioconductor.org/developers/how-to/buildingPackagesForBioc/)

