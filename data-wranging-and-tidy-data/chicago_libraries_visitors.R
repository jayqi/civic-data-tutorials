
# install.packages('RSocrata')

library(data.table)
library(RSocrata)
library(ggplot2)
library(lubridate)
library(magrittr)

read.socrata.DT <- function(url) {
  data.table::as.data.table(
    RSocrata::read.socrata(url)
    )
}

visitors2016DT <- read.socrata.DT("https://data.cityofchicago.org/dataset/Libraries-2016-Visitors-by-Location/cpc6-pxmp")
# https://data.cityofchicago.org/dataset/Libraries-2016-Visitors-by-Location/cpc6-pxmp

str(visitors2016DT)
summary(visitors2016DT)

# Some basic cleaning before we begin
# - Last row is blank in the dataset, got read in as all NA
# - A bunch of the location names have trailing whitespace
BasicCleaning <- function(DT) {
  DT <- DT[!is.na(JANUARY)]
  DT[, LOCATION := trimws(LOCATION)]
  return(DT)
}
visitors2016DT <- BasicCleaning(visitors2016DT)


# Questions that are easy to answer in this format:
# - What are the mean and median visitors in March across libraries?
visitors2016DT[, mean(MARCH)]
visitors2016DT[, median(MARCH)]
# - How many visitors did Lincoln Park Library get in 2016?
visitors2016DT[LOCATION == "Lincoln Park", YTD]


# Questions that are more annoying to answer in this format:
# - What are the peak months for each library?
# - How many visitors were there for each library in Q1 of 2016? 
#     - What about in total? 
#     - What about the total for buildings where the traffic counter
#       includes the total building?
# - Plot changes over year for each library.
# - What if we want to look at changes for both 2015 and 2016? 
#   How do I intelligently append the 2015 dataset?

# Get rid of the YTD column. It's easy enough to recalculate if needed.
TidyingUp <- function(DT) {
  DT[, YTD := NULL]
  monthNames <- names(DT)[2:13]
  DT <- data.table::melt(DT
                       , id.vars = c('LOCATION')
                       , measure.vars = monthNames
                       , variable.name = 'MONTH'
                       , value.name = 'VISITORS'
  )
  
  DT[, BUILDING.TOTAL := ifelse(grepl('\\*', LOCATION), FALSE, TRUE)]
  DT[, LOCATION := gsub('\\*', '', LOCATION)]
  return(DT)
}
visitors2016DT <- TidyingUp(visitors2016DT)

# Questions that are more annoying to answer in this format:
# - What are the peak months for each library?
visitors2016DT[, max(VISITORS), by = 'LOCATION']
visitors2016DT[BUILDING.TOTAL == TRUE, max(VISITORS), by = 'LOCATION']
visitors2016DT[BUILDING.TOTAL == TRUE, max(VISITORS), by = 'LOCATION'][order(-V1)][1:5]

visitors2016DT[, .I[which.max(VISITORS)], by = 'LOCATION']
visitors2016DT[BUILDING.TOTAL == TRUE, .I[which.max(VISITORS)], by = 'LOCATION']

# - How many visitors were there for each library in Q1 of 2016? 
#     - What about in total? 
#     - What about the total for buildings where the traffic counter
#       includes the total building?
# - Plot changes over year for each library.



MonthAndYearToDateTime <- function(month, year) {
  dateTimeString <- paste(year
                  , sprintf("%02d", month)
                  , "01"
                  , sep = '-'
    )
  return(lubridate::ymd(dateTimeString))
}
CreateDateTimeColumn <- function(DT) {
  DT[, numMonth := match(MONTH, monthNames)]
  DT[, numYear := 2016]
  DT[, dateTime := MonthAndYearToDateTime(numMonth, numYear)]
}
visitors2016DT <- CreateDateTimeColumn(visitors2016DT)

(ggplot(data = visitors2016DT
        , mapping = aes(x = dateTime, y = VISITORS, color = LOCATION)
        )
+ geom_line()
)

# - What if we want to look at changes for both 2015 and 2016? 
#   How do I intelligently append the 2015 dataset?

visitors2015DT <- read.socrata.DT("https://data.cityofchicago.org/dataset/Libraries-2016-Visitors-by-Location/cpc6-pxmp")
# https://data.cityofchicago.org/dataset/Libraries-2015-Visitors-by-Location/7imc-umy4
visitors2015DT <- (visitors2015DT
                   %>% BasicCleaning
                   %>% TidyingUp
                   %>% CreateDateTimeColumn
)

visitorsDT <- data.table::rbindlist(list(visitors2015DT, visitors2016DT))


# https://cran.r-project.org/web/packages/data.table/vignettes/datatable-reshape.html