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


## Intel AMT & AMD PSP
[Hackaday article](https://hackaday.com/2017/12/11/what-you-need-to-know-about-the-intel-management-engine/)
[Dasharo](https://docs.dasharo.com/)
- [Modern hardware](https://www.phoronix.com/review/coreboot-adl-dream)
- [Reddit](https://www.reddit.com/r/hardware/comments/vpalik/a_dream_come_true_running_coreboot_on_a_modern/)

[me_cleaner](https://github.com/corna/me_cleaner)

## Laptop CPU throttling
On many laptops, and especially ThinkPad T480,
the motherboard firmware artificially throttles the CPU unless the firmware can communicate to a driver in the OS.
This leads to degraded performance on Linux, where the manufacturer-provided driver is not available.
This throttling can be overwritten with
[throttled](https://github.com/erpalma/throttled).
However, it requires access to MSR ad PCI BAR,
which are restricted when Kernel Lockdown is enabled.
Kernel Lockdown is enabled automatically when Secure Boot is enabled,
and to the best of my knowledge there is no way to disable Kernel Lockdown
without disabling some step of the Secure Boot chain.
There are two options:
1) Run `sudo mokutil --disable-validation`, reboot,
  select "Change Secure Boot state" and give the characters of your password.
2) Disable Secure Boot

I prefer the former,
as it somewhat prevents an attacker from booting the computer from a USB drive with a custom kernel.

Throttled also supports undervolting, which is a great way to get even more performance out of a laptop.

## Custom BIOS/UEFI versions
A modified BIOS/UEFI can solve various issues and
remove artificial limitations imposed by the device manufacturer.
However, be careful what you install,
BIOS/UEFI and other firmware have very deep access to your system.

### Lenovo battery DRM
Lenovo laptops have a DRM that prevents third-party batteries from charging.
- [Reddit thread](https://www.reddit.com/r/Lenovo/comments/dcnpzg/the_battery_installed_is_not_supported_by_this/)
- [Hackaday article](https://hackaday.com/2016/02/11/unlocking-thinkpad-batteries/)

### Lenovo WLAN/WWAN DRM
- [G510](https://medium.com/@p0358/removing-wlan-wwan-bios-whitelist-on-a-lenovo-laptop-to-use-a-custom-wi-fi-card-f6033a5a5e5a)
- [X1 Carbon](https://www.reddit.com/r/thinkpad/comments/8813ub/x1_carbon_whitelist/?utm_source=share&utm_medium=web2x&context=3)

### Lenovo XX30 series
- [Custom BIOS](https://github.com/n4ru/1vyrain)
- [Custom EC firmware](https://github.com/hamishcoleman/thinkpad-ec)

### Meltdown and Spectre patch for X58 motherboards
- [Techpowerup](https://www.techpowerup.com/forums/threads/meltdown-and-spectre-patched-bios-for-x58-motherboards.246101/)
- [Gigabyte UK](https://forum.giga-byte.co.uk/index.php?topic=22899.0)
- [Gigabyte US](https://forum.gigabyte.us/thread/4901/spectre-patched-bios-gigabyte-motherboards)

Tested to work on GA-X58A-UD7.
