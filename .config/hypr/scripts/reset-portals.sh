#!/usr/bin/env bash
# Cleanly restart PipeWire, WirePlumber, and Hyprland portal backends
sleep 1

# Restart audio/video pipelines to drop stale frame buffers
systemctl --user restart pipewire pipewire-pulse wireplumber 2>/dev/null || true

# Kill any rogue/conflicting desktop portal backends
killall -q xdg-desktop-portal-hyprland
killall -q xdg-desktop-portal-gnome
killall -q xdg-desktop-portal-kde
killall -q xdg-desktop-portal-lxqt
killall -q xdg-desktop-portal-wlr
killall -q xdg-desktop-portal-gtk
killall -q xdg-desktop-portal
sleep 1

# Launch Hyprland portal backend first
if [ -f /usr/lib/xdg-desktop-portal-hyprland ]; then
    /usr/lib/xdg-desktop-portal-hyprland &
elif [ -f /usr/libexec/xdg-desktop-portal-hyprland ]; then
    /usr/libexec/xdg-desktop-portal-hyprland &
fi

sleep 2

# Launch main XDG Desktop portal
if [ -f /usr/lib/xdg-desktop-portal ]; then
    /usr/lib/xdg-desktop-portal &
elif [ -f /usr/libexec/xdg-desktop-portal ]; then
    /usr/libexec/xdg-desktop-portal &
fi
