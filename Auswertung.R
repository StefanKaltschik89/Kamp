library(dplyr)
library(ggplot2)
library(readr)
library(tidyverse)
library(stringr)
library(lubridate)
setwd("~/R/Kamp/rawdata/ändern")

##Liste der Filenamen im Ordner erstellen
files <- list.files(path = "~/R/Kamp/rawdata/ändern", pattern = ".csv")


revier_rosenburg<-lapply(seq_along(files), function(x) transform(read_delim(files[x], skip=3,), Ort = files[x])) %>% ###Lese alle files ein und füge column Ort hinzu wobei column der Name der Datei ist
    bind_rows() %>% ###Zusammenführen der DAtensätze
    mutate(Ort = str_replace_all(Ort,"Kamp_", "")) %>% ####Kamp und Dateieindung aus Reihen entfernen
    mutate(Ort = str_replace_all(Ort,".csv", "")) %>%
    select(-7) %>%  ###unnötige column Unit entfernen
    distinct()

revier_wide<-pivot_wider(revier_rosenburg, names_from=Ort, values_from=Temperature)

####datum muss umformatiert werden


