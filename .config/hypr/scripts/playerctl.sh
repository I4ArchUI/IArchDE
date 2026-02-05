#!/bin/bash

arg=$1

status=$(playerctl status)

if [ "$status" == "Playing" ]; then
    if [ "$arg" == "title" ]; then
        title=$(playerctl metadata title)
        max_length=40
        if [ ${#title} -gt $max_length ]; then
            title=$(echo "$title" | cut -c1-37)"..."
        fi
        echo "$title"

    elif [ "$arg" == "artist" ]; then
        artist=$(playerctl metadata artist)
        max_length=40
        if [ ${#artist} -gt $max_length ]; then
            artist=$(echo "$artist" | cut -c1-37)"..."
        fi
        echo "$artist"
    
    elif [ "$arg" == "artUrl" ]; then
        url=$(playerctl metadata mpris:artUrl)
        if [[ "$url" == file://* ]]; then
            url="${url#file://}"
        fi

        echo "$url"
    fi
fi
