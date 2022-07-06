---
layout: default
title: Tips
---

# Misc tips
Here are some miscellaneous tips and links that I've found useful.

## Degree sign °
AltGr + Shift + 0

## Starting programs to the tray in Linux
### Discord
```
discord --start-minimized
```
[Source](https://www.reddit.com/r/linux/comments/dmx7yc/solved_linux_how_can_i_start_discord_on_login/)

### Mattermost
```
mattermost-desktop --hidden
```
[Source](https://forum.mattermost.com/t/solved-linux-mattermost-desktop-start-minimized-from-command-line/6321/4)

### Signal
```
signal-desktop --start-in-tray
```
[Source](https://www.reddit.com/r/signal/comments/i0m66t/signal_desktop_app_has_no_minimized_to_system/)

## BIOS/UEFI

### Lenovo battery DRM
Lenovo laptops have a DRM that prevents third-party batteries from charging.
- [Reddit thread](https://www.reddit.com/r/Lenovo/comments/dcnpzg/the_battery_installed_is_not_supported_by_this/)
- [Hackaday article](https://hackaday.com/2016/02/11/unlocking-thinkpad-batteries/)

### Lenovo XX30 series
[Custom BIOS](https://github.com/n4ru/1vyrain)
[Custom EC firmware](https://github.com/hamishcoleman/thinkpad-ec)

### Meltdown and Spectre patch for X58 motherboards
- [Techpowerup](https://www.techpowerup.com/forums/threads/meltdown-and-spectre-patched-bios-for-x58-motherboards.246101/)
- [Gigabyte UK](https://forum.giga-byte.co.uk/index.php?topic=22899.0)
- [Gigabyte US](https://forum.gigabyte.us/thread/4901/spectre-patched-bios-gigabyte-motherboards)

Tested to work on GA-X58A-UD7.
