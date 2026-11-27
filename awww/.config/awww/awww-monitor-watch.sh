#!/usr/bin/env bash

AWWW_SCRIPT="$HOME/.config/awww/awww.sh"

# Apply once when Hyprland starts
"$AWWW_SCRIPT"

# Re-apply when monitors are added/removed
socat -U - "UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock" |
while read -r line; do
    case "$line" in
        monitoradded*|monitoraddedv2*|monitorremoved*|monitorremovedv2*)
            sleep 0.5
            "$AWWW_SCRIPT"
            ;;
    esac
done
