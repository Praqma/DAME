#!/bin/bash

fileItemString=$(cat /proc/asound/cards| grep "\["|cut -d":" -f2 )

echo "Choose soundcard :"
i=0
while read line 
  do echo "$i : $line"
  i=$((i+1))
done  <<< "$fileItemString" | sed -n ${N}p

read a

echo "You select $a. Setting up sound"

cat << EOF > asound.conf
cm.!default {
    type hw
    card $a
}

ctl.!default {
    type hw           
    card $a
}
EOF
