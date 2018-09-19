# Workflow for Data Collection

## Requirements
Before the workshop, we need to know names and emails of registered participants so we can send each participant an email with workshop instructions. This is usually done via mail merge with Outlook and Word. During the workshop, we collect attendance information. After the workshop, we combine registration data with attendance data and archive it for reporting purposes.

## Before the Workshop
### Eventbrite
Registration is done with Eventbrite. We currently collect the following from each participant:

- First name
- Last name
- Email address
- Status
  - Faculty
  - Graduate Student
  - Post Doc
  - Staff
  - Undergraduate Student
  - Other (please specify)
- Affiliation
  - OSU
  - Non-OSU (please specify)
- Department/Degree
  - [List](https://gradcollege.okstate.edu/degree) taken from the OSU Graduate College website.

Eventbrite produces a report that has more information than we care about (e.g. ticket price—our workshops are free).

### Workflow
I download a copy of the Eventbrite report after registration has closed and get names and emails for mail merge with Outlook and Word. I also get the list of names and copy them into a Google Form for taking attendance during the workshop. `attendees.R` cleans up the Eventbrite report, and `get_ws_names.sh` generates a list of names in alphabetical order by *first name.*

## During the Workshop
We ask participants to select their name from the pre-populated Google form each day to take attendance.

## After the Workshop
After the workshop, I take a cleaned-up version of the Eventbrite report and add the attendance data to it for later reporting. I also add this combined data to all the data from previous workshops in order report on the program as a whole. I use `attendees.R` to clean the Eventbrite report and `take_attend.R` match attendance data with the correct entry in the report. I use `reporting.R`, in conjunction with already archived data, to apend the newest data to the `.csv file` containing all the historical data.

Each workshop has its own folder on the Google Drive with a report specific to that workshop. There is also a `reporting` folder on the Google Drive that contains aggregate data from all the workshops.

The first two lines of a workshop report looks like this:

|     order_date      | first | last |          email       |         affiliation       |    status        |  department | day01 | day02 |
|         ---         |  ---  | ---  |           ---        |             ---           |      ---         |  ---        | ---   | ---   |
| 2017-05-31T21:59:54 |  Jane |  Doe |     jdoe@example.com | Oklahoma State University | Graduate Student | Mathematics | TRUE  | FALSE |
| 2017-05-31T21:59:54 |  John |  Doe | john.doe@example.com | University of Oklahoma    |     Faculty      |   Biology   | TRUE  |  TRUE |

The aggregate .csv file contains an extra column for the date of the first day of the workshop:

| start_date |     order_date      | first | last |          email       |         affiliation       |    status        |  department | day01 | day02 |
|    ---     |         ---         |  ---  | ---  |           ---        |             ---           |      ---         |  ---        | ---   | ---   |
| 2017-06-07 | 2017-05-31T21:59:54 |  Jane |  Doe |     jdoe@example.com | Oklahoma State University | Graduate Student | Mathematics | TRUE  | FALSE |
| 2017-06-07 | 2017-05-31T21:59:54 |  John |  Doe | john.doe@example.com | University of Oklahoma    |     Faculty      |   Biology   | TRUE  |  TRUE |

I currently store data in `.csv` format since our needs have not necessitated using a database. `.csv` files have the added advantage that they can be viewed directly on the Google Drive.

## Reporting
`reporing.R` also produces several plots: a timeseries of the total number of workshops, a timeseries of the total number of participants, a bar chart with total attendance by status, and a bar chart with total attendance by department/degree. I use the script to update these with each new workshop.
