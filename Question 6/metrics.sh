#!/bin/bash

# Convert text to one word per line, lowercase
words=$(tr '[:space:]' '\n' < input.txt | tr '[:upper:]' '[:lower:]')

# Longest word
longest=$(echo "$words" | awk '{ print length, $0 }' | sort -nr | head -n 1 | cut -d" " -f2)

# Shortest word
shortest=$(echo "$words" | awk '{ print length, $0 }' | sort -n | head -n 1 | cut -d" " -f2)

# Average word length
avg=$(echo "$words" | awk '{ total+=length; count++ } END { print total/count }')

# Unique word count
unique=$(echo "$words" | sort | uniq | wc -l)

echo "Longest word: $longest"
echo "Shortest word: $shortest"
echo "Average word length: $avg"
echo "Unique words: $unique"
