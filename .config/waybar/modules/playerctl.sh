#! /bin/bash

if [[ "$(playerctl status)" == "Playing" ]]; then
    echo "Playing: $(playerctl metadata title)"
fi
