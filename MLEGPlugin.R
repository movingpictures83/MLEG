library(dbnR)

dyn.load(paste("RPluMA", .Platform$dynlib.ext, sep=""))
source("RPluMA.R")


input <- function(inputfile) {
        pfix <<- prefix()
  parameters <<- read.table(inputfile, as.is=T);
  rownames(parameters) <<- parameters[,1];
}

run <- function() {}

output <- function(outputfile) {
size = as.integer(parameters["size", 2])
dt_train <- dbnR::motor[as.integer(parameters["start", 2]):as.integer(parameters["end", 2])]
net <- learn_dbn_struc(dt_train, size)
f_dt_train <- fold_dt(dt_train, size)
fit <- fit_dbn_params(net, f_dt_train, method = "mle-g")
print(fit)
}
