library(dplyr)
library(ggplot2)
library(readr)
library(tidyverse)
library(stringr)
setwd("~/R/Kamp/rawdata/ändern")

files <- list.files(path = "~/R/Kamp/rawdata/ändern", pattern = ".csv")

# df <- list.files(path="~/R/Kamp/rawdata/ändern", pattern=".csv") %>%
#     lapply(read_csv2, skip=3, show_col_types=F) %>%


y<-lapply(seq_along(files), function(x) transform(read_csv2(files[x], skip=3), file = files[x])) %>%
    bind_rows() %>%
    mutate(file = str_replace_all(file,"Kamp_", ""))


library(stringr)


Kamegg<-read.csv(files[1],sep=";",skip=3,header=T, stringsAsFactors = T)

files[2]


