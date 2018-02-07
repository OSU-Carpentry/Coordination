library("tidyverse")
library("stringr")

# Attendee reports
attendees <- read_csv("./2018-01-08.csv")

# Import daily attendance files
att_days <- c("./2018-01-08_attendance.csv", "./2018-01-09_attendance.csv")
daily_att <- lapply(att_days, read_csv)
daily_att <- daily_att %>% 
  lapply(function(x) unique(x$Name))

# Check whether or not a participant
# was present on a given day
# and add the respective attendance column
attendees <- attendees %>% 
  mutate(full_name = paste(first, last, sep = " "))


#attendees <- attendees %>% 
#  mutate("2018-01-09_attendance" = ifelse(full_name %in% day02, T, F))