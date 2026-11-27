#!/usr/bin/env bash
#start awww
WALLPAPERS_DIR=~/Images/Wallpapers
WALLPAPER=$(find "$WALLPAPERS_DIR" -type f | shuf -n 1)
awww img "$WALLPAPER"
