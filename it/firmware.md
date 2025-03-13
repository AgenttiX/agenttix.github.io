---
layout: default
title: Firmware
---

# Firmware
Keeping firmware up to date is necessary for proper security.
Unfortunately many manufacturers don't provide a proper way to automatically notify users of available firmware updates.
If you don't have a way to receive update notifications automatically,
you should check your manufacturer's website regularly.

## UEFI/BIOS settings
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
    - SHA256: enable
    - Clear before OS installation.
      If e.g. BitLocker is already enabled,
      you will need to use a recovery key after clearing the TPM to restore access to your data.
- Power save
  - Disable all unnecessary wake up sources, e.g. network, PCIe and Thunderbolt and enable "ErP" and "S5 maximum power savings",
    unless you want to boot up your computer by some other way than the power button.
  - [Active State Power Management (ASPM)](https://en.wikipedia.org/wiki/Active_State_Power_Management): enable/auto
  - Aggressive LPM (ALPM): enable
    - If you get blue screens, try disabling this.
- ACPI
  - PCI Advanced Error Reporting (AER): keep this at the default value at first.
    Once you have verified that your system works, enable it.
    If you get lots of (false positive) errors even when your computer is working fine, disable it.
- Thunderbolt
  - Security level: user authorization.
    This prevents DMA attacks from unauthorized devices.
- Resizable BAR: enable
  - This is important for GPU performance
- Virtualization
  - Virtualization / VT-x / AMD-V: enable
  - IOMMU / VT-d: enable
  - SR-IOV: enable
  - These features are highly useful for various security features of modern operating systems
- Boot
  - UEFI only (disable legacy/BIOS)
  - CSM: disable (unless you have old hardware that requires CSM)
  - Set your local SSD as the first boot device, and
    remove unused devices from the boot device list.
  - Set network boot to boot from the local disk.
  - These reduce the risk of evil maid attacks.
- SATA controller mode: AHCI
  - If you need RAID, software RAID is better than motherboard RAID.

## Updating UEFI/BIOS
In general, you should download the update from the manufacturer's website
and flash it either with the provided tool or directly from the UEFI/BIOS.
Flashing directly from the UEFI/BIOS or from a bootable USB is safer than flashing from the OS.

### HP enterprise workstations
- Download the update .exe from HP.
- Extract the .exe using 7-Zip.
- Format a USB flash drive with MBR + FAT32.
- Copy the .bin file to the root of the drive.
- Go to UEFI/BIOS and update from USB.


## Intel AMT & AMD PSP
[Hackaday article](https://hackaday.com/2017/12/11/what-you-need-to-know-about-the-intel-management-engine/)
[Dasharo](https://docs.dasharo.com/)
- [Modern hardware](https://www.phoronix.com/review/coreboot-adl-dream)
- [Reddit](https://www.reddit.com/r/hardware/comments/vpalik/a_dream_come_true_running_coreboot_on_a_modern/)

[me_cleaner](https://github.com/corna/me_cleaner)

## Intel AMT / ME settings
- Change the Management Engine (ME) password even if you don't plan to use the ME at all.
  [Not changing the default password is a security risk.](https://threatpost.com/intel-amt-loophole-allows-hackers-to-gain-control-of-some-pcs-in-under-a-minute/129408/)
- General settings
  - Power control
    - ME on in Host Sleep States: enable ME wake in S3, S4-5 if you want to be able to remotely start the computer even when it's turned off.
- Intel Standard Manageability Configuration
  - [Password policy](https://dl.dell.com/manuals/all-products/esuprt_laptop/esuprt_precision_mobile/precision-m4500_administrator%20guide_en-us.pdf):
    Default Password Only = Allow changing the ME password over the web interface only if the default password has not been changed.
- Network setup
  - Network Name Settings: Set your hostname and FQDN


## Sleep issues
Have you ever pulled your laptop from your backpack and found out that it's hot and the battery is drained?
This is the big issue with
[Windows Modern Standby (S0x)](https://learn.microsoft.com/en-us/windows-hardware/design/device-experiences/modern-standby).
The laptop should go to sleep when you close the lid,
but instead it may stay on and drain the battery overnight,
possibly causing a fire hazard if it's in a closed space such as a backpack.

If you encounter this issue on Windows, run the command `powercfg /a` to see the currently supported sleep states.
On Linux, run the command `cat /sys/power/mem_sleep`.
Check what it says about Standby (S3).
It can be either not supported, or disabled in favor of Modern Standby.

Reboot your computer to the BIOS settings
and check if there is a setting to enable S3 standby, and disable Modern Standby (aka. Windows sleep).
This setting can be called as Linux sleep, and you should enable it even if you're using Windows only.
Then reboot back to the OS (Windows or Linux).

If you didn't see an option to change the standby mode
and the command you previously ran did not show S3 as one of the supported sleep states, then you're out of luck.
If you were able to change the settings, run the command above again.
If it says that S3 sleep is supported, then you're good to go.
If it says that S3 sleep is one of the supported sleep options,
but Modern Standby is preferred, then you need to force the priority of S3 sleep over Modern Standby.
On Windows you can do this with a
[registry fix](https://www.makeuseof.com/windows-disable-modern-standby/).
On Linux you can do this by following the
[instructions on Arch Wiki](https://wiki.archlinux.org/title/Power_management/Suspend_and_hibernate#Changing_suspend_method).

For further debugging, run
[my reporting script](https://github.com/AgenttiX/windows-scripts) or directly the command `powercfg /sleepstudy`.
For a review of the issue, please see
[this Linus Tech Tips video](https://www.youtube.com/watch?v=OHKKcd3sx2c).


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

## Custom UEFI/BIOS versions
A modified UEFI/BIOS can solve various issues and
remove artificial limitations imposed by the device manufacturer.
However, be careful what you install,
UEFI/BIOS and other firmware have very deep access to your system.

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
