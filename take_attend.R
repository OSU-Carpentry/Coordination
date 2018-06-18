#!/usr/bin/Rscript
library("tidyverse")
library("stringr")

# Note: script cannot take more than one day of attendance at a time
# You need to run the script for each day if it is a multi-day workshop

# Note: the script will not support taking attendance for a workshop
# that is 100 or more days
args = commandArgs(trailingOnly = T)
if (length(args)!=4){
  stop("Need an input .csv file, attedance .csv file, day number, and output .csv file.\n", call. = F)
}

# Attendee reports
attendees <- read_csv(args[1])

# Import attendance file
daily_att <- read_csv(args[2])
daily_att <- unique(daily_att$Name)

# Derive the name of the attendance column
# for the day of the workshop
day_num = ifelse(as.numeric(args[3]) < 10, paste("0", args[3], sep = ""), args[3])
ws_day = paste("day", day_num, sep = "")

# Check whether or not a participant
# was present on a given day
# and add the respective attendance column

# Create a column with first and last name together
attendees <- attendees %>% 
  mutate(full_name = paste(first, last, sep = " "))

# If full name is in attendance list, attendance gets a
# TRUE, else FALSE
# full_name column is no longer neded once the comparison is done
attendees <- attendees %>% 
  mutate( !!ws_day := ifelse(full_name %in% daily_att, T, F)) %>%
  select(-full_name) %>%
  arrange(last)

attendees %>% write_csv(path = args[4])
