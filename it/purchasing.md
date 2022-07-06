---
layout: default
title: Purchase guides
---

# Purchase guides
I get asked quite often about e.g. which desktop PC components and laptops to purchase.
These guides will hopefully give you a general idea.
Before starting to look for devices, please ask yourself these questions:
- What are you going to use the device for?
  Does your use case need lots or performance, or would a cheaper alternative be sufficient?
- How long are you planning to use the device?
  Is it a better idea to buy a future-proofed device, or buy another after a few years?
  When the device will eventually be decommissioned, are you going to disassemble it for parts, or are you going to repurpose it as a whole?
  Some parts are worth future-proofing, whereas with some parts the additional features and performance are not worth the additional cost.
- Does the device have to be new, or would a used one be sufficient?


## How to find good deals
- [Geizhals](https://geizhals.eu/) is a good comparison site for Central Europe.
  It has extensive filtering tools and is therefore good for finding models with the features you want.
- [Hinta.fi](https://hinta.fi/) and [Hintaseuranta.fi](https://hintaseuranta.fi/) are good price comparison sites for Finland.
- [Huuto.net](https://www.huuto.net/) and [Tori.fi](https://www.tori.fi/) are good places to find used devices in Finland.
- [Huutokaupat.com](https://huutokaupat.com/) is an auction site for professional sellers such as liquidations.
  You can find incredible deals on professional hardware, but those are quite rare.
- First think carefully whether you actually need the device, and whether you need it right now or perhaps only after a few years.
  The electronics industry moves forward so rapidly that it's rarely a good idea to purchase a device before you actually need it.
  If you have decided that you actually need the device, take your time to find the models that suit your needs.
  Then place price alerts on them on several comparison sites and wait for a discount season such as Black Friday.
  If the price goes below the limits you have set, buy the device. :D


## Desktop PC components
If at all possible, buy your PC as components or as pre-assembled from individual components.
Don't buy fully pre-made PCs, as those have often proprietary form factors and power delivery solutions
that make upgrading and finding replacement parts difficult or even impossible.
Those also often have poor-quality components in their power delivery and bad airflow design in the case.

If you're only using the computer for light tasks such as web browsing, consider buying a laptop and a Thunderbolt dock instead.

- CPU
  - CPU is the most important component for professional workloads such as image and video editing and software development.
    For these workloads multi-core performance is the most important quantity.
  - For gaming single-core performance is the most important quantity.
  - Frequency is not a good indicator of performance. Look for benchmark results instead.
  - If you're buying a used device, ensure that the CPU is
    [compatible with Windows 11](https://docs.microsoft.com/en-us/windows-hardware/design/minimum/windows-processor-requirements)
- GPU
  - GPU is the most important part for gaming.
  - Depending on the state of the cryptocurrency market, finding a GPU can be difficult, and the prices may be inflated.
    In those times finding a good deal can take a lot of work.
  - If you're streaming or recording your monitor, look for a GPU with a good encoder.
    At the moment Nvidia's NVENC is superior to the alternatives.
    However, many of the cheapest GPUs such as the MX series and the GTX 1600 series don't include NVENC,
    so one should be careful when choosing the GPU.
  - At the moment GPUs are supported for about nine years after release.
    This is the maximum time you can expect the GPU to be compatible with the latest OS, both on Windows and on Linux.
    (For example the GTX 700 series is supported on Ubuntu 22.04 only with legacy drivers, which don't support the latest CUDA libraries.)
  - New GPUs often have significant feature improvements such as video encoders and decoders and newer connector versions.
    Therefore, buying a lower-end model from a newer series instead of a higher-end model from older series may be worth the additional price
    even when the raw performance would be similar.
    - [AV1 decoding is supported from AMD RX 6000 series and Nvidia RTX 3000 series onwards](https://en.wikipedia.org/wiki/AV1#Hardware)
- RAM
  - 8 GB is sufficient for basic tasks, but I recommend 16 GB, especially for gaming.
    32 GB is worth considering for professional workloads and virtual desktops.
    Higher amounts of RAM are only necessary for specific use cases such as virtual machines and scientific computing.
  - Frequency is not a good indicator of performance, as the latency matters a lot.
    In addition to the frequency, look for the absolute latency in nanoseconds.
    It's the latency number divided by the frequency, and lower is better.
    You should also check the maximum frequency supported by your CPU and motherboard.
  - ECC memory is worth considering for professional use that requires reliability.
    On AMD this is unofficially supported by most CPUs and some consumer motherboards,
    whereas on Intel this is found only on professional hardware.
- Motherboard
  - Think carefully what features you actually need, as additional features can crank up the price quite quickly.
  - For compatibility with Windows 11, the CPU+Motherboard combination must have TPM 2.0 support,
    either in the firmware or as a physical chip.
  - Read reviews about the VRM temperatures and quality for reliability and overclocking headroom.
    A good motherboard with a low number of VRM phases can be as good as one with a higher number of phases.
  - There tend to never be enough USB ports, but more can be added with a PCIe x1 add-on card.
  - If you have a NAS, an integrated 10 GB Ethernet controller is worth considering.
    When installed as an add-on card, 10 GB Ethernet controllers tend to need a longer than x1 PCIe slot,
    requiring installation in one of the x16 slots on the motherboard.
    Many motherboards split the lanes between the x16 slots to e.g. x8 per slot when multiple cards are installed,
    so installing a separate Ethernet controller may halve the bandwidth of your GPU.
  - Thunderbolt docks can make it a lot easier to manage the cables, especially if you have an electric standing desk.
    With optical cables you can even install the computer in another room and have complete silence in your room!
  - Wired network connectivity should be preferred over wireless whenever possible.
    However, if wired networking is not possible, you should use a Wi-Fi adapter that is either included in the motherboard
    or connected over PCIe. A well-positioned external antenna is necessary for a fast and reliable connection.
- SSD
  - The operating system should be installed on a M.2 form factor SSD with PCIe connectivity (NVME).
    Those can be quite expensive especially at the larger sizes,
    so files should be stored on separate drives such as SATA SSDs.
    If you have lots of large files such as movies, it's preferable to build a separate server (NAS) for them.
  - Throughput is only one of the important characteristics.
    IOPS is also important, and largely determined by the controller.
  - Avoid QLC except for separate game drives, as it has bad write speeds and wears out quickly. Prefer TLC instead.
  - Games take a lot of space. For gaming, 1 TB is the minimum size, and 2 TB is worth considering.
  - If you need encryption, look for an SSD with OPAL support.
    Other protocols are often proprietary and poorly implemented.
  - As of 2022, PCIe 4.0 may not be worth the additional price.
- Power supply (PSU)
  - Aim for at least 80 Plus Gold certification. This is also an indicator of build quality.
  - Look for a semi-passive model. This means that the fan should stop spinning with low loads.
    It will reduce the noise and extend the lifetime of the fan.
  - If you pay for your electricity yourself and have the computer on for the most of the time
    for e.g. cryptocurrency mining or scientific computing,
    higher efficiencies are worth considering, as they will pay for themselves in the long run.
  - Newer GPUs tend to have higher power consumption, so it's a good idea to leave some headroom in the power budget.
- Cooling
  - The best air coolers are sufficient almost any CPU if you're not overclocking.
    For the average user the choice between an air cooler and a closed-loop water cooler should be based on
    aesthetics and reliability.
  - The largest Noctua coolers are among the best air coolers.
  - With both closed and custom water cooling, radiator surface area is the most important factor for performance.
    For a CPU the radiator should be at least 2x 120 mm but preferably 2x 140 mm.
    If you have a GPU in the same loop,
    the radiator should be at least 3x 120 mm but preferably 3x 140 mm or a thick 3x 120 mm.
  - 140 mm fans can move larger amounts of air with the same noise level as 120 mm fans.
    2x 140 mm is about as performant as 3x 120 mm but can be more quiet.
  - The closed-loop water cooling systems often come with bad fans that you should replace to reduce the noise.
  - Custom water cooling is expensive and requires a lot of work.
    If you end up building one, be prepared to spend at least a full week assembling the computer,
    and a full day or two each year flushing and cleaning the loop.
    For the most complex loops you may have to modify the case with metalworking tools.
    Don't build a custom loop unless you have multiple GPUs or are especially concerned about aesthetics or noise.
- Fans
  - Noctua is a good choice.
  - If you want RGB, consider the Corsair ML series,
    as on low RPMs it's about as quiet as Noctua fans thanks to its maglev bearing.
    Don't confuse the ML series with the more noisy but better-lighted LL series.
    The LEDs use the standard WS2818B protocol at 5 V and can therefore be controlled with an Arduino by attaching the
    control pin from the splitter box to the Arduino and having a common ground.
    Be careful with the pin connections, though, as wrong connections can easily burn out the LEDs.
- Case
  - Consider a 19" rack case, as then you can install all your equipment nicely in a rack below your desk.
    However, good racks with e.g. glass doors and noise insulation can be very expensive.
  - Fractal Design makes good and quiet cases.
  - The case should have a USB-c port in the front for attaching e.g. a phone.
  - Optical drives are no longer worth it, so there is no need to have space for them. Use an external drive instead.


## Laptops
- The ThinkPad T-series is built to last. If you don't need high gaming performance, get one if you can afford it.
  They have:
  - High build quality
  - UEFI & ME security patches for years
  - Various features that are difficult to find on consumer laptops:
    integrated LTE/5G modems, privacy filters on monitors, fingerprint readers, identity card readers, NFC etc.
  - Good Linux support from the community
- For the CPU, GPU, RAM and SSD, please see the desktop tips
- Laptop performance is affected a lot by cooling,
  and therefore performance test results for the individual components
  may not correspond to actual performance of the particular laptop model.
- Connectivity
  - Thunderbolt is a must-have, if you want to connect the laptop to a high-resolution monitor or multiple monitors.
    If you're gaming only at home and at LAN parties and have an external monitor, consider purchasing an external
    GPU to get desktop-level gaming performance out of your laptop.
  - USB-c charging makes it a lot easier to charge the laptop with docks, portable charges and power banks.
  - 4K 60 Hz output requires HDMI 2.0 or later, which is quite rare on older laptops.
- Battery
  - Most laptops have either lithium-ion (Li-ion) or lithium polymer (LiPo) batteries.
  - The lifetime expectancy of both battery types is about three years.
    Around this time the batteries have lost a significant fraction of their capacity,
    and LiPo batteries also tend to puff over time, especially when exposed to the heat from the laptop.
    The latter will cause a fire hazard and physical damage to the laptop from the pressure they create when
    expanding. I've seen several laptops where the thickness of the battery has more than doubled over time,
    cracking the laptop open. Therefore, Li-ion batteries should be preferred over LiPo batteries.
    Often user-replaceable batteries, especially the thick ones, are Li-ion, and the internal batteries are LiPo.
  - Internal batteries can also be replaced on most laptops, but the availability of replacement batteries is worse.
- Monitor
  - For good eyes, 1080p is the optimal resolution for 14". For older eyes, 1080p and 15" is a good combination.
  - Higher resolutions require the use of scaling to make text large enough to be readable.
    This may cause problems with older software,
    and on Linux the use of multiple monitors with different scaling levels requires Wayland.
- LTE/5G modem (WWAN)
  - If you can somehow get a multi-SIM cell phone plan or data plan or can afford the extra data plan,
    having an integrated modem in the laptop is a lot easier and more reliable than sharing internet from a phone.
  - This feature is often found only on business laptops such as ThinkPads.
  - 3G network will be shut down in a few years, so the modems on older laptops will then become pretty much useless.

## Monitors and TVs
- Panel technology
  - Avoid TN panels, unless you're a gaming professional and absolutely need the fastest refresh rates possible.
    - They have bad viewing angles and color space
  - Avoid OLED panels if the monitor/TV is connected to a computer
    - Any static objects on the screen such as the taskbar will be permanently burned in within months of active use
  - VA and IPS are good panel technologies
- Sizing
  - For desktop monitors, 27" and 1440p has the best price-to-performance ratio as of 2022.
  - For older eyes, ~31" and 1440p may be preferred due to the larger default text size.
  - Higher pixel densities are barely noticeable but require a lot more powerful hardware for gaming.
  - 34" 3440x1440 ultrawide is the optimal size for professional use. You can easily fit two large documents
    or your code and the documentation on the screen at the same time.
  - A 4K display should be ~40" or larger. If you install them on a monitor arm and plan your apartment properly,
    you can also use them as your TV.
  - Gaming on 4K requires a very powerful computer (RX 6000 or RTX 3000 series or later GPU).
- Connectivity
  - If you want to connect several devices to the same monitor,
    ensure that it has a sufficient number of connections that can drive the monitor at its full refresh rate.
    Desktop monitors often have a too old HDMI version,
    and TVs can have the latest HDMI version on only some of their ports.
  - HDMI 2.0 is required for 4K 60 Hz, and HDMI 2.1 for 4K 120 Hz and variable refresh rate.
    However, with HDMI 2.1 most features such as the aforementioned are optional and their presence has to be verified manually.
- Refresh rate
  - High refresh rate is more important than variable refresh rate such as FreeSync or G-Sync,
    as the latter require specific support from software.
    Therefore, look for monitors with a 120 Hz or higher refresh rate.
    Having a high refresh rate also affects the smoothness of all desktop applications and movies.
    Most movies are shot in 24 or 25 FPS, and therefore they lag a lot on 60 Hz monitors where every other frame has to
    be shown once and every other twice to match the monitor refresh rate.
    This effect is a lot smaller on high refresh rate monitors.
    On Linux variable refresh rate is not supported if you have multiple monitors.
  - Some TVs already have 120 Hz refresh rates
- HDR
  - On Windows HDR is supported with consumer GPUs only on fullscreen applications such as games.
    The support for HDR photos and videos is very limited.
  - Properly displaying HDR content requires a high maximum brightness such as 1000 nits, aka. HDR1000.
    Especially HDR400 is not worth it, unless you want to test the HDR compatibility of various sofware.
- VESA mounting support is a must-have, as monitor arms save a lot of desk space, and you may want to install them later.
- For smart monitors and TVs, prefer Android TV over manufacturer-specific proprietary implementations
  - For compatibility and good image quality with future streaming services, ensure that the TV has the AV1 hardware decoder and Android TV 10 or later.
  - For compatibility with the photos of future cameras, ensure that the TV has Android TV 12 or later, as it includes support for the AVIF image format.
- For TVs, bigger is better, but you should think on how to mount them. Many TV stands have quite a small maximum size.


## Phones

- Phone manufacturers often provide security patches for only 1-2 years after the model is released.
  If you want to use the phone for longer, look for a phone that is supported by an alternative Android version such as LineageOS.
  - [Official list](https://download.lineageos.org/)
  - [Geizhals list](https://geizhals.eu/?cat=umtsover&xf=162_LineageOS+Support) (new models may appear with a delay)
- RAM: at least 6 GB
- Storage: at least 128 GB
- Camera
  - 4K 60 Hz video recording
  - Camera2 API support for RAW photography and manual control of various features such as focus, white balance, ISO and shutter speed.
    You can test this with the
    [Manual Camera Compatibility test app](https://play.google.com/store/apps/details?id=pl.vipek.camera2_compatibility_test)
    and the
    [Open Camera app](https://play.google.com/store/apps/details?id=net.sourceforge.opencamera).
- Modem: 5G with support for at least the n78 band, which is the primary 5G band
  [in Finland](https://www.mikrobitti.fi/uutiset/tallainen-on-uusi-5g-taajuuskaista-listasimme-myos-kaikkien-suomessa-myytavien-5g-puhelinten-tuettavat-kaistat/9597cbae-27a4-4f86-9d40-7f2bf4407216)
  - n28 band is for longer ranges with lower speeds,
    and n258 is the mmWave band for short-range connectivity for mass events such as concerts and festivals
- NFC
  - The tags are cheap on AliExpress and can be used for various purposes
  - Makes the use of a YubiKey a lot easier
- Android version: at least 12 (as of 2022)
  - Android 10 adds support for AV1 decoding
  - Android 12 adds support for the AVIF image format
- Devices with the aforementioned features:
  [Geizhals list](https://geizhals.eu/?cat=umtsover&xf=10063_12.0%7E146_Videos+%402160p%2F60fps%7E157_131072%7E162_LineageOS+Support%7E17890_n28%7E17890_n78%7E18414_NFC%7E2607_6144)
  - The 5G mmWave band n258 has been left out from the list, as it's supported by only a few devices
