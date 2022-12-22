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
- TODO

## Terminal

### zsh
[Oh My Zsh](https://ohmyz.sh/)

### Useful commands and utilities
TODO

