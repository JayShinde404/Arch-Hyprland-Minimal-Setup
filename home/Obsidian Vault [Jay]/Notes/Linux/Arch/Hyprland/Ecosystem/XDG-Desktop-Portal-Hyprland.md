Tags: [[Hyprland Ecosystem]]

XDG file system structure support direct for hyprland.

In hyprland, to initialize, include this in hyprland config:
```
# XDG Base Directories
env = XDG_CONFIG_HOME,$HOME/.config
env = XDG_DATA_HOME,$HOME/.local/share
env = XDG_STATE_HOME,$HOME/.local/state
env = XDG_CACHE_HOME,$HOME/.cache


# Wayland Session
env = XDG_SESSION_TYPE,wayland
env = XDG_CURRENT_DESKTOP,Hyprland
env = XDG_SESSION_DESKTOP,Hyprland
```