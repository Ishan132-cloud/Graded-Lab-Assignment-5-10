#!/bin/bash

# Normalize to lowercase, one word per line
words=$(tr '[:upper:]' '[:lower:]' < input.txt)

# Only vowels
grep -E '^[aeiou]+$' <<< "$words" > vowels.txt

# Only consonants
grep -E '^[bcdfghjklmnpqrstvwxyz]+$' <<< "$words" > consonants.txt

# Mixed: starts with a consonant AND contains at least one vowel AND one consonant
grep -E '^[bcdfghjklmnpqrstvwxyz][a-z]*$' <<< "$words" \
| grep -E '[aeiou]' \
| grep -E '[bcdfghjklmnpqrstvwxyz]' > mixed.txt
