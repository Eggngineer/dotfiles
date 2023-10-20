#!/usr/bin/env bash
shopt -s expand_aliases
if hash "fzf-tmux" 2>&1; then
    alias fzf="fzf-tmux -p 60%"
else
    alias fzf="fzf --height=60% --reverse"
fi

declare -A info=()
btlist=()
idx=0
bluetooth_info=$(blueutil --paired)
IFS=$'\n'

for line in $bluetooth_info; do
    line=$(echo ${line// \(*dBm\)/})
    IFS=',' read address connected_status _ _ name _ <<< "$line"
    address=$(echo ${address#*: })
    name=$(echo ${name#*: })
    name=$(echo ${name//\"/})
    connected_status=$(echo ${connected_status# })
    info[${name},'address']=$address
    info[${name},'connected_status']=$connected_status
    btlist[${idx}]=$name
    idx=$idx+1
done


selected=$(
for member in ${btlist[@]}; do
    echo $member
done | fzf
)

if [[ $selected ]]; then
    if [[ "${info[$selected,'connected_status']}" == "connected" ]]; then
        echo "Disconnected $selected"
        blueutil --disconnect ${info[${selected},'address']}
    else
        echo "Connect $selected"
        blueutil --connect ${info[${selected},'address']}
    fi
fi