#!/bin/bash

# Hyprland Shortcuts Help Script
# Displays all keybindings as a notification

HELP_TEXT="KEYBINDINGS

LANZADORES:
  ALT+CTRL + B      Bluetooth
  ALT+CTRL + E      Gestor de archivos
  ALT+CTRL + T      Terminal
  ALT+CTRL + M      Thunderbird
  ALT+CTRL + Z      Zen Browser
  ALT+CTRL + Space  Lanzador apps

VENTANAS:
  ALT+CTRL + C      Cerrar
  ALT+CTRL + V      Toggle float
  ALT+CTRL + P      Pseudotile
  ALT+CTRL + L      Exit Hyprland

SISTEMA:
  ALT+CTRL + N      Notificaciones
  SUPER + L         Lock screen
  SUPER + W         Reload waybar

WORKSPACES:
  SUPER + 0-9       Ir a workspace
  SUPER+SHIFT+0-9   Mover ventana
  SUPER + Arrows    Focus
  SUPER + Scroll    Change workspace

RATÓN:
  SUPER + LMB       Move window
  SUPER + RMB       Resize window

PANTALLA:
  Print             Window screenshot
  Shift+Print       Region screenshot

MULTIMEDIA:
  Vol +/-/Mute, Brightness, Player"

# Send notification with notify-send
notify-send -u normal -t 10000 "$HELP_TEXT"
