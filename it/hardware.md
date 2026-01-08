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
    and is supported on Windows 8 &rarr;, Windows Server 2012 &rarr; and Linux 2.6.31 &rarr;.
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


## Selling a computer
- Take screenshots and pictures of the specifications and hardware
- Reset firmware
  - BIOS settings
  - TPM
  - Custom Secure Boot keys
  - Intel ME (if configurable)
- Wipe storage devices
  - You can use [my scripts](https://github.com/AgenttiX/linux-scripts/tree/master/security) for this.
  - If my scripts don't work and the computer is a laptop,
    I recommend using manufacturer-provided software.
  - If the computer is a desktop or no manufacturer-provided software is available,
    you can use [DBAN](https://dban.org/) or boot the computer from a Linux USB drive and use `badblocks` to wipe the storage devices.


## Personal / familiar IT hardware
[Geekbench results](https://browser.geekbench.com/user/AgenttiX)


### agx-z2e (my desktop computer)
- Motherboard: [ASUS Zenith II Extreme](https://rog.asus.com/motherboards/rog-zenith/rog-zenith-ii-extreme-model/)
  - Asus TPM-M R2.0 (90MC03W0-M0XBN1)
- CPU: [AMD Ryzen Threadripper 3970X (100-100000011WOF)](https://en.wikipedia.org/wiki/Zen_2#3000_series_(Matisse))
- RAM: 8x 16 GB = 128 GB [Kingston 2666 MHz ECC (KSM26ED8/16ME)](https://www.kingston.com/datasheets/KSM26ED8_16ME.pdf)
- GPU
  - Nvidia RTX 3070
  - [PowerColor Radeon VII (AXVII-16GBHBM2-3DH)](https://www.techpowerup.com/gpu-specs/powercolor-radeon-vii.b6665)
    - For ROCm and virtual machines
  - Nvidia GTX Titan
    - For virtual machines
- PSU: [Corsair 1600W AX1600i (CP-9020087-EU)](https://www.corsair.com/ww/en/p/psu/cp-9020087-eu/ax1600i-digital-atx-power-supply-1600-watt-fully-modular-psu-eu-cp-9020087-eu)
- Case: [Phanteks Enthoo 719 Tempered Glass (PH-ES719LTG-DBK01)](https://phanteks.com/product/enthoo-719/)
- Water cooling
  - Pumps
    - [EK-Waterblocks EK-Quantum Kinetic TBE 300 D5 PWM D-RGB pump + reservoir](https://www.ekwb.com/shop/ek-quantum-kinetic-tbe-300-d5-pwm-d-rgb-plexi) (3831109818480)
      - PWM duty cycle: 20 - 100 %
    - [EK-Waterblocks EK-XTOP Revo D5 RGB PWM pump](https://www.ekwb.com/shop/ek-xtop-revo-d5-pwm-plexi-incl-pump) (3830046995704)
      - PWM duty cycle: 20 - 100 %
    - [EK-Waterblocks EK-UNI Pump Bracket (120) (3830046997982)](https://www.ekwb.com/shop/ek-uni-pump-bracket-120mm-fan)
    - [EK-Waterblocks EK-UNI Pump Bracket (120) Vertical (3830046997999)](https://www.ekwb.com/shop/ek-uni-pump-bracket-120mm-fan-vertical)
  - Fans
    - 14x [Corsair ML120 PRO RGB fans](https://www.corsair.com/us/en/p/case-fans/co-9050076-ww/ml120-pro-rgb-led-120mm-pwm-premium-magnetic-levitation-fan-3-fan-pack-with-lighting-node-pro-co-9050076-ww) (3-pack: CO-9050076-WW)
      - 400 - 1600 RPM PWM
    - 1x [Corsair ML140 PRO RGB fan](https://www.corsair.com/us/en/p/case-fans/co-9050077-ww/ml140-pro-rgb-led-140mm-pwm-premium-magnetic-levitation-fan-single-pack-co-9050077-ww) (CO-9050077-WW)
      - 400 - 1200 RPM PWM
  - Radiators
    - 2x [Alphacool NexXxoS ST30 Full Copper 480mm V.2 (AT1015508)](https://shop.alphacool.com/en/shop/radiators/480mm/rad-alphacool-nexxxos-st30-full-copper-480mm-radiator-v.2-pht-eol)
    - 2x [Alphacool NexXxoS ST30 Full Copper 360mm V.2 (AT1015507)](https://shop.alphacool.com/en/shop/radiators/360mm/rad-alphacool-nexxxos-st30-full-copper-360mm-radiator-v.2-pht-eol)
  - CPU block: [EK-Waterblocks EK-Quantum Momentum ROG Zenith II Extreme D-RGB (3831109823965)](https://www.ekwb.com/shop/ek-quantum-momentum-rog-zenith-ii-extreme-d-rgb-plexi)
  - RAM cooling
    - 4x2 [Alphacool D-RAM watercooling module (AT1011209)](https://shop.alphacool.com/en/shop/ram-cooler/17268-alphacool-d-ram-module-for-alphacool-d-ram-cooler-black-2-pieces)
    - 2x [Alphacool Aurora Plexi X4 waterblock (AT1017316)](https://shop.alphacool.com/en/shop/ram-cooler/war-alphacool-aurora-acryl-x4-d-ram-water-cooler)
  - GPU blocks
    - Radeon VII
      - [EK-Waterblocks EK-Vector Radeon VII RGB - Nickel + Plexi waterblock (3831109816158)](https://www.ekwb.com/shop/ek-quantum-vector-radeon-vii-rgb-nickel-plexi)
      - EK-Waterblocks EK-Vector Radeon VII Backplate (3831109816721)
    - Nvidia GTX Titan
      - Some random waterblock from Tori.fi


#### Issues
- [BIOS 1603 is buggy and 1502 is more stable](https://rog-forum.asus.com/t5/zenith-extreme-x399-e/zenith-ii-extreme-alpha-instability-and-restarts-with-bios-1603/m-p/895749/highlight/true#M4540)


##### Xid 79 / ACPI 15 GPU crash
This is a common issue on TRX40 motherboards.
Sometimes during uneven load, the computer crashes and the monitors go black.
This issue occurs on both Windows and Linux.
(For me, Subnautica is the game that most often triggers it.)
- Reports of the issue with TRX40 motherboards
  - [Reddit](https://www.reddit.com/r/AMDHelp/comments/w7dhoz/let_the_games_begin_the_infamous_acpi_15/)
  - [ASUS forums](https://rog-forum.asus.com/t5/zenith-extreme-x399-e/let-the-games-begin-the-infamous-acpi-15-application-popup-error/td-p/914022)
  - [Kernel.org Bugzilla](https://bugzilla.kernel.org/show_bug.cgi?id=215101)
  - [MSI forums](https://forum-en.msi.com/index.php?threads/msi-creator-trx40-error-56-acpi-15-crashes.345081/)
  - [Level1Techs forums](https://forum.level1techs.com/t/amd-threadripper-3970x-under-heavy-avx2-load-defective-design-no-but-there-is-an-issue/153883/100)
- Reports of the issue with TR4 motherboards
  - [ASUS forums](https://rog-forum.asus.com/t5/zenith-extreme-x399-e/freezing-computer-if-left-overnight/td-p/761900)
  - [Microsoft forums](https://learn.microsoft.com/en-us/answers/questions/4097298/windows-10-11-full-system-crash)
  - [Reddit](https://www.reddit.com/r/techsupport/comments/13pp771/amd_threadripper_mysterious_bsod_event_id_56_acp/)
  - [Reddit](https://www.reddit.com/r/techsupport/comments/18wsmvt/pc_crashes_amds_acpi_15_error/)
  - [ASRock forums](https://forum.asrock.com/forum_posts.asp?TID=8082&title=acpi-15-event-error-and-kernelpower-41-error)

On Kubuntu, `journalctl` reports these errors:
```
Xid (PCI:0000:01:00): 79, GPU has fallen off the bus.
GPU 0000:01:00.0: GPU has fallen off the bus.
krcRcAndNotifyAllChannels_IMPL: RC all channels for critical error 79.
_threadNodeCheckTimeout: API_GPU_ATTACHED_SANITY_CHECK failed!
```

On Windows, the issue creates three events in the Windows Event Viewer
with the title "Event 56, Application Popup" and this description:
```
The description for Event ID 56 from source Application Popup cannot be found. Either the component that raises this event is not installed on your local computer or the installation is corrupted. You can install or repair the component on the local computer.

If the event originated on another computer, the display information had to be saved with the event.

The following information was included with the event:

ACPI
15

The message resource is present but the message was not found in the message table
```

Event details:
```
<Event xmlns="http://schemas.microsoft.com/win/2004/08/events/event">
  <System>
    <Provider Name="Application Popup" Guid="{47bfa2b7-bd54-4fac-b70b-29021084ca8f}" EventSourceName="Application Popup" />
    <EventID Qualifiers="49156">56</EventID>
    <Version>0</Version>
    <Level>2</Level>
    <Task>0</Task>
    <Opcode>0</Opcode>
    <Keywords>0x80000000000000</Keywords>
    <TimeCreated SystemTime="2026-01-08T16:10:25.6028441Z" />
    <EventRecordID>12874</EventRecordID>
    <Correlation />
    <Execution ProcessID="4" ThreadID="992" />
    <Channel>System</Channel>
    <Computer>agx-z2e-win</Computer>
    <Security />
  </System>
  <EventData>
    <Data />
    <Data>ACPI</Data>
    <Data>15</Data>
    <Binary>000000000300280000000000380004C000000000380004C000000000000000000000000000000000</Binary>
  </EventData>
</Event>
```
After these events, the event log contains a critical "Event 41, Kernel-Power".

Things that I have tried to fix the issue, but which did not help:
- Update BIOS to 2402 (2025-10-21)
- Update both operating systems and GPU drivers
- Re-seat the GPU in its PCIe socket
- Force PCIe 3.0 mode in BIOS for the GPU PCIe slot
- Disable these in BIOS
  - ASPM
    - These settings seem to have an effect only on the ASMedia controllers, though.)
  - Global C-state control
  - IOMMU
  - Resizable BAR
  - SR-IOV
- Set kernel parameter `pcie_aspm=off`

[Setting these voltages may help](https://www.reddit.com/r/AMDHelp/comments/w7dhoz/comment/iknlkj0/)
- VDDSOC: 1.05 V
- VDDG CCD: 0.95 V
- VDDG IOD: 0.95 V
- 1.00V SB: 1.0 V
- 1.8V PLL: 1.8 V


#### USB ports

| Ports           | PCIe bus                    | IOMMU group | Name                                          |
| --------------- | --------------------------- | ----------- |-----------------------------------------------|
| SP_USB10        |                             |             | Chipset &rarr; USB 2.0 header (dual device)   |
| USB_E910        |                             |             | Chipset &rarr; USB 2.0 header (single device) |
| USB32G1_1,2,3,4 | 0000:49:00.3                | 55          |                                               |
| U32G1_E56       |                             |             | Chipset &rarr; header                         |
| U32G1_E78       |                             |             | Chipset &rarr; header                         |
| USB32G2_1,2     | 0000:05:00.3                | 18          | CPU &rarr; back                               |
| USB32G2_3,4     | 0000:24:00.3                | 35          | CPU &rarr; back                               |
| USB32G2_5       | 0000:49:00.3                | 55          | Chipset &rarr; header                         |
| USB32G2_6       |                             |             | Chipset &rarr; header                         |
| USB32G2_7,9     | 0000:42:08.0                | 55          | Chipset &rarr; back                           |
| U32G2_C8        | 0000:49:00.1                | 55          | Chipset &rarr; back                           |
| U32G2X2_EC1     | 0000:22:00.0 / 0000:49:00.3 | 31 / 55     | CPU &rarr; back                               |

The USB controllers are in the IOMMU groups 18, 31, 35 and 55.
This table does not yet include the front panel and USB-c ports.
A good way to find out the values above is to connect a device and run `sudo lshw -html > lshw.html`.


#### BIOS settings
Please remember to update your BIOS before changing these settings.
You can do this in the BIOS settings at *Tool &rarr; Asus EZ Flash 3 Utility*.


##### Ai Tweaker
These settings are specific to your CPU and RAM.
Don't set these until you have first safely installed your OS and run some stress tests to ensure stability.
- [Overclocking guide](www.techpowerup.com/review/amd-ryzen-threadripper-3000-overclocking-deep-dive-asus-rog-zenith-ii-extreme/)
- [DRAM Calculator for Ryzen](https://www.techpowerup.com/download/ryzen-dram-calculator/)

- Ai Overclock Tuner: Default
- Performance Enhancer: Auto
- Memory Frequency: DDR4-3466 MHz
  - The maximum RAM frequency that does not require FCLK overclocking
    or 2:1 RAM vs. Infinity fabric clock configuration is 3600 MHz
- FCLK Frequency: Auto
- Core Performance Boost: Auto
- CPU Core Ratio: Auto
  - CPU Core Ratio (Per CCX): Auto
- EPU Power Saving Mode: Disabled
- TPU: Keep Current Settings
- Performance Bias: Auto
- Precision Boost Overdrive
  - Precision Boost Overdrive: Auto
  - Precision Boost Overdrive Scalar: Auto
  - Max CPU Boost Clock Override: Auto
  - Platform Thermal Throttle Limit: Auto
- DRAM Timing Control
  - DRAM CAS# Latency: 20
  - **Leave the rest at auto**
  - Trcdrd: Auto
  - Trcdwr: Auto
  - DRAM RAS# PRE Time: Auto
  - DRAM RAS# ACT Time: Auto
  - Trc: Auto
  - TrrdS: Auto
  - TrrdL: Auto
  - Tfaw: Auto
  - TwtrS: Auto
  - TwtrL: Auto
  - Twr: Auto
  - Trcpage: Auto
  - TrdrdScl: Auto
  - TwrwrScl: Auto
  - Trfc: Auto
  - Trfc2: Auto
  - Trfc4: Auto
  - Trtp: Auto
  - Trdwr: Auto
  - Twrrd: Auto
  - TwrwrSc: Auto
  - TwrwrSd: Auto
  - TwrwrDd: Auto
  - TrdrdSc: Auto
  - TrdrdSd: Auto
  - TrdrdDd: Auto
  - Tcke: Auto
  - ProcODT: Auto
  - Gear Down Mode: Auto
  - Power Down Enable: Auto
  - RttNom: Auto
  - RttWr: Auto
  - RttPark: Auto
  - memAddrCmdSetup: Auto
  - MemCsOdtSetup: Auto
  - MemCkeSetup: Auto
  - MemCadBusClkDrvStren: Auto
  - MemCadBusAddrCmdDrvStren: Auto
  - MemCadBusCsOdtDrvStren: Auto
  - MemCadBusCkeDrvStren: Auto
  - Mem Over Clock Fail Count: Auto
- External Digi+ Power Control
  - **Leave all at defaults**
  - VRM Initialization Check: Enabled
  - Voltage Monitor: Die Sense
  - CPU Load-line Calibration: Auto
  - CPU Current Capability: Auto
  - CPU VRM Switching Frequency: Auto
  - VRM Spread Spectrum: Auto
  - CPU Power Duty Control: T.Probe
  - CPU Power Phase Control: Auto
  - CPU Power Thermal Control: 120
  - VDDSOC Load-line Calibration: Auto
  - VDDSOC Current Capability: Auto
  - VDDSOC Switching Frequency: Auto
  - VDDSOC Power Thermal Control: 120
  - DRAM Power Phase Control(CHA, CHB): Extreme
  - DRAM Power Phase Control(CHC, CHD): Extreme
  - DRAM Switching Frequency(CHA, CHB): Auto
  - DRAM Switching Frequency(CHC, CHD): Auto
- Tweaker's Paradise
  - **Leave all on auto unless you have issues**
  - SB Clock Spread Spectrum: Auto
  - VTTDDR AB Voltage: Auto
  - VTTDDR CD Voltage: Auto
  - DRAM CTRL REF Voltage on CHA: Auto
  - DRAM CTRL REF Voltage on CHB: Auto
  - DRAM CTRL REF Voltage on CHC: Auto
  - DRAM CTRL REF Voltage on CHD: Auto
  - 1.8V Standby Voltage: Auto
  - CPU 3.3v AUX: Auto
  - 1.2V SB Voltage: Auto
  - DRAM R1 Tune: Auto
  - DRAM R2 Tune: Auto
  - DRAM R3 Tune: Auto
  - DRAM R4 Tune: Auto
  - PCIE Tune R1: Auto
  - PCIE Tune R2: Auto
  - PCIE Tune R3: Auto
  - PLL Tune R1: Auto
  - PLL Tune R2: Auto
  - PLL reference voltage: Auto
  - PLL reference voltage 2: Auto
  - Sense MI Skew: Auto
  - Sense MI Offset: Auto
  - Promontory presence: Auto
  - Clock Amplitude: Auto
  - **CLDO VDDP voltage: 950 mV**
    - Memory controller voltage
    - CLDO = Chip [low-dropout regulator](https://en.wikipedia.org/wiki/Low-dropout_regulator)
    - This setting looks greyed out, but you can still type the value
  - Mem P-State: Auto
- CPU Core Voltage: Auto
- **CPU SOC Voltage: Manual**
  - I/O die voltage
  - **VDDSOC Voltage Override: 1.05 V**
    - Safe maximum: 1.2 V
- DRAM AB Voltage: 1.25 V
  - Default: 1.2 V
  - Default for many XMP kits: 1.35 V
  - Safe maximum: 1.4 V (if you have proper cooling)
- DRAM CD Voltage: 1.25 V
  - Set the same as for DRAM AB Voltage
- **VDDG CCD Voltage Control: 0.950 V**
  - CCD Infinity Fabric voltage
  - This must be smaller than VDD_SOC
  - Safe maximum: 1.05 V
- **VDDG IOD Voltage Control: 1.0 V**
  - I/O die Infinity Fabric voltage
  - Important for PCIe stability
  - This must be smaller than VDD_SOC
  - Safe maximum: 1.1 V
- **1.00V SB Voltage: 1.0 V**
- **1.8V PLL Voltage: 1.8 V**


##### Advanced
- Trusted Computing
  - Security Device Support: Enable
  - SHA-1 PCR Bank: Enabled
  - SHA256 PCR Bank: Enabled
  - Pending operation: None (Unless you want to reset the TPM)
  - Platform Hierarchy: Enabled
  - Storage Hierarchy: Enabled
  - Endorsement Hierarchy: Enabled
  - TPM2.0 UEFI Spec Version: TCG_2
  - Physical Presence Spec Version: 1.3
- AMD fTPM configuration
  - TPM Device Selection: Discrete TPM (If you have a discrete TPM module installed)
  - Erase fTPM NV for factory reset: Enabled
- CPU Configuration
  - PSS Support: Enabled
  - NX Mode: Enabled
  - SVM Mode: Enabled
  - SMT Mode: Enabled
- CPU Configuration
  - PSS Support: Enabled
    - PSS = Performance Supported States. This enables the OS to control the CPU voltage and frequency.
  - NX Mode: Enabled
    - NX bit = no-execute bit.
      This is a security feature that enables the OS to mark memory regions as non-executable.
  - SVM Mode: Enabled
    - SVM = Secure Virtual Machine, AMD's CPU virtualization technology.
      It's also known as AMD-V and is comparable to Intel VT-x.
  - SMT Mode: Enabled
    - SMT = Simultaneous Multithreading
- PCI Subsystem Settings
  - Above 4G Decoding: Enabled
  - Re-Size BAR Support: Enabled
    - This is important for GPU performance
  - SR-IOV Support: Auto
    - This is important if you use virtual machines with PCIe passthrough.
  - BME DMA Mitigation: Enabled
    - BME = Bus Master Enable. This setting prevents DMA until the OS is ready to handle it securely.
  - Hot-Plug Support: Enabled
- USB Configuration
  - Legacy USB Support: enable this if your keyboard does not work in some bootable tool or OS installer that you use
  - XHCI Hand-off: Enabled
    - When enabled, the UEFI/BIOS hands off control of USB 3.x devices to the OS.
  - USB Single Port Control: all enabled
- Network Stack Configuration
  - Network Stack: Disabled (Unless you need PXE booting)
- SATA Configuration
  - SATA Port Enable: Enabled
  - SATA Mode: AHCI
    - Motherboard RAID is also known as FakeRAID, as it's not a real hardware RAID.
      You should use software RAID instead, e.g. Windows Storage Spaces or ZFS.
  - NVMe RAID mode: Disabled
  - SMART Self Test: Enabled
    - This enables monitoring the health of SATA and NVMe drives.
  - Hot Plug: Disabled for all ports unless you have e.g. a hot-swappable drive bay
- Onboard Devices Configuration
  - ASMedia Storage Controller: Enabled
    - ASPM Support: Enabled
  - ASMedia Storage Controller 2: Enabled
    - ASPM Support: Enabled
  - Asmedia USB 3.2 Gen2x2 Controller: Enabled
  - USB Type C Power Switch: Auto
    - If you have USB-c devices that are not compliant with the
      [USB-PD standard](https://en.wikipedia.org/wiki/USB_hardware#USB_Power_Delivery),
      and therefore cannot be charged with this setting, then you should charge them with other means.
  - PCIEX16_1 Bandwidth: X16 Mode
  - PCIEX16_2 Bandwidth: X8 Mode
  - PCIEX16_3 Bandwidth: X16 Mode
  - PCIEX16_4 Bandwidth: X8 Mode
    - I have a GPU installed in this slot and therefore it should have as much bandwidth as possible.
      This setting disables the M.2_2(SOCKET3) slot, which is the one right above this PCIe slot.
  - M.2_3 Bandwidth: X2 Mode
    - Setting this to X4 Mode would disable the ASM1061 SATA controller, which controls the SATA6G_E1-4 ports.
  - PCIEX16_1 Mode: Auto
  - PCIEX16_2 Mode: Auto
  - PCIEX16_3 Mode: Auto
  - PCIEX16_4 Mode: Auto
  - M.2_1 Link Mode: Auto
  - M.2_3 Link Mode: Auto
  - DIMM.2 M.2_1 Link Mode: Auto
  - DIMM.2 M.2_2 Link Mode: Auto
  - SB Link Mode: Auto
  - Intel LAN Controller: Enabled
    - Intel LAN OPROM: Disabled (Unless you need to use PXE booting on this LAN port)
  - 10G LAN Cad: Enabled
    - 10G LAN PXE Option ROM: Disabled (Unless you need to use PXE booting on this LAN port)
  - Wi-Fi 6 (802.11ax) Controller: Enabled
    - Don't forget to install the Wi-Fi antennae to the back of the computer case.
  - Bluetooth Controller: Enabled
  - HD Audio Controller: Enabled
  - [AMS1074 Controller](https://www.asmedia.com.tw/product/3EeyQa9SXazjBHPB/1C8Yq95SX9YT1zy8.html) (Back): Enabled
    - This is the USB 3.2 controller for the rear ports.
  - ASM1074 Controller (Front): Enabled
    - This is the USB 3.2 controller for the front/internal ports.
  - RGB LED lighting
    - When system is in working state: Stealth Mode
      - I want to enable the lighting only when I'm showing my setup.
        Having it disabled will also slightly reduce the amount of light available
        for any possible algae in the liquid cooling, slowing their growth.
    - When system is in sleep, hibernate or soft off states: Stealth Mode
  - USB power delivery in Soft Off state (S5): Enabled
    (If you want to charge devices from the USB ports when the computer is off)
- APM Configuration
  - Restore AC Power Loss: Power Off
    - If you are using the computer as a server, then you may want to set this to *Power on* or *Last State*.
  - ErP Ready: Disabled
    - If you don't need the USB ports to remain on and don't need wake-on-LAN,
      then you should enable this to reduce power consumption when the computer is off.
  - Power on By PCI-E: Enabled
    - This enables wake-on-LAN.
  - Power On By RTC: Disabled
    - Enable this only if you want the computer to turn on automatically at a set time.


###### AMD CBS
Leave these at default unless you know what you're doing.
Below is a list of the default values.

- CPU Common Options
  - Performance
    - Custom Core Pstates
      - Custom Pstate0: Auto
  - Prefetcher Settings
    - L1 Stream HW Prefetcher: Auto
    - L2 Stream HW Prefetcher: Auto
  - RedirectForReturnDis: Auto
  - Core Performance Boost: Auto
  - **Global C-state Control: Auto**
    - On some AMD CPUs, enabling this manually may help with stuttering.
    - For debugging system crashes, you may want to disable this.
- DF Common Options
  - Scrubber
    - DRAM scrub time: Auto
    - Poison scrubber control: Auto
    - Redirect scrubber control: Auto
    - Redirect scrubber limit: Auto
  - Memory Addressing
    - NUMA nodes per socket: Auto
    - Memory interleaving: Auto
    - memory interleaving size: Auto
    - 1TB remap: Auto
    - DRAM map inversion: Auto
  - ACPI
    - ACPI RSAT L3 Cache As NUMA Domain: Auto
    - ACPI SLIT Distance Control: Auto
    - ACPI SLIT remote relative distance: Auto
  - Link
    - GMI encryption control: Auto
    - xGMI encryption control: Auto
    - CAKE CRC perf bounds Control: Auto
    - 4-link xGMI max speed: Auto
    - 3-link xGMI max speed: Auto
    - xGMI TXEQ Mode: Auto
  - Disable DF to external downstream IP SyncFloodPropagation: Auto
  - Disable DF sync flood propagation: Auto
  - Freeze DF module queues on error: Auto
  - CC6 memory region encryption: Auto
  - System probe filter: Auto
  - Memory Clear: Auto
  - PSP error injection support: False
- UMC Common Options
  - DDR4 Common Options
    - DRAM Timing Configuration
      - Overclock: Auto
    - DRAM Controller Configuration
      - DRAM Power Options
        - Power Down Enable: Auto
        - Disable Burst/Postponed Refresh: Auto
        - DRAM Maximum Activate Count: Auto
      - Cmd2T: Auto
      - Ger Down Mode: Auto
    - CAD Bus Configuration
      - CAD Bus Timing User Controls: Auto
      - CAD Bus Drive Strength User Controls: Auto
    - Data Bus Configuration
      - Data Bus Configuration User Controls: Auto
    - Common RAS
      - Data Poisoning: Auto
      - DRAM Post Package Repair: Disable
      - RCD Parity: Auto
      - DRAM Address Command Parity Retry: Auto
      - Max Parity Error Replay: 8
      - Write CRC Enable: Auto
      - DRAM Write CRC Enable and Retry Limit: Auto
      - Max Write CRC Error Replay: 8
      - Disable Memory Error Injection: True
      - ECC Configuration
        - DRAM ECC Symbol Size: Auto
        - **DRAM ECC Enable: Auto**
          - "Auto will set ECC to enable."
        - DRAM UECC Retry: Auto
    - Security
      - TSME: Auto
        - TSME = Transparent SME
      - Data Scramble: Auto
    - Phy Configuration
      - PMU Training
        - DFE Read Training: Auto
        - FFE Write Training: Auto
        - PMU Pattern Bits Control: Auto
        - MR6VrefDQ Control: Auto
        - CPU Vref Training Seed Control: Auto
  - DRAM Memory Mapping
    - Chipset Interleaving: Auto
    - BankGroupSwap: Auto
    - BankGroupSwapAlt: Auto
    - Address Hash Bank: Auto
    - Address Hash CS: Auto
    - Address Hash Rm: Auto
    - SPD Read Optimization: Enabled
  - Memory MBIST
    - MBIST Enable: Disabled
    - Data Eye
      - Pattern Select: PRBS
      - Pattern Length: 3
      - Aggressor Channel: 1 Aggressor Channel
      - Aggressor Static Lane Control: Disabled
      - Aggressor Static Lane Select Upper 32 bits: 0
      - Aggressor Static Lane Select Lower 32 bits: 0
      - Aggressor Static Lane Select ECC: 0
      - Aggressor Static Lane Value: 0
      - Target Static Lane Control: Disabled
      - Target Static Lane Select Upper 32 bits: 0
      - Target Static Lane Select Lower 32 bits: 0
      - Target Static Lane Select ECC: 0
      - Target Static Lane Value: 0
      - Worst Case Margin Granularity: Per Chip Select
      - Read Voltage Sweep Step Size: 1
      - Read Timing Sweep Step Size: 1
      - Write Voltage Sweep Step Size: 1
      - Write Timing Sweep Step Size: 1
- NBIO Common Options
  - **IOMMU: Auto**
    - This can be disabled for debugging PCIe issues
  - XFR Enhancement
    - Accepted
      - Precision Boost Overdrive: Auto
      - Precision Boost Overdrive Scalar: Auto
    - FCLK Frequency: Auto
    - SOC OVERCLOCK VID: 0
    - UCLK DIV1 MODE: Auto
    - VDDP Voltage Control: Auto
    - VDDG Voltage Control: Auto
    - SoC/Uncore OC Mode: Auto
    - LN2 Mode: Auto
  - ACS Enable: Auto
  - PCIe Ten Bit Tag Support: Auto
  - SMU Common Options
    - cTDP Control: Auto
    - EfficiencyModeEn: Auto
    - Package Power Limit Control: Auto
    - APBDIS: Auto
    - DF Cstates: Auto
    - CPPC: Auto
    - CPPC Preferred Cores: Auto
    - NBIO LCLK DPM
      - NBIO DPM Control: Auto
  - Early Link Speed: Auto
  - Preferred IO: Auto
  - CV test: Auto
  - Loopback Mode: Auto


##### AMD PBS
Leave these at default unless you know what you're doing.
Below is a list of the default values.

- Mmio Aove 4G Limit: Auto
- PM L1 SS: Auto
- Data Link Feature Exchange: Auto
- PCIE REDRIVER TX (J3600): Enabled
  - PCIE REDRIVER TX (J3600)
    - Equalizer Setting (db): 3.0_4.2_5.8_9.4
    - Flat Gain Setting (db): -0.5
    - Swing Setting (mVp-p): 1000
  - PCIE REDRIVER TX (J3600)
    - Equalizer Setting (db): 1.8_2.7_3.9_7.0
    - Flat Gain Setting (db): 1
    - Swing Setting (mVp-p): 1000
  - PCIE REDRIVER RX (J3600)
    - Equalizer Setting (db): 0.2_1.0_2.3_5.6
    - Flat Gain Setting (db): -0.5
    - Swing Setting (mVp-p): 1000
  - PCIE REDRIVER RX (J3600)
    - Equalizer Setting (db): 2.1_3.3_4.8_8.5
    - Flat Gain Setting (db): -0.5
    - Swing Setting (mVp-p): 1000

##### AMD Overclocking
Leave these at default unless you know what you're doing.
Below is a list of the default values.

- Manual CPU Overclocking
  - CPU Frequency: 0
  - CPU Voltage: 0
  - CPU Core Count Control
    - CCD Control: Auto
    - Core control: Auto
    - SMT Control: Auto
- DDR and Infinity Fabric Frequency/Timings
  - DDR Frequency and Timings
    - DRAM Timing Configuration
      - Overclock: Auto
    - DRAM Controller Configuration
      - DRAM Power Options
        - Power Down Enable: Auto
      - Cmd2T: Auto
      - Gear Down Mode: Auto
    - CAD Bus Configuration
      - CAD Bus Timing User Controls: Auto
      - CAD Bus Drive Strength User Controls: Auto
    - Data Bus Configuration
      - Data Bus Configuration User Controls: Auto
  - Infinity Fabric Frequency and Dividers
    - Infinity Fabric Frequency and Dividers: Auto
- Precision Boost Overdrive
  - Precision Boost Overdrive: Auto
- LN2 Mode
  - Auto
- SoC Voltage
  - SoC Voltage: 0
- SoC/Uncore OC Mode
  - SoC/Uncore OC Mode: Disabled
- VDDP Voltage Control
  - VDDP Voltage Control: Auto
- VDDG Voltage Control
  - VDDG Voltage Control: Auto
- Gaming Mode
  - Gaming Mode: Disable
- NUMA nodes per socket
  - NUMA nodes per socket: Auto


##### Monitor
Q-Fan Tuning
- These settings are specific to my water cooling setup.
  Please see the list of components above.
- CPU Q-Fan Control: PWM Mode
  - CPU Fan Step Up: 0 sec
  - CPU Fan Step Down: 0 sec
  - CPU Fan Speed Lower Limit: 400 RPM
  - CPU Fan Profile: Manual
    - CPU Upper Temperature: 80
    - CPU Fan Max. Duty Cycle (%): 100
    - CPU Middle Temperature: 50
    - CPU Fan Middle Duty Cycle (%): 50
    - CPU Lower Temperatrue: 40
    - CPU Fan Min. Duty Cycle (%): 30
- Chassis Fan(s) Configuration
  - Q-Fan Source: CPU
  - Same settings as for CPU fan
- Node Power Supply Unit Fan(s) Configuration
  - Node Power Supply Unit Fan Q-Fan Control: Disabled
    - My system does not have a PSU fan connected to the motherboard.
- WATER PUMP+ 1 Control: PWM Mode
  - WATER PUMP+ 1 Fan Q-Fan Source: CPU
  - WATER PUMP+ 1 Upper Temperature: 80
  - WATER PUMP+ 1 Fan Max. Duty Cycle (%): 100
  - WATER PUMP+ 1 Middle Temperature: 50
  - WATER PUMP+ 1 Fan Middle Duty Cycle (%): 80
  - WATER PUMP+ 1 Lower Temperature: 40
  - WATER PUMP+ 1 Fan Min. Duty Cycle (%): 20
- WATER PUMP+ 2 Control: PWM Mode
  - Same settings as for WATER PUMP+ 1
- VRM Heatsink Fan Q-Fan Control: Disabled
  - My system has a waterblock that cools the VRM
- Chipset Fan Q-Fan Control: PWM Mode
  - Chipset Fan Q-Fan Source: Chipset
  - Chipset Fan Step Up: 0 sec
  - Chipset Fan Step Down: 0 sec
  - PCH Fan Speed Low Limit: Ignore
  - Chipset Fan Upper Temperature: 93
  - Chipset Fan Max. Duty Cycle (%): 100
  - Chipset Fan Middle Temperature: 60
  - Chipset Fan Middle Duty Cycle (%): 40
  - Chipset Fan Lower Temperature: 55
  - Chipset Fan Min Duty Cycle (%): 0


##### Boot
- Boot Configuration
  - Fast Boot: Enabled
    - Next Boot after AC Power Loss: Normal Boot
  - Boot Logo Display: Disabled
    - This way you get more info on the screen during boot.
  - POST Report: 5 sec
  - Bootup NumLock State: On
  - Wait For 'F1' If Error: Enabled
    - You may want to disable this if using the computer as a server.
  - Option ROM Messages: Force BIOS
    - If there is a boot-up message from an option ROM, this setting forces it to be shown instead of the ASUS logo.
  - Interrupt 19 Capture: Disabled
    - This setting enables option ROMs to take over the boot process.
      Keep this disabled unless you need it for booting from a specific device
      such as an external hardware RAID controller.
  - Setup Mode: Advanced Mode
- CSM (Compatibility Support Module)
  - **Launch CSM: Disabled** (Unless you need to boot a non-UEFI OS or tool)
- Secure Boot
  - **OS Type**
    - If you have only Windows installed: Windows UEFI mode
    - If you have Linux installed (with or without Windows dual-boot): Other OS
  - Key Management
    - If you have bought the motherboard used,
      then you should clear the secure boot keys and install the default secure boot keys
      to ensure that no custom keys are left by the previous owner.
- Boot Option #1: Your OS EFI bootloader
- Boot Option #2: Disabled
  - This should be disabled on dual-boot setups to ensure that
    the computer does not accidentally boot to Windows without going through GRUB,
    as this would change the TPM registers and therefore reset Windows Hello and BitLocker.
- AMI Native NVMe Driver Support: Enabled
  - This may be needed for booting from an NVMe SSD.


##### Tool
- ASUS Secure Erase
  - If you have bought any of your SSDs used,
    then you should use this tool to securely erase them before installing the OS.
    This will also tell the SSDs that there is no data on them,
    so that their controllers can reorganize the storage cells for optimal wear leveling.
- Flexkey: Aura On/Off
- ASUS User Profile
  - Once you have set all the settings you want and rebooted to ensure that they work,
    then you should save the settings as a profile so that you can easily restore them later if needed.
    One good naming convention for the settings is to use the date when the settings were applied.
- ASUS Armoury Crate
  - Download & Install ARMOURY CRATE app: Enabled
    - This installs the ASUS Armoury Crate software in Windows automatically.
      It's used for e.g. controlling the OLED and RGB lighting.


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
    - Advanced &rarr; CPU Setup &rarr; TxT: Enable
    - Advanced &rarr; Intel Manageability &rarr; Intel Manageability Control: Disabled
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
    - Security Erase HDD Data &rarr; Erase M.2 Drive 1 Data
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
