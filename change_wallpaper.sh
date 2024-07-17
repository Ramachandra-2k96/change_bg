#!/bin/bash

# Path to the folder containing background images
BG_FOLDER="/home/ramachandra/Downloads/wall_paper_kali_purpole"

# Log file for debugging
LOG_FILE="/home/ramachandra/change_background.log"

# Function to set a random background using gsettings
set_random_bg() {
    local files=("$BG_FOLDER"/*)
    local random_file="${files[RANDOM % ${#files[@]}]}"
    echo "$(date): Setting background to $random_file" >> "$LOG_FILE"
    if gsettings set org.gnome.desktop.background picture-uri "file://$random_file"; then
        echo "$(date): Successfully set background for default mode to $random_file" >> "$LOG_FILE"
    else
        echo "$(date): Failed to set background for default mode" >> "$LOG_FILE"
    fi
    if gsettings set org.gnome.desktop.background picture-uri-dark "file://$random_file"; then
        echo "$(date): Successfully set background for dark mode to $random_file" >> "$LOG_FILE"
    else
        echo "$(date): Failed to set background for dark mode" >> "$LOG_FILE"
    fi
}

# Initial background change
set_random_bg

# Loop to change the background every 5 minutes (300 seconds)
while true; do
    sleep 300
    set_random_bg
done
