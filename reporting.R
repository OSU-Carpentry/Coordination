#!/usr/bin/Rscript
library("tidyverse")
# Inputs: Clean workshop attendance report, Master attendance file, .csv file with standardized list of academic departments
# Outputs: Updated master file, cumulative plot of number of workshops, cumulative plot showing total and "unique" participant numbers, plot showing numbers by department, plot showing numbers by university role, list of non-OSU institutions (generate a more general report).

# Import file and take user input.
# Throw an error if not given the right files and info.
args = commandArgs(trailingOnly = T)
if (length(args)!=3){
  stop("Need a master list .csv file, attedance .csv file, and a .csv file with a list of standardized department names.\n", call. = F)
}

master = read_csv(args[1])
workshop = read_csv(args[2])
departments = read_csv(args[3])

# Standardize department column.
# Throw an error if a new department or abbreviation
# shows up in the workshop attendance info.
departError <- function(new_dep){
  message <- paste("Non-standard department entry: ",
                    new_dep, sep = "")
  stop(paste(message, "\n\nPlease update the list of standardized department names.", 
              sep = ""))
}

workshop <- workshop %>%
            mutate(std_dep = ifelse( department %in% departments$abbreviation, 
                   departments[departments$abbreviation == department, 2],
                   departError(department))) %>%
            mutate(department = std_dep) %>%
            select(-std_dep)

# Standardize emails by making them all lowercase.
# Add a column to incoming data for start day of workshop.
# Append incoming information to the master list.

# Write out an updated master list.

# Write out a time series plot showing the number of workshops

# Write out a time series plot with two lines showing
# the total number of participants and total number
# of new participants.

# Write out a bar chart showing the number of participants by
# department.

# Write out a bar chart showing the number of participants by
# university role.

# Write out an updated list of non-OSU institutions represented
# at the workshops. Actually generate a full report.

# I need more information about NA when reading and writing csv files. Make sure this is tightly controlled in the script.
