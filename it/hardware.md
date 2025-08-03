---
layout: default
title: Hardware
---

# Hardware

## Setting up a new computer
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
  - If the NVMe SSD has been used before, wipe it using
    [`nvme sanitize`](https://wiki.archlinux.org/title/Solid_state_drive/Memory_cell_clearing#NVMe_drive)
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

## Personal IT hardware
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
