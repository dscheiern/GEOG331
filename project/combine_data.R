library(tidyverse)
library(janitor)

#set up initial dataframe
data.all <- tibble()

years <- 1990:2019
for (i in 1:length(years)){
  year <- years[i]
  fileName <- file.path("project","data",paste("LandfillReport",year,".csv", sep=""))
  #append to current data
  x <- read_csv(fileName)
  x <- x %>% mutate(year=year) %>%
             rename(total=paste(year, "Total"))
  data.all <- bind_rows(data.all, x)
}

write_csv(data.all, file.path("project","data","allYears.csv"))
