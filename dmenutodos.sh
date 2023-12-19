#!/usr/bin/env bash
# Simple dmenu/rofi based todo manager
# based on following philosophy
# Simply Make the entry if it doesnt exist or delete it.

FILE=~/todos.txt
input=$(dmenu -l 20 -p "Tasks: " < "$FILE")
#To use rofi replace above 'dmenu' with 'rofi -show -dmenu'

if grep -xF "$input" "$FILE" &> /dev/null; then
  replaced=$(grep -vxF "$input" "$FILE")
  printf "$replaced\n" > "$FILE"
else
  echo "$input" >> $FILE
fi


