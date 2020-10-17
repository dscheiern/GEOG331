
library(tidyverse)
library(janitor)
library(readxl)
## start with data files directly 

years <- 1990:2019
for (i in 1:length(years)){
  year <- years[i]
  fileName <- file.path("project","data",paste(year, "QuarterlyReportByCounty.xlsx", sep=""))
  x <- readxl::read_excel(fileName)

  x <- janitor::remove_empty(x, which = "cols")
  x <- janitor::remove_empty(x, which = "rows")

  x <- x[-c(1,nrow(x)),]
  x <- janitor::remove_empty(x, which = "cols")
  x <- x %>% row_to_names(row_number = 1)
  assign(paste("landfill", year, sep = ""), x)
}
