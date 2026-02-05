#!/bin/bash

dirA="dirA"
dirB="dirB"

echo "Files only in dirA:"
comm -23 <(ls "$dirA" | sort) <(ls "$dirB" | sort)

echo
echo "Files only in dirB:"
comm -13 <(ls "$dirA" | sort) <(ls "$dirB" | sort)

echo
echo "Files present in both directories:"
common=$(comm -12 <(ls "$dirA" | sort) <(ls "$dirB" | sort))

for file in $common
do
    if cmp -s "$dirA/$file" "$dirB/$file"; then
        echo "$file : contents match"
    else
        echo "$file : contents differ"
    fi
done
