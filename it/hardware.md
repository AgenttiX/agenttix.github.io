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
- Update UEFI/BIOS and firmware as much as you can before installing the operating system.
- Set the UEFI/BIOS settings.
  - Do not overclock yet.
- Run a RAM test such as [Memtest86+](https://www.memtest.org/).
- Boot the computer from a Linux USB drive and run SMART tests on the SSDs and [badblocks](https://wiki.archlinux.org/title/badblocks) on the HDDs.
- [Install Windows](./windows.md) (if needed).
- [Install Linux](./linux.md) (if needed).
- Update UEFI/BIOS and firmware (if not already updated).
- Join the machine to a domain (if needed).
- Enable BitLocker
- Run stress testing such as
  [Prime95](https://www.mersenne.org/download/) and
  [Furmark](https://geeks3d.com/furmark/).
- Install software e.g. by using my [installer script](https://github.com/AgenttiX/windows-scripts).
- Register the warranties.
- Set up automated backups.
- Use the computer for a few days or weeks to see that it's stable.
- Overclock (if you want to).

