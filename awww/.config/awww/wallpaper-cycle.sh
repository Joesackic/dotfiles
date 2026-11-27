#!/usr/bin/env bash

WALLDIR="$HOME/Images/Wallpapers/"
STATE="$HOME/.cache/current_wallpaper"

mapfile -t WALLS < <(ls "$WALLDIR")
[ ! -f "$STATE" ] && echo 0 > "$STATE"

INDEX=$(<"$STATE")
WALLPAPER="${WALLS[$INDEX]}"

NEXT=$(( (INDEX + 1) % ${#WALLS[@]} ))
echo "$NEXT" > "$STATE"

awww img "$WALLDIR/$WALLPAPER" \
--transition-type grow \
--transition-duration 0.30 \
--transition-fps 60 

