#!/usr/bin/Rscript
library("tidyverse")
library("ggplot2")
# Inputs: Clean workshop attendance report, Master attendance file, .csv file with standardized list of academic departments
# Outputs: Updated master file, cumulative plot of number of workshops, cumulative plot showing total and "unique" participant numbers, plot showing numbers by department, plot showing numbers by university role, list of non-OSU institutions (generate a more general report).

# Import file and take user input.
# Throw an error if not given the right files and info.
args = commandArgs(trailingOnly = T)
if (length(args)!=3){
  stop("Need a master list .csv file, attedance .csv file, and a .csv file with a list of standardized department names.\n", call. = F)
}

master <- read_csv(args[1], na = "NA") %>% mutate(start_date = as.Date(start_date, format = "%y-%m-%d")) %>% 
          mutate(day02 = as.logical(day02))
workshop <- read_csv(args[2])
departments <- read_csv(args[3])
departments <- setNames(departments$department, departments$abbreviation)

# Standardize department column.
# Throw an error if a new department or abbreviation
# shows up in the workshop attendance info.
departError <- function(new_dep){
  message <- paste("\n\nNon-standard department entry: ",
                    new_dep, sep = "")
  stop(paste(message, "\nPlease update the list of standardized department names.", 
              sep = ""))
}

non_stand <- departments[workshop$department]

if(anyNA(non_stand)){
  departError(unique(workshop$department[is.na(non_stand)]))
}

workshop <- workshop %>%
            mutate(std_dep = departments[department]) %>%
            mutate(department = std_dep) %>%
            select(-std_dep)

# Standardize emails by making them all lowercase.
workshop <- workshop %>%
            mutate(email = tolower(email))

# Add a column for the workshop start date
first_day <- gsub("_.*", "", args[2])
workshop <- workshop %>%
            mutate(start_date = as.Date(first_day, foramt = "%y-%m-%d")) %>%
            select(start_date, everything())

# Make sure both the master list and the incoming attendance
# data have the same number of columns for attendance days.
# Append incoming information to the master list.
new_master <- bind_rows(master, workshop) %>%
              select(start_date, everything()) %>%
              arrange(desc(start_date), last)

# Write out an updated master list.
write_csv(new_master, path = "master_attendance_new.csv")

# Write out a time series plot showing the number of workshops
workshop_dates <- new_master %>% select(start_date) %>% unique() %>%
                  arrange(start_date) %>% mutate(number = 1:length(start_date))
workshop_dates <- ggplot(data = workshop_dates, mapping = aes(x = start_date, y = number)) +
                  geom_point() + labs(title = "Number of Workshops", x = "Date", y = "Number") +
                  theme(axis.text.x = element_text(angle = 90, hjust =1))
ggsave("num_workshops.jpg", dpi = 300)

# Write out a time series plot showing the total number of participants
first_time <- new_master[match(unique(new_master$email), new_master$email), ]
first_time <- first_time %>% filter(day01 == T | day02 == T) %>% count(start_date) %>% mutate(cumulative = cumsum(n))
first_time <- ggplot(data = first_time, mapping = aes(x = start_date, y = cumulative)) +
              geom_point() + labs(title = "Total First-Time Participants", x = "Date", y = "Number") +
              theme(axis.text.x = element_text(angle = 90, hjust =1))
ggsave("num_participants.jpg", dpi = 300)

# Write out a bar chart showing the number of participants by
# department.
dep_part <- new_master %>% count(department)
dep_part <- ggplot(data = dep_part, mapping = aes(department, n)) +
            geom_bar(stat = "identity") + labs(title = "Total Participants by Department", x = "Department", y = "Number") +
            theme(axis.text.x = element_text(angle = 90, hjust = 1))
ggsave("num_department.jpg", dpi = 300)

# Write out a bar chart showing the number of participants by
# university role.
role_part <- new_master %>% count(status)
role_part <- ggplot(data = role_part, mapping = aes(status, n)) +
            geom_bar(stat = "identity") + labs(title = "Total Participants by Job Classification", x = "Classification", y = "Number") +
            theme(axis.text.x = element_text(angle = 90, hjust = 1))
ggsave("num_class.jpg", dpi = 300)
