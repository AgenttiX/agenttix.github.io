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
- [Ebay](https://www.ebay.com/) is a good source for used enterprise networking hardware
- [FibreStore](https://www.fs.com/de-en) is a good source for new enterprise networking hardware
- [Geizhals](https://geizhals.eu/) is a good comparison site for Central Europe.
  It has extensive filtering tools and is therefore good for finding models with the features you want.
- [Hinta.fi](https://hinta.fi/) and [Hintaseuranta.fi](https://hintaseuranta.fi/) are good price comparison sites for Finland.
- [Huuto.net](https://www.huuto.net/) and [Tori.fi](https://www.tori.fi/) are good places to find used devices in Finland.
- [Huutokaupat.com](https://huutokaupat.com/) is an auction site for professional sellers such as liquidations.
  You can find incredible deals on professional hardware, but those are quite rare.
- [IO-Tech BBS](https://bbs.io-tech.fi/) is comprehensive IT forum with a section for sales
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

### CPU
- CPU is the most important component for professional workloads such as image and video editing and software development.
  For these workloads multi-core performance is the most important quantity.
- For gaming single-core performance is the most important quantity.
- Frequency is not a good indicator of performance. Look for benchmark results instead.
- If you're buying a used device
  - Ensure that the CPU is
    [compatible with Windows 11](https://docs.microsoft.com/en-us/windows-hardware/design/minimum/windows-processor-requirements)
  - Try to buy the CPU and motherboard together, and possibly the RAM as well.
    If they don't work, it's easier to complain to one seller than multiple.

### GPU
- GPU is the most important part for gaming.
- Depending on the state of the cryptocurrency market, finding a GPU can be difficult, and the prices may be inflated.
  In those times finding a good deal can take a lot of work.
- If you're streaming or recording your monitor, look for a GPU with a good encoder.
  At the moment Nvidia's NVENC is superior to the alternatives.
  However, many of the cheapest GPUs such as the MX series and the GTX 1600 series don't include NVENC,
  so one should be careful when choosing the GPU.
- At the moment GPUs are supported for about nine years after release.
  This is the maximum time you can expect the GPU to be compatible with the latest OS, both on Windows and on Linux.
  (For example the GTX 700 series is supported on Ubuntu 22.04 only with legacy drivers,
  which don't support the latest CUDA libraries.)
- New GPUs often have significant feature improvements such as video encoders and decoders and newer connector versions.
  Therefore, buying a lower-end model from a newer series instead of a higher-end model from older series
  may be worth the additional price, even when the raw performance would be similar.
  - [AV1 decoding is supported from AMD RX 6000 series and Nvidia RTX 3000 series onwards](https://en.wikipedia.org/wiki/AV1#Hardware)
- AMD GPU drivers are included in the Linux kernel and therefore work out of the box,
  whereas Nvidia GPU drivers have to be installed separately
  and are compatible with new Linux distribution versions only as long as the GPU is officially supported by Nvidia.
  AMD GPUs should therefore have a longer lifespan on Linux than Nvidia GPUs.
  However, AMD scientific libraries have to be installed manually,
  and their support of new Linux distribution versions is
  [notoriously poor](https://github.com/RadeonOpenCompute/ROCm/issues/1713).
  Therefore, if you want to do any GPU-accelerated computing, even OpenCL, you should get an Nvidia GPU instead.
- Main differences between consumer (GTX, RTX, Radeon) and professional cards (Quadro, Tesla, Radeon Pro)
  - Professional cards have ECC memory and registers, whereas consumer cards often don't
    (or have ECC only in the memory and not for the registers).
    ECC memory is highly useful for scientific simulations and other loads that require precision,
    but not for machine learning.
  - Professional cards use different drivers that have been optimized and tested for CAD instead of games.
- GDDR6X has ECC-like error correction, but without error reporting.
  - [Active on RTX 3080](https://www.reddit.com/r/overclocking/comments/nfk5pf/does_gddr6_memory_have_error_correction_abilities/)
- RTX 4000 series and later GPUs use the new 12VHPWR power connector.
  If you're planning to install one of these in a new build,
  you should get a PSU that also has the same connector,
  or one for which the manufacturer provides official adapter cables.
  Third-party adapters are a fire hazard when used with multi-rail PSUs or when plugged to ports with
  a too low power rating.
  The connector is also very fragile, so avoid bending the cables when doing cable management.
  [Gamers Nexus](https://www.gamersnexus.net/news-pc/3692-intel-arc-isnt-dead-melting-gpu-cables),
  [JayzTwoCents](https://www.youtube.com/watch?v=K6FiGEAp928)

### RAM
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

### Motherboard
- Think carefully what features you actually need, as additional features can crank up the price quite quickly.
- For compatibility with Windows 11, the CPU+Motherboard combination must have TPM 2.0 support,
  either in the firmware or as a physical chip.
- Read reviews about the VRM temperatures and quality for reliability and overclocking headroom.
  A good motherboard with a low number of VRM phases can be as good as one with a higher number of phases.
- There tend to never be enough USB ports, but more can be added with a PCIe x1 add-on card.
- If you have a NAS, an integrated 10 Gb Ethernet controller is worth considering.
  When installed as an add-on card, 10 Gb Ethernet controllers tend to need a longer than x1 PCIe slot,
  requiring installation in one of the x16 slots on the motherboard.
  Many motherboards split the lanes between the x16 slots to e.g. x8 per slot when multiple cards are installed,
  so installing a separate Ethernet controller may halve the bandwidth of your GPU.
  However, a used add-on card is usually the cheaper option.
- Ensure that you have enough PCIe slots and lanes, especially if you're building a server.
  Installing multiple network cards and SATA controllers will easily consume the most of your PCIe slots.
  - On many consumer boards several features (PCIe ports, Thunderbolt, SATA etc.) are connected to the same PCIe lanes,
    and cannot be enabled simultaneously.
    Carefully read the manual of the motherboard before purchasing to ensure,
    that you can simultaneously enable all the features you need.
- With a Thunderbolt port you can have a Thunderbolt dock that makes it a lot easier to manage the cables,
  especially if you have an electric standing desk.
  With optical cables you can even install the computer in another room and have complete silence in your room!
- Wired network connectivity should be preferred over wireless whenever possible.
  However, if wired networking is not possible,
  you should use a Wi-Fi adapter that is either included in the motherboard or connected over PCIe.
  A well-positioned external antenna is necessary for a fast and reliable connection.

### SSD
- The operating system should be installed on an M.2 form factor SSD with PCIe connectivity (NVME).
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

### Power supply (PSU)
- Aim for at least 80 Plus Gold certification. This is also an indicator of build quality.
- Look for a semi-passive model. This means that the fan should stop spinning with low loads.
  It will reduce the noise and extend the lifetime of the fan.
- If you pay for your electricity yourself and have the computer on for the most of the time
  for e.g. cryptocurrency mining or scientific computing,
  higher efficiencies are worth considering, as they will pay for themselves in the long run.
- Newer GPUs tend to have higher power consumption, so it's a good idea to leave some headroom in the power budget.

### Cooling
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
- The CPU socket orientation varies on server motherboards.
  If you have one, ensure that you get a CPU cooler with the correct orientation for the best airflow.

### Fans
- Noctua is a good choice.
- If you want RGB, consider the Corsair ML series,
  as on low RPMs it's about as quiet as Noctua fans thanks to its maglev bearing.
  Don't confuse the ML series with the more noisy but better-lighted LL series.
  The LEDs use the standard WS2818B protocol at 5 V and can therefore be controlled with an Arduino by attaching the
  control pin from the splitter box to the Arduino and having a common ground.
  Be careful with the pin connections, though, as wrong connections can easily burn out the LEDs.

### Case
- Consider a 19" rack case, as then you can install all your equipment nicely in a rack below your desk,
  or take the computer with you to e.g. a LAN party in a rack carrying case.
  - 5U and higher cases are difficult to find, so you may have to go with a 4U one.
    However, this significantly limits the maximum height of the CPU cooler.
    Therefore, an all-in-one (AIO) water cooler will probably be the best option for high-performance cooling.
  - Some manufacturers:
    - [Alphacool](https://www.alphacool.com/shop/enterprise-solutions-server/19-server-racks/19-cases/)
    - [Inter-Tech](https://www.inter-tech.de/en/products/ipc)
- If you want a larger case, you should consider installing a regular PC case that is small enough
  to be put on a 19" rack shelf.
  The width of the space in a 19" rack is
  [17.75" = 450.85 mm](https://en.wikipedia.org/wiki/19-inch_rack#Specifications),
  so any case with a total height smaller than this should fit.
  Depending on how close the side panels of your rack are,
  you should also include the legs of the case in your estimates.
  This kind of mounting puts the side panel on top.
  Therefore, a glass side panel is very easy to break by dropping something on it,
  and a solid side panel should be preferred.
  - You can use this
    [Geizhals listing](https://geizhals.eu/?cat=gehatx&xf=348_50%7E540_supportUSB-C%7E9691_ATX)
    to find suitable cases.
    Please note that the dimensions include the feet,
    and you should therefore check the height without the feet separately.
  - [Be Quiet! Pure Base 500DX](https://www.bequiet.com/en/case/1854)
    ([hinta.fi](https://hinta.fi/1906339/be-quiet-pure-base-500dx-black))
    - 463 mm with feet and 443 mm without, which is just the right size
      [to fit in a rack](https://www.reddit.com/r/homelab/comments/xb4pb8/first_dive_into_my_own_homelab_super_excited/).
- Good cases that probably don't fit in a rack, unless you put them in through a side panel
  - Fractal Design makes good and quiet cases.
  - [Fractal Design Define 7](https://www.fractal-design.com/products/cases/define/define-7/black-solid/)
    ([hinta.fi](https://hinta.fi/1871621/fractal-design-define-7))
    - 475 mm with feet and 451 mm without
  - [Fractal Design Define 7 Compact](https://www.fractal-design.com/products/cases/define/define-7-compact/black-solid/)
    ([hinta.fi](https://hinta.fi/1914063/fractal-design-define-7-compact))
    - 474 mm with feet and 451 mm without
  - [Fractal Design Meshify 2](https://www.fractal-design.com/products/cases/meshify/meshify-2/black-solid/)
    ([hinta.fi](https://hinta.fi/2114795/fractal-design-meshify-2))
    - 474 mm with feet and 454 mm without
    - [The feet are removable](https://www.reddit.com/r/FractalDesignNA/comments/p3lysy/change_feet_of_meshify_2/).
  - [Fractal Design Meshify 2 Compact](https://www.fractal-design.com/products/cases/meshify/meshify-2-compact/black-solid/)
    ([hinta.fi](https://hinta.fi/2115292/fractal-design-meshify-2-compact))
    - 475 mm with feet and 455 mm without
  - [Fractal Design Torrent](https://www.fractal-design.com/products/cases/torrent/torrent/black-solid/)
    ([hinta.fi](https://hinta.fi/2986095/fractal-design-torrent))
    - 530 mm with feet
  - [Fractal Design Torrent Compact](https://www.fractal-design.com/products/cases/torrent/torrent-compact/black-solid/)
    ([hinta.fi](https://hinta.fi/3256994/fractal-design-torrent-compact))
- The case should have a USB-c port in the front for attaching e.g. a phone or a USB-c FIDO2 security key.
- Optical drives are no longer worth it, so there is no need to have space for them. Use an external drive instead.

### Expansion cards
- PCIe USB controllers are the best way to add more USB ports.
  - If the card has multiple controllers,
    you should in theory be able to assign each controller to a separate virtual machine.
    However, the IOMMU grouping of the motherboard may come in the way.
    [Reddit thread 1](https://www.reddit.com/r/unRAID/comments/n48wos/pcie_usb_controller_card_with_multiple_controllers/),
    [Reddit thread 2](https://www.reddit.com/r/VFIO/comments/jdzdhj/1_pci_usb_card_with_2x_controllers/),
    [Levelonetechs thread](https://forum.level1techs.com/t/usb-sr-iov-pcie-expansion-card/153324),
    [Intel forum thread](https://community.intel.com/t5/Server-Products/Intel-XHCI-controller-with-SR-IOV-support-XHCI-IOV/m-p/521300).
    - [HighPoint RocketU](https://www.highpoint-tech.com/usb-catalog)
    - [StarTech PEXUSB3S44](https://www.startech.com/en-us/cards-adapters/pexusb3s44v):
      [Amazon.de](https://www.amazon.de/-/en/StarTech-PEXUSB3S44-Channel-PCIE-Card/dp/B00HJZEA2S)
    - If you come across a PCIe USB card with SR-IOV, please let me know!


## Laptops
- The ThinkPad T-series is built to last. If you don't need high gaming performance, get one if you can afford it.
  They have:
  - High build quality
  - UEFI & ME security patches for years
  - Various features that are difficult to find on consumer laptops:
    integrated LTE/5G modems, privacy filters on monitors, fingerprint readers, identity card readers, NFC etc.
  - Good Linux support from the community
- The [Framework](https://frame.work/) laptop has great upgradeability and repairability,
  which give it a long lifespan and therefore good value for money.
- For the CPU, GPU, RAM and SSD, please see the desktop tips
- Laptop performance is affected a lot by cooling,
  and therefore performance test results for the individual components
  may not correspond to actual performance of the particular laptop model.

### Connectivity
- Thunderbolt is a must-have, if you want to connect the laptop to a high-resolution monitor or multiple monitors.
  If you're gaming only at home and at LAN parties and have an external monitor, consider purchasing an external
  GPU to get desktop-level gaming performance out of your laptop.
- USB-c charging makes it a lot easier to charge the laptop with docks, portable charges and power banks.
- 4K 60 Hz output requires HDMI 2.0 or later, which is quite rare on older laptops.

###  Battery
- Most laptops have either lithium-ion (Li-ion) or lithium polymer (LiPo) batteries.
- The lifetime expectancy of both battery types is about three years.
  Around this time the batteries have lost a significant fraction of their capacity,
  and LiPo batteries also tend to puff over time, especially when exposed to the heat from the laptop.
  The latter will cause a fire hazard and physical damage to the laptop from the pressure they create when
  expanding. I've seen several laptops where the thickness of the battery has more than doubled over time,
  cracking the laptop open. Therefore, Li-ion batteries should be preferred over LiPo batteries.
  Often user-replaceable batteries, especially the thick ones, are Li-ion, and the internal batteries are LiPo.
- Internal batteries can also be replaced on most laptops, but the availability of replacement batteries is worse.

### Monitor
- For good eyes, 1080p is the optimal resolution for 14". For older eyes, 1080p and 15" is a good combination.
- Higher resolutions require the use of scaling to make text large enough to be readable.
  This may cause problems with older software,
  and on Linux the use of multiple monitors with different scaling levels requires Wayland.

### LTE/5G modem (WWAN)
- If you can somehow get a multi-SIM cell phone plan or data plan or can afford the extra data plan,
  having an integrated modem in the laptop is a lot easier and more reliable than sharing internet from a phone.
- This feature is often found only on business laptops such as ThinkPads.
- 3G network will be shut down in a few years, so the modems on older laptops will then become pretty much useless.

### External GPUs
- [eGPU.io](https://egpu.io/)
- [Geizhals list](https://geizhals.eu/?cat=hwegpu)
- Prefer an enclosure with a standard ATX power supply,
  as you can then replace it in the case of a failure.
- Thunderbolt 3 and 4 bandwidth is limited to PCIe 3.0 x4,
  whereas on desktops GPUs are usually connected by PCIe 3.0 x16 or higher.
  This significantly limits the bandwidth between the CPU and GPU,
  and results in slightly worse performance than on a desktop.
  Therefore, mid-range cards will provide the best value for money.
  - Some laptops provide only PCIe 3.0 x2 over Thunderbolt,
    which limits the performance further.
- If you need more than 1 Gbps networking or multiple peripherals,
  those should be provided by a separate dock,
  so that they don't compete with the GPU for Thunderbolt bandwidth.
- [Mantiz](https://mymantiz.com/) eGPUs are good choices
- [Razer Core X Chroma is buggy on Linux](https://y.tsutsumi.io/2020/08/15/egpu-linux-core-x-chroma/)

## Monitors and TVs
### Panel technology
- Avoid TN panels, unless you're a gaming professional and absolutely need the fastest refresh rates possible.
  - They have bad viewing angles and color space
- Avoid OLED panels if the monitor/TV is connected to a computer
  - Any static objects on the screen such as the taskbar will be permanently burned in within months of active use
- VA and IPS are good panel technologies

### Sizing
- For desktop monitors, 27" and 1440p has the best price-to-performance ratio as of 2022.
- For older eyes, ~31" and 1440p may be preferred due to the larger default text size.
- Higher pixel densities are barely noticeable but require a lot more powerful hardware for gaming.
- 34" 3440x1440 ultrawide is the optimal size for professional use. You can easily fit two large documents
  or your code and the documentation on the screen at the same time.
- A 4K display should be ~40" or larger. If you install them on a monitor arm and plan your apartment properly,
  you can also use them as your TV.
- Gaming on 4K requires a very powerful computer (RX 6000 or RTX 3000 series or later GPU).

### Connectivity
- If you want to connect several devices to the same monitor,
  ensure that it has a sufficient number of connections that can drive the monitor at its full refresh rate.
  Desktop monitors often have a too old HDMI version,
  and TVs can have the latest HDMI version on only some of their ports.
- HDMI 2.0 is required for 4K 60 Hz, and HDMI 2.1 for 4K 120 Hz and variable refresh rate.
  However, with HDMI 2.1 most features such as the aforementioned are optional and their presence has to be verified manually.

### Refresh rate
- High refresh rate is more important than variable refresh rate such as FreeSync or G-Sync,
  as the latter require specific support from software.
  Therefore, look for monitors with a 120 Hz or higher refresh rate.
  Having a high refresh rate also affects the smoothness of all desktop applications and movies.
  Most movies are shot in 24 or 25 FPS, and therefore they lag a lot on 60 Hz monitors where every other frame has to
  be shown once and every other twice to match the monitor refresh rate.
  This effect is a lot smaller on high refresh rate monitors.
  On Linux variable refresh rate is not supported if you have multiple monitors.
- Some TVs already have 120 Hz refresh rates

### HDR
- On Windows HDR is supported with consumer GPUs only on fullscreen applications such as games.
  The support for HDR photos and videos is very limited.
- Properly displaying HDR content requires a high maximum brightness such as 1000 nits, aka. HDR1000.
  Especially HDR400 is not worth it, unless you want to test the HDR compatibility of various sofware.

### Misc
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
  - Makes the use of a physical security key such as a YubiKey a lot easier
- Android version: at least 12 (as of 2022)
  - Android 10 adds support for AV1 decoding
  - Android 12 adds support for the AVIF image format
- Devices with the aforementioned features:
  [Geizhals list](https://geizhals.eu/?cat=umtsover&xf=10063_12.0%7E146_Videos+%402160p%2F60fps%7E157_131072%7E162_LineageOS+Support%7E17890_n28%7E17890_n78%7E18414_NFC%7E2607_6144)
  - The 5G mmWave band n258 has been left out from the list, as it's supported by only a few devices
- Security:
  [StrongBox secure element (SE)](https://developer.android.com/training/articles/keystore#HardwareSecurityModule)
  - Only available on some devices with Android 9 and later
  - Its presence can be verified with the
    [Key Attestation Demo](https://play.google.com/store/apps/details?id=io.github.vvb2060.keyattestation)
    app.

## Networking
### Network architecture
- Don't spend extra money for a motherboard with integrated 10 Gbps Ethernet, unless you're running out of PCIe lanes.
  If you have free PCIe slots left, install a separate network card instead.
- 10 Gbps switches are expensive and noisy.
  For a home network it's more cost-effective to install a direct 10 Gbps or 40 Gbps connection between the computer
  and the server.
- PoE is very handy if you're going to install multiple Wi-Fi access points or security cameras.
  However, PoE switches are more noisy than the non-PoE versions.

### Wi-Fi routers / access points / firewalls
To be specific, the so-called "Wi-Fi routers" are not usually routers,
as they have only one connection to the internet.
True routers have multiple connections to the internet and decide,
to which physical connection each packet should be sent.
Instead, "Wi-Fi routers" are a combination of a firewall and a Wi-Fi access point (AP),
that runs some additional services such as DHCP and DNS.
However, they are often called routers for simplicity.

Most manufacturers are notoriously poor in providing security updates for their devices,
and if they do, it's often only for a few years.
If a router no longer receives security updates, you should not connect it to the internet!
Depending on the latest security updates it received,
you may be able to repurpose it as e.g. an additional Wi-Fi AP, though.
Many devices also lack important settings and features such as
802.11w management frame protection that protects from
[deauth jamming](https://github.com/SpacehuhnTech/esp8266_deauther),
and countermeasures for the
[KRACK attacks](https://www.krackattacks.com/).
However, it should be noted that old devices may not be compatible with these protections.
If you are still using such devices, you should create a separate Wi-Fi SSID for them
so that you don't have to reduce the security for the rest of your devices.

[OpenWRT](https://openwrt.org/)
is perhaps the most feature-rich and well-maintained custom firmware, and it's also open source.
Therefore, you should prefer
[devices that are compatible with OpenWRT](https://openwrt.org/supported_devices).
If you have an existing device, you should install a custom firmware on it as well.
If your device is not compatible with OpenWRT, you should use some other notable custom firmware, such as:
- [Asuswrt-Merlin](https://www.asuswrt-merlin.net/) ([supported devices](https://www.asuswrt-merlin.net/about))
- [DD-WRT](https://dd-wrt.com/) ([supported devices](https://wiki.dd-wrt.com/wiki/index.php/Supported_Devices))
- [Gargoyle](https://www.gargoyle-router.com/) ([supported devices](https://www.gargoyle-router.com/wiki/doku.php?id=supported_routers_-_tested_routers)
- [LibreCMC](https://librecmc.org/) ([supported devices](https://librecmc.org/fossil/librecmc/wiki?name=Supported_Hardware))
- [Tomato by Shibby](https://tomato.groov.pl/) ([supported devices](https://tomato.groov.pl/?page_id=164))
- [AdvancedTomato](https://advancedtomato.com/) ([supported devices](https://advancedtomato.com/downloads))
- [FreshTomato](https://freshtomato.org/) ([supported devices](https://wiki.freshtomato.org/doku.php/hardware_compatibility))

#### Features to look for, in the order of importance
- OpenWRT compatibility
- Enough flash (8 MB) and RAM (64 MB) for OpenWRT to work properly, preferably at least 16 MB flash and 128 MB RAM
- WPA3
  - For WPA3-enterprise, also look for 192-bit encryption support
- Wi-Fi 6
- High-speed ports (> 1 Gbps Ethernet, SFP+)

#### Wi-Fi routers / access points
- ~~Xiaomi Mi Router 3G v1~~
  - I'm using one of these
  - No longer available
  - [AliExpress](https://www.aliexpress.com/item/32837907107.html)
  - [OpenWRT](https://openwrt.org/toh/xiaomi/mir3g)
  - v2 is a completely different device with a lot worse hardware!
  - Wi-Fi 5 (802.11ac)
  - Flashable over serial
- ~~ASUS RT-AX58U~~
  - I don't have one, but have received positive feedback from friends and relatives who have these.
  - Now that there are finally devices compatible with both OpenWRT and Wi-Fi 6, you should get one of those instead.
  - [Hinta.fi](https://hinta.fi/1780666/asus-rt-ax58u)
  - [Geizhals](https://geizhals.eu/asus-rt-ax58u-ax3000-90ig04q0-mo3r10-a2152041.html)
  - [Asuswrt-Merlin](https://www.asuswrt-merlin.net/)
  - Wi-Fi 6 (802.11ax)
- Banana Pi
  - There are several versions available
  - [BPI-R3](https://wiki.banana-pi.org/Banana_Pi_BPI-R3)
    - [Should soon be supported by OpenWRT](https://forum.openwrt.org/t/bpi-r3-support/135972) (as of 2022)
- [Ubiquiti UniFi](https://ui.com/wi-fi)
  - If you need multiple access points for enterprise use with centralized management,
    UniFi access points are a cost-effective option with their default firmware.
    If you have only a few access points (such as in home use), you should
    [use OpenWRT instead](https://openwrt.org/toh/ubiquiti/start),
    as many UniFi access points are compatible with OpenWRT.

#### "Routers" / firewalls
- NanoPi
  - There are several versions available
  - NanoPi R5S
    - 2x 2.5 Gbps + 1x 1 Gbps Ethernet
    - Official firmware is [FriendlyWRT](https://wiki.friendlyelec.com/wiki/index.php/How_to_Build_FriendlyWrt),
      an OpenWRT fork.
    - [Not yet supported by OpenWRT](https://openwrt.org/toh/friendlyarm/nanopi_r5s) (as of 2022)
  - NanoPi R4S
    - 2x 1 Gbps Ethernet
    - [Supported by OpenWRT](https://openwrt.org/toh/friendlyarm/nanopi_r4s_v1)


### Network cards
- Intel E1G42ET
  - [Intel 82576 chip](https://ark.intel.com/content/www/us/en/ark/products/series/32261/intel-82576-gigabit-ethernet-controller.html)
  - 2x 1 Gbps Ethernet
  - PCIe 2.0 x1 or x4
- [Intel I350-T4](https://ark.intel.com/content/www/us/en/ark/products/184824/intel-ethernet-network-adapter-i350t4-for-ocp-3-0.html)
  - 4x 1 Gbps Ethernet
  - PCIe 2.1 x4
- [Intel I350-T4 v2](https://ark.intel.com/content/www/us/en/ark/products/84805/intel-ethernet-server-adapter-i350t4v2.html)
  - [Slightly better reliability/safety](https://community.intel.com/t5/Ethernet-Products/Differences-I350-T4-vs-I350-T4V2/m-p/582395)
- [Intel X520-SR2](https://ark.intel.com/content/www/us/en/ark/products/39774/intel-ethernet-converged-network-adapter-x520sr2.html)
  - 2x SFP+
  - PCIe 2.0 x8
  - Compatible only with Intel SFP+ modules and cables
  - [Compatibility table](https://compatibleproducts.intel.com/ProductDetails?activeModule=Intel%C2%AE%20Ethernet&prdName=Intel%C2%AE%20Ethernet%20Converged%20Network%20Adapter%20X520-SR2)
- [Intel X520-DA2](https://ark.intel.com/content/www/us/en/ark/products/39776/intel-ethernet-converged-network-adapter-x520da2.html)
  - 2x SFP+
  - PCIe 2.0 x8
  - Compatible only with Intel SFP+ modules and cables
  - [Compatibility table](https://compatibleproducts.intel.com/ProductDetails?activeModule=Intel%C2%AE%20Ethernet&prdName=Intel%C2%AE%20Ethernet%20Converged%20Network%20Adapter%20X520-DA2)
- Mellanox ConnectX-2
  - 2x SFP+
  - PCIe 2.0 x8
  - [Firmware](https://network.nvidia.com/support/firmware/connectx2en/)
- Mellanox ConnectX-3
  - 2x SFP+
  - PCIe 3.0 x8
  - [Firmware](https://network.nvidia.com/support/firmware/connectx3en/)
  - [Transceiver compatibility](https://www.reddit.com/r/homelab/comments/scfmiu/10gbaset_spf_transceivers_for_mellanox_connectx3/)
- Mellanox ConnectX-4
- Reddit discussions
  - [What 10 Gigabit Sfp+ Cards](https://www.reddit.com/r/PFSENSE/comments/syq7w4/what_10_gigabit_sfp_cards/)
  - [Mellanox ConnectX-2 vs ConnectX-3](https://www.reddit.com/r/homelab/comments/cf5tlg/mellnox_connectx2_vs_connectx3/)
- [Overkill build](https://michael.stapelberg.ch/posts/2021-07-10-linux-25gbit-internet-router-pc-build/)

### Switches
- Most rack-mountable switches make a lot of noise.
  Therefore, search for reviews and forum posts before buying,
  if the switch is not going to be placed in a separate server room.
  - [Reddit](https://www.reddit.com/r/homelab/comments/79gidp/silent_10gb_ethernet_managed_switch/)
- [TP-Link TL-SG3428XMP](https://www.tp-link.com/us/business-networking/managed-switch/tl-sg3428xmp/)
  - Good price for the features (as of 2022)
  - [Very noisy](https://www.reddit.com/r/TPLink_Omada/comments/w3f2af/tlsg3428xmp_v20_fan_speed_cpu_utilisation/)
- [Ubiquiti UniFi Switch Pro 48 PoE](https://eu.store.ui.com/collections/unifi-network-routing-switching/products/usw-pro-48-poe)
  - More noisy than in the specs
    - [Reddit](https://www.reddit.com/r/Ubiquiti/comments/geghko/anyone_ever_addressed_uswpro48poe_fan_noise/)
    - [Ubiquiti forum](https://community.ui.com/questions/USW-PRO-48-POE-Fan-Noise-and-Heat-Nowhere-Near-Specs/b2f7569a-10dc-432c-a4ef-08a53f63dc82)
  - Fan replacement
    - Will void the warranty
    - [Forum post](https://community.ui.com/questions/Noisy-Fan-replacement-for-USW-Pro-48-PoE/b62ff60c-7a73-4c68-8b03-0e4a561f1984)
- [Ubiquiti UniFi Switch Enterprise 48 PoE](https://eu.store.ui.com/collections/unifi-network-routing-switching/products/switch-enterprise-48-poe)
  - [Relatively silent at low loads, but noisy with high PoE load](https://community.ui.com/questions/USW-Enterprise-24-PoE-noise-levels/d9ce70c5-d00a-4e0b-ac11-7beb94974aa5)

### Transceivers
- [10Gtek 10GBase SFP+](https://www.amazon.de/-/en/gp/product/B01M8O3MAL/)
- Intel E10GSFPSR

### Racks
- [Various Ikea tables and shelves](https://wiki.eth0.nl/index.php/List_of_IkeaRacks)
  are compatible with 19" rack hardware.
  The most famous ones are the Lack tables, also known as LackRacks.
- Racks with cover panels are damn difficult to find in Finland at even remotely reasonable prices.
  Most stores only sell to business customers.
  - [StarTech 12U RK1236BKF](https://www.startech.com/en-fi/server-management/rk1236bkf)


### UPS devices
- Always use AGM or gel batteries.
  [Regular lead-acid batteries require addition of distilled water every 2-3 months when in use](https://electronics.stackexchange.com/a/210819/),
  or the UPS will damage them permanently.
  I've seen regular lead-acid batteries physically crack open within two years of use.


## USB flash drives
- The drive should have USB 3.0 or later.
- Prefer a fully metallic casing.
  Plastic ones will eventually break if stored in a pocket.
- Prefer one without a detachable protector,
  as those tend to loosen and eventually get lost over time.
- If you get one with a rotating holder mechanism,
  ensure that it's tight enough and won't loosen over time.
- Test the drive with [f3](https://fight-flash-fraud.readthedocs.io/en/latest/)
  immediately after purchasing to ensure that it's not a fake
  and that it's reliable.


## Headphones
- Read reviews and go to a store to test the headphones yourself to determine the audio quality.
- The headphones should have good audio quality without the installation of any additional software.

### Headphones / headsets
- Very few headsets have a good microphone.
  Especially wireless headsets are limited by the wireless bandwidth.
  Therefore, for the best audio quality you should use an external microphone such
  as a [Modmic](https://antlionaudio.com/) that you can attach to the headset.

### Wireless earplugs
- Active noise cancellation is a highly useful feature
- [Bluetooth audio codecs are a mess](https://www.headphonesty.com/2020/03/bluetooth-audio-codecs-explained/)
  - [AAC over Bluetooth is unstable on Android](https://www.soundguys.com/the-ultimate-guide-to-bluetooth-headphones-aac-20296/) 
- [Geizhals list](https://geizhals.eu/?cat=sphd&xf=1228_aktive+Ger%E4uschunterdr%FCckung+(ANC)%7E1231_Bluetooth%7E17987_Ladeetui%7E17987_USB-C+Ladeanschluss%7E6714_mit+Mikrofon)


## Accessories
- Adapters
  - [DisplayPort -> DVI (active)](https://www.aliexpress.com/item/32981791094.html)
  - [USB-c -> HDMI (4K 60 Hz)](https://www.aliexpress.com/item/32980806917.html)
  - [USB-c -> micro-USB](https://www.amazon.de/gp/product/B08GLNRTCD)
- Cables
  - [DisplayPort 1.4](https://www.aliexpress.com/item/4001299891742.html)
  - [HDMI 2.1](https://www.aliexpress.com/item/1005002124697606.html)
    - [Optical](https://www.aliexpress.com/item/4000860157677.html)
  - [Thunderbolt 4](https://www.aliexpress.com/item/1005003026399770.html)
  - [S/PDIF (optical audio)](https://www.amazon.de/-/en/gp/product/B00FQK3H8Q)
  - [USB-A - USB-B](https://www.amazon.de/-/en/gp/product/B07FWFVDNV)
  - [USB-A - USB-c](https://www.amazon.de/gp/product/B098DTBP29)
  - USB-c
    - [10 Gbps, 0.5-3 m, very stiff](https://www.aliexpress.com/item/1005003257832228.html)
    - [10 Gbps, 1-3 m](https://www.aliexpress.com/item/1005001400212927.html)
    - [20 Gbps, 0.5-3 m, very stiff](https://www.aliexpress.com/item/1005003257832228.html)
    - [40 Gbps, 12 cm](https://www.aliexpress.com/item/1005004279822626.html)
- Battery chargers
  - Opus BT-C900
  - [SkyRC MC3000](https://www.skyrc.com/MC3000_Charger)
  - [SkyRC Q200](https://www.aliexpress.com/item/32878229674.html)
- [Bike lamp](https://www.aliexpress.com/item/4001316728026.html)
  - Problem: The USB-c port does not negotiate properly,
    and cannot therefore be charged from a USB-c PD negotiating port,
    but only with a USB-a <-> USB-c adapter cable
    from a port that does not require negotiation to provide power.
- [Car charger](https://www.aliexpress.com/item/1005003400586617.html)
- [KVM switch (USB 3.0)](https://www.aliexpress.com/item/1005001274346519.html)
  - Problem: Client ports are USB-A, not USB-B
- [Multi-charger](https://www.aliexpress.com/item/1005003903150067.html)
  - Not compatible with the USB-c - micro-USB adapters I have tested
