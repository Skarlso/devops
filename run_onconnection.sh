#!/bin/bash

function log {
    directory="/Users/<username>/wifi_detect"
    log_dir_exists=true
    if [ ! -d $directory ]; then
        echo "Attempting to create => $directory"
        mkdir -p $directory
        if [ ! -d $directory ]; then
            echo "Could not create directory. Continue to log to echo."
            log_dir_exists=false
        fi
    fi
    if [$log_dir_exists]; then
        echo $1 >> "$directory/log.txt"
    else
        echo $1
}

function kill_program {
    log "Killing program"
    `pkill -f "$1"`
    sleep 1
    to_kill="[${1::1}]${1:1}"
    log "Checking if $to_kill really quit."
    ps=$(ps aux |grep "$to_kill")
    log "ps => $ps"
    if [ -z "$ps" ]; then
        log "Program Exited successfully."
    else
        log "Program did not exit!"
    fi
}

wifi_name=$(networksetup -getairportnetwork en0 |awk -F": " '{print $2}')
log "Wifi name: $wifi_name"
if [ "$wifi_name" = "<wifiname>" ]; then
    log "On corporate network... Killing Program"
    kill_program "<program>"
elif [ "$wifi_name" = "<wifiname>" ]; then
    log "Not on corporate network... Killing Program"
    kill_program "<program>"
else
    log "No known Network..."
fi
