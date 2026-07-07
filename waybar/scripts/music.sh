#!/bin/bash

status=$(playerctl status 2>/dev/null)
title=$(playerctl metadata title 2>/dev/null)

if [ "$status" = "Playing" ]; then
    echo "💿 $title "
elif [ "$status" = "Paused" ]; then
    echo "💿 $title "
fi
