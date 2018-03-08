#!/bin/bash

# Name: get_ws_names.sh
# Usage: get_ws_names.sh [Processed Registrant List].csv
# Desctiption: After registrants list has been cleaned up,
#              get first and last names 
#              so they can be copied to the Google docs
#              attendance form.

cat "$1" | cut -d, -f2,3 | tail -n +2 | sort | sed "s/\,/\ /g"
