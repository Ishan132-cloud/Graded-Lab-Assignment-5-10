#!/bin/bash

# Validate argument count
if [ "$#" -ne 1 ]; then
    echo "Error: Please provide exactly one log file."
    exit 1
fi

# Validate file existence and readability
if [ ! -f "$1" ] || [ ! -r "$1" ]; then
    echo "Error: File does not exist or is not readable."
    exit 1
fi

logfile="$1"
date_str=$(date +%F)
report="logsummary_${date_str}.txt"

total=$(wc -l < "$logfile")
info=$(grep -c " INFO " "$logfile")
warn=$(grep -c " WARNING " "$logfile")
error=$(grep -c " ERROR " "$logfile")
latest_error=$(grep " ERROR " "$logfile" | tail -n 1)

{
    echo "Log Summary Report"
    echo "Date: $date_str"
    echo "Total entries: $total"
    echo "INFO messages: $info"
    echo "WARNING messages: $warn"
    echo "ERROR messages: $error"
    echo "Most recent ERROR:"
    echo "$latest_error"
} > "$report"

cat "$report"
