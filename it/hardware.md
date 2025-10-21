---
layout: default
title: Hardware
---

# Hardware

## Setting up a new computer
- Start downloading the installer(s) for the operating system(s) you're going to install, as the download can take a while.
- Unbox the parts.
  - Take a video of the unboxing so that you have proof if anything is missing.
- Take pictures of the serial numbers for later warranty registration.
  - Also take a picture of the PSID (Physical Security ID) codes of the SSDs in the case you need to reset them later.
- Build the computer.
  - If the computer is pre-built, remove supportive covers from within the computer.
- Update UEFI/BIOS and firmware as much as you can before installing the operating system.
- Reset the UEFI/BIOS default settings template to factory defaults.
  - In other words, ensure that applying default settings actually applies the factory defaults and not a
    previously set custom configuration.
  - This is "Default Setup" in HP UEFI/BIOS.
- Reset UEFI/BIOS to default settings.
  - Reset the TPM.
  - Reset the Secure Boot keys.
- Set the UEFI/BIOS settings.
  - Protect the UEFI/BIOS settings with a password.
    Store it in a safe place, as resetting a forgotten UEFI/BIOS password can be difficult.
  - Do not overclock yet.
- Run a RAM test such as [Memtest86+](https://www.memtest.org/).
- Boot the computer from a Linux USB drive, e.g. Ubuntu
  - If the NVMe SSDs have been used before, wipe them using
    [`nvme sanitize`](https://wiki.archlinux.org/title/Solid_state_drive/Memory_cell_clearing#NVMe_drive).
  - On modern systems, configure HDDs and NVMe SSDs to use 4K LBA.
    This is known as [Advanced Format](https://en.wikipedia.org/wiki/Advanced_Format)
    and is supported on Windows 8 ->, Windows Server 2012 -> and Linux 2.6.31 ->.
    (As a matter of personal opinion, I'd do this for PCIe 4.0 NVMe SSDs and newer.)
    [It should provide a performance boost](https://unix.stackexchange.com/questions/761398/are-there-any-benefits-in-setting-a-hdds-logical-sector-size-to-4kn), but
    [on some older SSDs it can result in a performance drop instead](https://forums.sandisk.com/t/sn550-why-it-uses-512b-sector-instead-of-4096/265472/3).
    - For HDDs, you can use [`hdparm`](https://wiki.archlinux.org/title/Advanced_Format#Advanced_Format_hard_disk_drives).
    - For NVMe SSDs, you can use [`nvme format`](https://wiki.archlinux.org/title/Advanced_Format#NVMe_solid_state_drives).
  - Run SMART tests on the SSDs and [badblocks](https://wiki.archlinux.org/title/badblocks) on the HDDs.
- [Install Windows](./windows.md) (if needed).
- [Install Linux](./linux.md) (if needed).
- Update UEFI/BIOS and firmware (if not already updated).
- Configure Intel ME (or other manufacturer-provided management tool).
  - Unconfigure ME to reset it to its default settings.
  - Set a password even if you're not going to use ME.
    [Not changing the default password is a security risk.](https://threatpost.com/intel-amt-loophole-allows-hackers-to-gain-control-of-some-pcs-in-under-a-minute/129408/)
    - Disable remote access to the ME console if you're not going to use it.
- Run stress testing such as
  [Prime95](https://www.mersenne.org/download/) and
  [Furmark](https://geeks3d.com/furmark/).
- Install software e.g. by using my [installer script](https://github.com/AgenttiX/windows-scripts).
- Register the warranties.
- Set up automated backups.
- Use the computer for a few days or weeks to see that it's stable.
- Overclock (if you want to).


## Personal / familiar IT hardware
[Geekbench results](https://browser.geekbench.com/user/AgenttiX)


### [ASUS Zenith II Extreme](https://rog.asus.com/motherboards/rog-zenith/rog-zenith-ii-extreme-model/)
#### USB ports

| Ports           | PCIe bus                    | IOMMU group | Name                                      |
| --------------- | --------------------------- | ----------- | ----------------------------------------- |
| SP_USB10        |                             |             | Chipset -> USB 2.0 header (dual device)   |
| USB_E910        |                             |             | Chipset -> USB 2.0 header (single device) |
| USB32G1_1,2,3,4 | 0000:49:00.3                | 55          |                                           |
| U32G1_E56       |                             |             | Chipset -> header                         |
| U32G1_E78       |                             |             | Chipset -> header                         |
| USB32G2_1,2     | 0000:05:00.3                | 18          | CPU -> back                               |
| USB32G2_3,4     | 0000:24:00.3                | 35          | CPU -> back                               |
| USB32G2_5       | 0000:49:00.3                | 55          | Chipset -> header                         |
| USB32G2_6       |                             |             | Chipset -> header                         |
| USB32G2_7,9     | 0000:42:08.0                | 55          | Chipset -> back                           |
| U32G2_C8        | 0000:49:00.1                | 55          | Chipset -> back                           |
| U32G2X2_EC1     | 0000:22:00.0 / 0000:49:00.3 | 31 / 55     | CPU -> back                               |

The USB controllers are in the IOMMU groups 18, 31, 35 and 55.
This table does not yet include the front panel and USB-c ports.
A good way to find out the values above is to connect a device and run `sudo lshw -html > lshw.html`.


### [Lenovo ThinkStation P330 Tiny](https://www.lenovo.com/fi/fi/p/workstations/thinkstationp/thinkstation-p330-tiny/33ts3tp330x)
- Thunderbolt
  - [Motherboard hearders](https://www.reddit.com/r/AskElectronics/comments/1i0w0ec/can_you_help_me_identify_these_ports_on_a_lenovo/)
- Boot keys
  - F1: BIOS/UEFI settings
  - F10: Hardware diagnostics
  - F12: Boot selection
  - Ctrl+P: Intel ME
  - Alt+P: Power on by keyboard
- Installation process
  - Update the BIOS from a USB drive
  - (Take a note of the MAC address in the BIOS)
  - Reset BIOS settings
    - Load optimized defaults
    - Reboot
  - Reset the firmware TPM
    - Reboot
  - Reset discrete TPM
    - Reboot
  - Reset Intel SGX
    - Advanced -> SGX -> Change owner EPOCH
  - Reset Secure Boot
  - Reset Intel ME
    - Advanced -> Intel Manageability
    - Reboot
  - BIOS/UEFI settings to change from the defaults
    - Advanced -> CPU Setup -> TxT: Enable
    - Advanced -> Intel Manageability -> Intel Manageability Control: Disabled
    - Security
      - Set Administrator Password
      - Allow Flashing BIOS to a Previous Version: No
      - Require Admin. Pass. for F12 Boot: Yes
      - Chassis Intrusion Detection: Yes
      - Configuration Change Detection: Yes
      - Hard Disk Password (if supported by your SSD)
        - M.2 Drive 1 Password: User
        - Reboot
  - Wipe the SSD
    - Security Erase HDD Data -> Erase M.2 Drive 1 Data
    - (This requires the HDD password to be set, and this will disable the password.)
  - Install Windows (or Linux)
  - (Disable automatic sleep)
  - Join to the domain
    - Move the computer to the correct OU
    - Reboot
  - Enable BitLocker
  - Windows Update
  - Install the scripts
  - Reboot
  - Update Intel ME
  - Update SIO firmware
  - Install default software
  - Run the maintenance script
