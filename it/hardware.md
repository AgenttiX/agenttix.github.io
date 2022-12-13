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
- Boot the computer from a Linux USB drive and run SMART tests on the SSDs and [badblocks](https://wiki.archlinux.org/title/badblocks) on the HDDs.
- [Install Windows](./windows.md) (if needed).
- [Install Linux](./linux.md) (if needed).
- Update UEFI/BIOS and firmware (if not already updated).
- Configure Intel ME (or other manufacturer-provided management tool).
  - Unconfigure ME to reset it to its default settings.
  - Set a password even if you're not going to use ME.
    [Not changing the default password is a security risk.](https://threatpost.com/intel-amt-loophole-allows-hackers-to-gain-control-of-some-pcs-in-under-a-minute/129408/)
    - Disable remote access to the ME console if you're not going to use it.
- Join the computer to a domain (if needed and not already joined).
  - Move the computer to the correct AD Organizational Unit.
  - Run `gpupdate /force`.
  - Reboot.
- Enable BitLocker.
- Install Windows Updates.
- Run stress testing such as
  [Prime95](https://www.mersenne.org/download/) and
  [Furmark](https://geeks3d.com/furmark/).
- Install software e.g. by using my [installer script](https://github.com/AgenttiX/windows-scripts).
- Register the warranties.
- Set up automated backups.
- Use the computer for a few days or weeks to see that it's stable.
- Overclock (if you want to).
