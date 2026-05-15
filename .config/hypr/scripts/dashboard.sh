#!/bin/bash
CLASS="i4archdashboard"
APP="/usr/bin/i4archdashboard"

CURRENT_WS=$(hyprctl activeworkspace -j | jq -r '.id')
CLIENT=$(hyprctl clients -j | jq -r ".[] | select(.class == \"$CLASS\")")

if [ -n "$CLIENT" ]; then
    CLIENT_WS=$(echo "$CLIENT" | jq -r '.workspace.id')
    CLIENT_ADDR=$(echo "$CLIENT" | jq -r '.address')

    if [ "$CLIENT_WS" -eq "$CURRENT_WS" ]; then
        hyprctl dispatch closewindow "address:$CLIENT_ADDR"
    else
        hyprctl dispatch movetoworkspace "$CURRENT_WS,address:$CLIENT_ADDR"
        hyprctl dispatch focuswindow "address:$CLIENT_ADDR"
    fi
else
    GTK_THEME=Adwaita "$APP" &
fi
