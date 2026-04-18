#!/bin/bash
player_status=$(playerctl status 2>/dev/null)

if [ "$player_status" = "Playing" ]; then
    echo "{\"text\": \"[   ⏸ | $(playerctl metadata --format '{{artist}} ]')\", \"class\": \"playing\"}"
elif [ "$player_status" = "Paused" ]; then
    echo "{\"text\": \"[   ▶ | $(playerctl metadata --format '{{artist}} ]')\", \"class\": \"paused\"}"
else
    echo "{\"text\": \"[   ▶ | Not playing ]\", \"class\": \"stopped\"}"
fi
        # "format": "  {status_icon} | {dynamic}",
        # "format-disconnected": "  ▶ | No players",
        # "interval": 1,
        # "dynamic-len": 40,
        # "status-icons": {
        #     "playing": "⏸",
        #     "paused": "▶",
        #     "stopped": ""
        # },
        # "dynamic-order": ["artist", "title"]
