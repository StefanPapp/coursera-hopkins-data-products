
require(data.table)
library(dplyr)
library(DT)
library(rCharts)

# Read data
data <- fread("./data/sets.csv")
head(data)
setnames(data, "t1", "theme")
setnames(data, "descr", "name")
setnames(data, "set_id", "setId")
