---
layout: default
title: Physical security
---

# Physical security

## Security cameras

### Features
- 2-way audio
- Night vision (infrared LEDs)
- ONVIF
- Power over Ethernet (PoE)
- RTSP
- Wi-Fi
  - An intruder can jam Wi-Fi signal quite easily, so a physical connection should be used if at all possible.


### Firmware
- [OpenIPC](https://openipc.org/)
  - [Documentation](https://docs.openipc.org/)
  - [Recommended SoC list](https://openipc.org/supported-hardware/featured)
  - [Supported devices](https://github.com/OpenIPC/wiki/blob/master/en/guide-supported-devices.md) (old list, not up to date)
  - For new setups, the
    [Ingenic T40 series SoCs](https://en.ingenic.com.cn/products-detail/id-20.html) seem a promising choice
    - 4K (3840x2160) 25 FPS
    - H.265, H.264 & MJPEG
    - XBurst2 dual-core MIPS CPU, 1.2 GHz
    - RISC-V coprocessor, 600 MHz
    - NPU, 8 TOPS, INT16/INT8/INT4/INT2
    - USB 2.0
- [Thingino](https://thingino.com/)
  - [Installation instructions](https://github.com/wltechblog/thingino-installers)
  - Upgrading
    - Full upgrade = update firmware and bootloader, and erase all data
    - Partial upgrade = upgrade firmware only
  - [Wuuk Y0510](https://wuuklabs.com/products/indoor-wired-security-camera-pan-tilt-4mp):
    [instructions](https://github.com/wltechblog/thingino-installers/tree/main/wuuk-y0510),
    [Amazon.de](https://www.amazon.de/dp/B0BC8DRX9D)
    - [Ingenic T31X SoC](https://en.ingenic.com.cn/products-detail/id-21.html)
      - 4 MP (2560x1440), 30 FPS
      - H.264, H.265 & MJPEG
      - XBurst MIPS CPU, 1.0 - 1.8 GHz, 22 nm
      - RISC-V coprocessor, 500 MHz
      - USB 2.0
    - Wi-Fi: 2.4 GHz & WPA2 only, no WPA3 support
    - PoE is possible with a separate PoE to USB-c adapter


## Sensors
- Philips Hue motion sensor
  - Indoor:
    [hinta.fi](https://hinta.fi/1114538/philips-8718696595190),
    [Amazon.de](https://www.amazon.de/-/en/Philips-Hue-Indoor-Motion-Sensor/dp/B09CV78GV1)
  - Outdoor:
    [hinta.fi](https://hinta.fi/1609845/philips-8718699625474),
    [Amazon.de](https://www.amazon.de/-/en/Philips-Outdoor-Motion-Integrated-Daylight/dp/B09CV7MT5S)
- Philips Hue contact sensor
  - Black 1 pcs:
    [hinta.fi](https://hinta.fi/4412225/philips-by-signify-hue-secure-kosketustunnistin-musta-1-kpl),
    [Amazon.de](https://www.amazon.de/-/en/Philips-Contact-Installation-Security-Required/dp/B0CDM8MKT6)
  - Black 2 pcs:
    [hinta.fi](https://hinta.fi/4389781/philips-hue-secure-kosketustunnistin-musta-2-kpl),
    [Amazon.de](https://www.amazon.de/-/en/Philips-Contact-Installation-Security-Required/dp/B0CDMBLJKR)
  - White 1 pcs:
    [Amazon.de](https://www.amazon.de/-/en/Philips-Contact-Installation-Security-Required/dp/B0CDMBFXJ3)
  - White 2 pcs:
    [hinta.fi](https://hinta.fi/4363523/philips-hue-secure-kosketustunnistin-valkoinen-2-kpl),
    [Amazon.de](https://www.amazon.de/-/en/Philips-Contact-Installation-Security-Required/dp/B0CDM9VTMN)


## Manufacturers
- [Reolink](https://reolink.com/)
  - [reolink.fi](https://reolink.fi/)
- [Ubiquiti](https://ui.com/eu/en/physical-security)
