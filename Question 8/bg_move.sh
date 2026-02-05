#!/bin/bash

# Check argument
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <directory>"
    exit 1
fi

dir="$1"

# Validate directory
if [ ! -d "$dir" ]; then
    echo "Error: Directory does not exist."
    exit 1
fi

# Create backup directory
mkdir -p "$dir/backup"

# Move files in background
for file in "$dir"/*; do
    if [ -f "$file" ]; then
        mv "$file" "$dir/backup/" &
        echo "Moved $(basename "$file") with PID $!"
    fi
done

# Wait for all background jobs
wait
echo "All files moved."
