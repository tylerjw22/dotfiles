#!/usr/bin/env bash

CHOICE=$(echo -e "Window\nRegion" | wofi -d -p "Screenshot type:")

case "$CHOICE" in
    Window)
         hyprshot -m window
         ;;
    Region)
    hyprshot -m region
         ;;
     *)
        exit 0
         ;;
esac
