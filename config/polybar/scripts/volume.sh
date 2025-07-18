#!/bin/bash
volume=$(pamixer --get-volume)
mute=$(pamixer --get-mute)

if [ "$mute" = "true" ]; then
    echo "Vol 🔇"
else
    echo "Vol ${volume}%"
fi
