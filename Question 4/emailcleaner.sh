#!/bin/bash

# Check if input file exists
if [ ! -f "emails.txt" ]; then
    echo "emails.txt not found"
    exit 1
fi

# Extract valid emails, remove duplicates
grep -E '^[a-zA-Z0-9]+@[a-zA-Z]+\.com$' emails.txt | sort | uniq > valid.txt

# Extract invalid emails
grep -Ev '^[a-zA-Z0-9]+@[a-zA-Z]+\.com$' emails.txt > invalid.txt

echo "Email cleaning completed"
