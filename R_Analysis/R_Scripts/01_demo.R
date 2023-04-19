library(jsonlite)
demo_table <- read.csv(file='demo.csv', check.names = F)
demo_table2 <-  fromJSON(txt='demo.json')
