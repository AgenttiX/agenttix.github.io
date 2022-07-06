---
layout: default
title: Checklists
---

# Checklists / notes

## Windows installation
- Update BIOS/UEFI and firmware before the installation as much as you practically can
- Download the ISO image from Microsoft:
  [Windows 10](https://www.microsoft.com/fi-fi/software-download/windows10ISO),
  [Windows 11](https://www.microsoft.com/software-download/windows11)
  - I recommend downloading the en-US image, as googling error codes is much easier in English compared to e.g. Finnish.
- Create the installation media with [Rufus](https://rufus.ie/)
  - Set the partitioning to GPT/UEFI (non-CSM) unless you have a very old computer that does not have UEFI
- Disconnect other disks before starting the installation
  - If other disks are connected, Windows can install the bootloader to the wrong disk, which will cause problems later.
- Set BIOS/UEFI settings
  - Set boot to UEFI only, without CSM (if possible)
  - Enable TPM and wipe it if you're not storing anything on it at the moment. Use a discrete TPM instead of firmware TPM if possible.
  - Enable virtualization (VT-x, AMD-V etc.) including the additional features (VT-d etc.), as those are required for various security features of Windows.
- When asked to log in with a Microsoft account, disconnect the computer from the Internet
  - Wired connection: disconnect cable
  - Wi-Fi: use a physical button (if available) or press Shift+F10 and write `netsh wlan disconnect`
- Create a local account with your first name (first character capitalized)
  - Any spaces or special characters except - and _, but including spaces, ä, ö etc., may cause problems later, especially with old software.
- When asked about privacy options, select no for each question about sending data to Microsoft
- Once the setup is ready, you can join the account to your Microsoft account if you want
  - Use the settings app to do the join. Don't do the first join using some other app such as Office or Edge,
    as the login may not apply properly for login & BitLocker recovery configuration etc.
  - When enabling OneDrive, disable the backup unless you have bought additional storage (e.g. as a part of Office 365).
    Otherwise you will get constant prompts to buy more OneDrive storage once your home folder exceeds the free plan (5 GB).
- If you're not going to install any other virtualization software than Hyper-V, enable
  [memory integrity](https://support.microsoft.com/en-us/windows/core-isolation-e30ed737-17d8-42f3-a2a9-87521df09b78)
  before installing any additional device drivers, as those may prevent you from enabling it later.
- Disable Bluetooth from the taskbar menu unless you need it at the moment, as Bluetooth is a huge attack surface
- Set Windows settings
  - System
    - Display: monitor setup, refresh rates, night light, HDR
    - About -> Rename this PC: set a name you can recognize the computer with
    - About -> BitLocker: If Windows is your only operating system, enable BitLocker.
      If you're also going to use Linux, keep BitLocker disabled to ensure access to your Windows files from Linux.
  - Bluetooth & devices
    - AutoPlay: disable
  - Privacy & Security
    - Enable the features you want, e.g. location & find my device
    - Diagnostic & feedback -> View diagnostic data -> Turn on the diagnostic data viewer
  - Windows Update
    - Advanced options -> Receive updates for other Microsoft products: enable
    - Delivery optimization -> Allow downloads from other PCs: on, Devices on the internet and my local network
- Install Windows Updates (including optional updates e.g. firmware, but not preview versions)
- If you're willing to pay for antivirus software, install [F-Secure](https://www.f-secure.com/)
  - It's from Finland, so it's not subject to NSA surveillance like Norton and McAfee, and not from a rogue state like Kaspersky
- Install software with the [installer script](https://github.com/AgenttiX/windows-scripts)
