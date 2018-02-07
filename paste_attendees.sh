# Name: paste_attendees.sh
# Usage: paste_attendees.sh [cleaned attendee .csv file]
# Description: Make a list from the cleaned registrants
#              file for the Google forms attendance form.

cat "$1" | cut -d, -f2,3 | tail -n +2 | sed "s/\,/\ /g" | sort
