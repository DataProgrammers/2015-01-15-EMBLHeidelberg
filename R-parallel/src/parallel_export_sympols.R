library(parallel)

ll <- replicate(8, matrix(rnorm(1e6),1000), simplify=FALSE)
g <- function(x) mean(solve(x), trim=0.7)
f <- function(x) g(x)

Rprof()
f(ll[[1]])
Rprof(NULL)
summaryRprof()

## serial execution
t1 <- system.time(res1 <- lapply(ll, f))
print(t1)


## multicore
cores <- detectCores()
print(cores)
t2 <- system.time(res2 <- mclapply(ll, f))
stopifnot(all.equal(res1, res2))
print(t2)

## snow
cl <- makeCluster(8)
clusterExport(cl, "g")
t3 <- system.time(res3 <- parLapply(cl, ll, f))
stopifnot(all.equal(res2, res3))
print(t3)
stopCluster(cl)

## if more symbols are requires, use
## clusterExport(cl, c("otheVar", "otherFun"))

library(doMC)
library(foreach)
registerDoMC(2)

foreach(i = ll) %dopar% f(i)
##foreach(i = ll) %do% f(i) ## serial version

library(plyr)
llply(ll, f, .parallel=TRUE)
