#!/bin/bash

colors=("\033[31m" "\033[33m" "\033[32m" "\033[34m" "\033[35m")
reset_color="\033[0m"

key=""
for i in $(seq 0 4) ; do
    IFS=": " read -r j1 subject <<< "$(awk '{print NR":", $0}' mnemonics/subject.txt | fzf --height 20)"
    IFS=": " read -r j2 location <<< "$(awk '{print NR":", $0}' mnemonics/location.txt | fzf --height 20)"
    IFS=": " read -r j3 action <<< "$(awk '{print NR":", $0}' mnemonics/action.txt | fzf --height 20)"
    IFS=": " read -r j4 object <<< "$(awk '{print NR":", $0}' mnemonics/object.txt | fzf --height 20)"

    v=$((j1-1))
    (( v += (j2-1) << 6 ))
    (( v += (j3-1) << 11 ))
    (( v += (j4-1) << 17 ))

    key+=$(printf "%06X\n" "$v")

    color=${colors[$i]}

    read -p "$(echo -e "${color}${subject}, ${location}, ${action} ${object}${reset_color}")"
done

read -p "Enter the magic number: " v
key+=$(printf "%02X\n" "$v")

echo "$key"
