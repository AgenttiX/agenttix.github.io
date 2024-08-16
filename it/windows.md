---
layout: default
title: Windows
---

# Windows

## Installing Windows
### Preparation
- Update BIOS/UEFI and firmware before the installation as much as you practically can.
  - This is especially important with old computers, as important features such as proper UEFI support may be added as a
    UEFI/BIOS update.
- Download the ISO image from Microsoft:
  [Windows 10](https://www.microsoft.com/fi-fi/software-download/windows10ISO),
  [Windows 11](https://www.microsoft.com/software-download/windows11)
  - I recommend downloading the en-US image, as googling error codes is much easier in English compared to e.g. Finnish.
- Create the installation media with [Rufus](https://rufus.ie/).
  - Rufus will format the entire USB stick, so move any important data elsewhere before using Rufus.
  - Set the partitioning to GPT/UEFI (non-CSM) unless you have a very old computer that does not have UEFI.
  - If asked to customize Windows installation, remove all the checkboxes unless you know that you
    need to have them enabled. Especially the requirement for Secure Boot and TPM 2.0 should not be removed
    if your computer has them, as they are important security features!
- Disconnect other disks before starting the installation.
  - If other disks are connected, Windows can install the bootloader to the wrong disk, which will cause problems later.
- Boot your computer to the UEFI/BIOS setup menu.
  Depending on the model of your computer, you can do this by pressing F10, F2, Delete or Enter during early boot.
  If none of these keys seem to work, see the user manual of your motherboard or laptop.
  In the UEFI/BIOS setup menu, set these settings:
  - Set boot to UEFI only, without CSM (if possible)
  - Enable Secure Boot
    - You can disable it later if you want to.
      However, it's important to have Secure Boot enabled when installing an OS,
      as this ensures that the boot chain is compatible with Secure Boot.
  - Enable TPM and wipe it if you're not storing anything on it at the moment.
    Use a discrete TPM instead of firmware TPM if possible.
  - Enable virtualization (VT-x, AMD-V etc.) including the additional features (IOMMU, SR-IOV, VT-d etc.),
    as those are required for various security features of Windows.

### Installation
- Select manual/custom partitioning when asked.
  Preferably delete all existing partitions and select the unallocated as the installation target.
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

### After installation
- If you're not going to install any other virtualization software than Hyper-V, enable
  [memory integrity](https://support.microsoft.com/en-us/windows/core-isolation-e30ed737-17d8-42f3-a2a9-87521df09b78)
  before installing any additional device drivers, as those may prevent you from enabling it later.
- Join the computer to a domain (if needed and not already joined).
  - Move the computer to the correct AD Organizational Unit.
  - Run `gpupdate /force`
  - Reboot
- Create additional user accounts as needed
  - You can give individual domain users admin privileges to the local computer at
    `Control Panel -> User Accounts -> Give other users access to this computer -> Advanced -> Advanced -> Local users and groups -> Groups -> Administrators -> Add...`
- Install Windows Updates (including optional updates e.g. firmware, but not preview versions)
- Enable BitLocker
  - Any BIOS updates should be installed before this, as some computers don't allow BIOS updates when BitLocker is enabled.
- If you're willing to pay for antivirus software, install [F-Secure](https://www.f-secure.com/)
  - It's from Finland, so it's not subject to NSA surveillance like Norton and McAfee, and not from a rogue state like Kaspersky
- Install Microsoft Office: [Download](https://aka.ms/office-install) (if you have a license)
  - Always download the 64-bit version unless you have a specific reason to use the 32-bit version
- Install software with the [installer script](https://github.com/AgenttiX/windows-scripts)
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


## Installing software
Unlike Linux, Android and iOS, Windows does not have a single package manager or software store
where you could download most software.
The most comprehensive package manager for Windows is
[Chocolatey](https://chocolatey.org/),
and volunteers have created installers for most commonly used software.
Microsoft is also finally moving in the right direction, and has created their own package manager,
[winget](https://github.com/microsoft/winget-cli),
but its repositories are still rather limited.
Chocolatey has a GUI, but both of these are primarily intended to be command-line software,
and are therefore not as user-friendly as they could be.
Therefore, I have created
[my own installer script](https://github.com/AgenttiX/windows-scripts)
that has a GUI and can use both Chocolatey and winget to install software.

### Misc. notes and settings
These may be useful to do depending on your use case
- Give local admin access to the domain user or create a separate local admin account for them
- Install anti-virus software
- Configure OneDrive
- Increase Outlook cache size to speed up the search:
  `Outlook -> Account Settings -> Change... -> Download email for the past: All`


## Maintenance
Since Windows software is installed from so many sources,
manually maintaining Windows workstations is a pain.
To avoid this, I install most software using the aforementioned package managers Chocolatey and winget,
and have developed
[my own maintenance script](https://github.com/AgenttiX/windows-scripts)
to install all updates at once.
Another option would be to use enterprise management tools such as
[Microsoft Intune](https://learn.microsoft.com/en-us/mem/intune/fundamentals/what-is-intune)
or
[Puppet](https://puppet.com/).
