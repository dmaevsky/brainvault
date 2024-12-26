#!/bin/bash
colors=("\033[31m" "\033[33m" "\033[32m" "\033[34m" "\033[35m")
reset_color="\033[0m"

IFS=$'\n' read -d '' -r -a subjects < mnemonics/subject.txt
IFS=$'\n' read -d '' -r -a locations < mnemonics/location.txt
IFS=$'\n' read -d '' -r -a actions < mnemonics/action.txt
IFS=$'\n' read -d '' -r -a objects < mnemonics/object.txt

key=$(openssl rand -hex 16 | tr 'a-f' 'A-F')
echo "$key"

for i in $(seq 0 6 24); do
    v=$(echo "ibase=16; ${key:i:6}" | bc)
    j1=$(($v & 0x3F))            # 6 bits
    j2=$(($v >> 6 & 0x1F))       # 5 bits
    j3=$(($v >> 11 & 0x3F))      # 6 bits
    j4=$(($v >> 17 & 0x7F))      # 7 bits

    color=${colors[$(($i/6))]}
    echo -e "${color}${subjects[j1]}, ${locations[j2]}, ${actions[j3]} ${objects[j4]}${reset_color}"
done
v=$(echo "ibase=16; ${key:30:2}" | bc)
echo "Magic number: $v"
