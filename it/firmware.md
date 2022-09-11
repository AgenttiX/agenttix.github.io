---
layout: default
title: Firmware
---

# Firmware

Keeping firmware up to date is necessary for proper security.
Unfortunately many manufacturers don't provide a proper way to automatically notify users of available firmware updates.
If you don't have a way to receive update notifications automatically,
you should check your manufacturer's website regularly.

## BIOS/UEFI settings
The order and naming of these settings may vary depending on the model of your motherboard.

- CPU
  - Hyper-Threading / multi-threading: enable
- Security
  - Memory protection / execution prevention / execute disable bit: enable
  - Password
    - On laptops, set different passwords for boot and BIOS settings.
      On desktops, setting a password for the BIOS settings only may be sufficient.
    - If your laptop supports setting a hard disk password,
      consider using it in addition to BitLocker or LUKS,
      as this password can encrypt the boot partition as well.
      However, a hard disk password is not a replacement for BitLocker or LUKS,
      as many of the implementations are broken.
    - These reduce the risk of evil maid attacks.
  - Secure Boot
    - Enable, unless you are booting a Linux distribution that does not support Secure Boot.
      This is mandatory for Windows 11 and reduces the risks of rootkits and evil maid attacks.
  - Tamper detection
    - Enable, as this reduces the risk of evil maid attacks.
  - TPM / security chip
    - Enable. This is mandatory for Windows 11.
    - Clear before OS installation.
      If e.g. BitLocker is already enabled,
      you will need to use a recovery key after clearing the TPM to restore access to your data.
- Power save
  - Disable all unnecessary wake up sources, e.g. network, PCIe and Thunderbolt,
    unless you want to boot up your computer by some other way than the power button.
- Thunderbolt
  - Security level: user authorization.
    This prevents DMA attacks from unauthorized devices.
- Virtualization
  - Virtualization / VT-x / AMD-V: enable
  - IOMMU / VT-d / SR-IOV: enable
  - These features are highly useful for various security features of modern operating systems
- Boot
  - Set your local SSD as the first boot device, and
    remove unused devices from the boot device list.
  - Set network boot to boot from the local disk.
  - These reduce the risk of evil maid attacks.
