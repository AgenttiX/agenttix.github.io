---
layout: default
title: Linux
---

# Linux

## Distros

- [Ubuntu](https://ubuntu.com/)
  ([download](https://releases.ubuntu.com/))
- [Kubuntu](https://kubuntu.org/)
  ([download](https://cdimage.ubuntu.com/kubuntu/releases/))
- [Lubuntu](https://lubuntu.me/)
  ([download](https://cdimage.ubuntu.com/lubuntu/releases/))

### Utilities

- [Clonezilla](https://clonezilla.org/)
  ([download](https://clonezilla.org/downloads.php))

## Installing Linux
- Download the ISO file
  - Prefer BitTorrent downloads, as they are faster than direct HTTP downloads,
    and they also check that the file has not been corrupted during the download.
    (There is nothing wrong or illegal about BitTorrent itself, it's all about what you download.)
- Update BIOS/UEFI and firmware before the installation as much as you practically can.
  - This is especially important with old computers, as important features such as proper UEFI support may be added as a
    UEFI/BIOS update.
- Prepare the USB drive
  - If you have an old computer,
    [do not use a drive that is larger than 137 GB](https://www.ventoy.net/en/doc_legacy_limit.html).
  - Check that the drive is good using [f3](https://fight-flash-fraud.readthedocs.io/en/latest/).
  - Enable Secure Boot from the UEFI settings, especially if you're dual-booting Windows.
  - If you are installing a single Linux distribution, use
    [Rufus](https://rufus.ie/)
    to create the installation media.
    - Set the partitioning to GPT/UEFI (non-CSM) unless you have a very old computer that does not have UEFI.
- Boot the computer from the USB drive
- Install the OS
- Configure SSH
  - Add authorized keys to `~/.ssh/authorized_keys`
  - [Set up banner / MOTD](https://github.com/AgenttiX/linux-scripts/tree/master/security/banner)
  - Disable password login
    - Set `PasswordAuthentication no` in `/etc/ssh/sshd_config`
- Configure UFW firewall
  - Note that Proxmox hosts have their own firewall system in the web GUI
  - `sudo ufw allow ssh`
  - `sudo ufw allow <YOUR_SERIVCES>`
  - `sudo ufw enable`
- [Configure SNMP](https://github.com/AgenttiX/linux-scripts/tree/master/librenms)
  if using e.g. LibreNMS


## Terminal

### zsh
[Oh My Zsh](https://ohmyz.sh/)

### Useful commands and utilities
TODO

## Fixes for bugs I've encountered
### [Plasmashell using lots of CPU](https://www.reddit.com/r/kde/comments/tagio0/comment/icw4lft/)
``` bash
mv ~/.local/share/kactivitymanagerd ~/.local/share/kactivitymanagerd_old
```
