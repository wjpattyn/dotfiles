#!/bin/bash

WIDGET_NAME="music-widget"

# Check if the widget is already open
if eww active-windows | grep $WIDGET_NAME > /dev/null; then
    eww close $WIDGET_NAME
else
    eww open $WIDGET_NAME --screen $(hyprctl activewindow -j | jq '.monitor')
fi