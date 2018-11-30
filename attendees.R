#!/usr/bin/Rscript
library("tidyverse")

args = commandArgs(trailingOnly = T)
if (length(args)==0){
  stop("Need an input .csv file!\n", call. = F)
} else if (length(args)==1){
  args[2] = "out.csv"
}

attendees <- read_csv(args[1])

attendees <- attendees %>% 
  select(order_date = 'Order Date', first = 'First Name', 
         last = 'Last Name', email = 'Email', affiliation = 'Please Specify', 
         status = 'Status', department = 'Department/Degree?') %>% 
  mutate(affiliation = ifelse(is.na(affiliation), 
                              "Oklahoma State University", affiliation))

#prompt01 <- "Enter workshop dates as space separated list in YYYY-MM-DD format.\n"
#ws_dates <- as.Date(strsplit(readline(prompt01), " ")[[1]])

attendees %>% write_csv(path = args[2])
