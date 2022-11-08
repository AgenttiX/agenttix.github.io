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

## Networking
### SMB shares on Linux
Create the mount point:
```
sudo mkdir /mnt/share-path
```
Create the credentials file:
```
sudo mdkdir /root/smb
sudo nano /root/smb/credential-filename
```
Fill in the credentials:
```
user=your-username
password=your-password
domain=your.domain.name
```
Run `sudo nano /etc/fstab` and add a line in the end for the mount config:
```
//server-ip-or-hostname/share-name /mnt/share-path cifs credentials=/root/smb/credential-filename,uid=your-local-username,vers=3.1.1,seal,noexec,noauto 0 0
```
The parameters are:
- uid: the local user that will access the mounted share as the user specified in the credentials file
- vers: SMB version. Use the highest whenever possible.
- seal: encrypt the connection
- noexec: don't allow execution of programs on the network drive for security
- noauto: don't mount the share automatically (remove this to mount automatically)

Then you can mount with
```
sudo mount /mnt/share-path
```

## BIOS/UEFI

