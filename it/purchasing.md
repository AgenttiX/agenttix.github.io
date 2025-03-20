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


## Where to find good quality reviews
- [Gamers Nexus](https://www.gamersnexus.net/)
- [Linus Tech Tips](https://www.youtube.com/channel/UCXuqSBlHAE6Xw-yeJA0Tunw)
  used to be a good source of reviews.
  As of 2023, [not anymore](https://www.youtube.com/watch?v=FGW3TPytTjc),
  as their recent videos have had numerous issues with data and claims that are blatantly incorrect.


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
- Geizhals lists:
  [AMD](https://geizhals.eu/?cat=cpuamdam4&xf=14840_6~19779_24~5_AES-NI~5_AMD-V~5_AVX~5_AVX2~5_ECC-Unterst%FCtzung&sort=p),
  [Intel](https://geizhals.eu/?cat=cpu1151&xf=14840_4~19516_DDR5~19779_16~5_AES-NI~5_AVX~5_AVX2~5_VT-d&sort=p)
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
- [Geizhals list](https://geizhals.eu/?cat=gra16_512&xf=132_8192~20252_AV1~20252_H.264~20252_H.265~20253_AV1~20253_H.264~20253_H.265~5425_1&sort=p)
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
- [Geizhals list](https://geizhals.eu/?cat=ramddr3&xf=253_16384~254_2666~5828_DDR4~5828_DDR5~5830_DIMM~5830_DIMM+mit+ECC&sort=p#productlist)
- 8 GB is sufficient for basic tasks, but I highly recommend 16 GB, especially for gaming.
  Get 32 GB if you're programming or running other professional workloads, especially virtual desktops.
  Higher amounts of RAM are only necessary for specific use cases such as virtual machines and scientific computing.
- Frequency is not a good indicator of performance, as the latency matters a lot.
  In addition to the frequency, look for the absolute latency in nanoseconds.
  It's the latency number divided by the frequency, and lower is better.
  You should also check the maximum frequency supported by your CPU and motherboard.
- ECC memory is worth considering for professional use that requires reliability.
  On AMD this is unofficially supported by most CPUs and some consumer motherboards,
  whereas on Intel this is found only on professional hardware.


### Motherboard
- Geizhals lists:
  [AMD AM5](https://geizhals.eu/?cat=mbam5&sort=p&xf=11524_1%7E17255_1%7E18030_1%7E19226_1%7E19232_1%7E494_Onboard+TPM+2.0+Unterst%FCtzung),
  [Intel Socket 1700](https://geizhals.eu/?cat=mbp4_1700&sort=p&xf=11524_1%7E11924_1%7E17255_1%7E18030_1%7E19226_1%7E494_Onboard+TPM+2.0+Unterst%FCtzung)
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
- [Geizhals list](https://geizhals.eu/?cat=hdssd&xf=16325_3~221_3000~222_3000~2235_500~2236_500~252_960~4832_3&sort=p)
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
- [Geizhals list](https://geizhals.eu/?cat=gehps&xf=18421_4~360_850~363_semi-passiv~4174_ATX&sort=p#productlist)
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
- [Geizhals list](https://geizhals.eu/?cat=gehatx&xf=20097_1~535_Staubfilter~9709_ATX&sort=p)
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
- PCIe SATA controllers
  - If you have PCIe slot that can hold an x8 card, get a used enterprise card on eBay, e.g. PERC H200 or PERC H310.
  - Avoid cards that have port expanders in them! (e.g. JMB5XX.)
    If one of the drives connected to a port multiplier fails,
    it may interrupt connectivity for the rest of the drives,
    causing irrecoverable damage to a RAID array.
    There are also various driver issues.
    ([Forum post](https://www.truenas.com/community/resources/multiply-your-problems-with-sata-port-multipliers-and-cheap-sata-controllers.177/))
  - If you have only a PCIe x1 or x4 slot, an ASM1166-based 6-port card is an OK choice.
    The cards with more ports are based on port expanders and should be avoided.
    However, please note that the cards with PCIe x4 ports are actually only x2.
  - [Performance comparison of various controllers](https://forums.unraid.net/topic/41340-satasas-controllers-tested-real-world-max-throughput-during-parity-check/)
  - [List of controllers compatible with Unraid](https://forums.unraid.net/topic/102010-recommended-controllers-for-unraid/)


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


### Smart features
- Prefer Android TV over manufacturer-specific proprietary implementations
  - For compatibility and good image quality with future streaming services, ensure that the TV has the AV1 hardware decoder and Android TV 10 or later.
  - For compatibility with the photos of future cameras, ensure that the TV has Android TV 12 or later, as it includes support for the AVIF image format.
- To have easy access to your media, a smart TV should be compatible with Plex or Jellyfin, preferably both.
  - [Plex compatibility list](https://support.plex.tv/articles/204080173-which-smart-tv-models-are-supported/)
    - Note that unlocking the full features of Plex costs money, whereas Jellyfin is free.
  - [Jellyfin compatibility list](https://jellyfin.org/downloads/clients)
    - There is also some support for Samsung Tizen TVs, but it's rather complicated to set up (as of 2023).
      [GitHub](https://github.com/jellyfin/jellyfin-tizen),
      [Reddit](https://www.reddit.com/r/jellyfin/comments/s0438d/build_and_deploy_jellyfin_app_to_samsung_tizen/)
  - Android TV is compatible with both Plex and Jellyfin,
    and this is yet another reason to choose Android TV over manufacturer-specific proprietary implementations.


### Misc
- VESA mounting support is a must-have, as monitor arms save a lot of desk space, and you may want to install them later.
- For TVs, bigger is better, but you should think on how to mount them. Many TV stands have quite a small maximum size.


## Phones
- Phone manufacturers often provide security patches for only 1-2 years after the model is released.
  If you want to use the phone for longer, look for a phone that is supported by an alternative Android version such as LineageOS.
  - [Official list](https://download.lineageos.org/)
  - [Geizhals list](https://geizhals.eu/?cat=umtsover&xf=162_LineageOS+Support) (new models may appear with a delay)
- RAM: at least 6 GB
  - Having less RAM will result in sluggishness.
- Storage: at least 128 GB
  - Apps take a horrible amount of space these days.
- Camera
  - 4K 60 Hz video recording. 60 Hz video is a lot smoother than the 30 Hz video that most phones record.
  - Camera2 API support for RAW photography and manual control of various features such as focus,
    white balance, ISO and shutter speed.
    You can test this with the
    [Manual Camera Compatibility test app](https://play.google.com/store/apps/details?id=pl.vipek.camera2_compatibility_test)
    and the
    [Open Camera app](https://play.google.com/store/apps/details?id=net.sourceforge.opencamera).
- Modem: 5G with support for at least the n78 band, which is the primary 5G band
  [in Finland](https://www.mikrobitti.fi/uutiset/tallainen-on-uusi-5g-taajuuskaista-listasimme-myos-kaikkien-suomessa-myytavien-5g-puhelinten-tuettavat-kaistat/9597cbae-27a4-4f86-9d40-7f2bf4407216)
  - n28 band is for longer ranges with lower speeds,
    and n258 is the mmWave band for short-range connectivity for mass events such as concerts and festivals.
  - Ensure that the phone has 5G SA (standalone 5G) enabled in your area.
    In Finland this is known as "itsenäinen 5G" or 5G+.
    Otherwise, the phone will use 5G NSA (non-standalone 5G), which will use the 4G network for control signaling,
    and therefore consume more battery and have higher latencies.
    As of 2025, e.g.
    [the list of devices supported by Elisa](https://elisa.fi/5g/itsenainen-5g/#sa_puhelimet)
    is quite small. If your device is not on the list, a 5G data plan is probably not worth the price.
- NFC
  - The tags are cheap on AliExpress and can be used for various purposes
  - Makes the use of a physical security key such as a YubiKey a lot easier
- Android version: at least 12 (as of 2022), preferably the latest available
  - Android 10 adds support for AV1 decoding
  - Android 12 adds support for the AVIF image format
  - [Official list of supported media formats](https://developer.android.com/guide/topics/media/media-formats)
- Devices with the aforementioned features
  - [Geizhals list with Android 12 and official LineageOS](https://geizhals.eu/?cat=umtsover&xf=10063_12.0%7E146_Videos+%402160p%2F60fps%7E157_131072%7E162_LineageOS+Support%7E17890_n28%7E17890_n78%7E18414_NFC%7E2607_6144)
  - [Geizhals list with Android 13](https://geizhals.eu/?cat=umtsover&xf=10063_13.0%7E146_Videos+%402160p%2F60fps%7E157_131072%7E17890_n28%7E17890_n78%7E18414_NFC%7E2607_6144)
  - [Geizhals list with Android 14 and official LineageOS](https://geizhals.eu/?cat=umtsover&xf=10063_14.0%7E146_Videos+%402160p%2F60fps%7E157_131072%7E162_LineageOS+Support%7E17890_n28%7E17890_n78%7E18414_NFC%7E2607_6144)
  - The 5G mmWave band n258 has been left out from the list, as it's supported by only a few devices
- Security:
  [StrongBox secure element (SE)](https://developer.android.com/training/articles/keystore#HardwareSecurityModule)
  - Enables secure hardware-backed storage of credentials.
    (Most other credential stores on Android are based on software or firmware and can be broken.)
  - Only available on some devices with Android 9 and later
  - Its presence can be verified with the
    [Key Attestation Demo](https://play.google.com/store/apps/details?id=io.github.vvb2060.keyattestation)
    app.
- Google Pixel
  - The 5G, VoLTE and eSIM features work only in
      [networks that are certified by Google](https://pixel.withgoogle.com/5G/).
      As of 2022, this does **not** include Finland.
      This is an artificial limitation created by Google.
    - Please go to the [Google issue tracker](https://issuetracker.google.com/issues/229334870)
      and press the "+1: I am impacted" button in the top-right corner to vote for this issue to get fixed.
    - You can file a complaint to the European Consumer Centres Network according to
      [these instructions](https://forum.xda-developers.com/t/5g-connectivity-in-non-supported-countries.4438065/post-87110781).
    - Unofficial fixes
      - [Pixel 4a and Pixel 5](https://github.com/swangjang/Pixel-Redbull-Carrier-Patch)
      - [Pixel 6 Pro](https://forum.xda-developers.com/t/activate-5g-on-non-5g-country.4457071/)
      - [Pixel 7](https://forum.xda-developers.com/t/root-enable-5g-volte-and-call-screening-in-unsupported-countries.4510243/)
  - Pixel phones are among the most secure Android devices, especially with
    [GrapheneOS](https://grapheneos.org/) ([supported models](https://grapheneos.org/build#build-targets)).


## Smartwatches
- The one thing smartwatches often lack is a good battery life.
- Some smartwatches have integrated WWAN connectivity, usually 4G, aka. LTE.
  This allows you to leave your phone at home.
  However, the battery life is quite short when the WWAN is enabled, usually about a day.
- On the other hand, simpler smartwatches can reach a battery life of several weeks.
- Many smartwatches have proprietary operating systems that are not compatible with all phones.
  Therefore, you should check the compatibility with your phone before purchasing.
  - Google's [Wear OS](https://wearos.google.com/) is compatible with most Android phones and has a better selection of apps than most other smartwatches.
- Useful features to have
  - Heart rate monitor: this is among the most useful features, as it enables tracking the effects of exercise.
  - Pulse oximeter (SpO2): this measures the oxygen content in your blood and is capable of detecting sleep apnea.
  - ECG (electrocardiogram): this can detect heart issues.
  - Qi wireless charging: with Qi support you can charge the watch with the same wireless chargers that you use for other devices.
- Nice-to-have features
  - GPS: useful for tracking your exercise, but only if you leave your phone at home.
  - WWAN (4G/LTE): useful if you want to leave your phone at home.
    However, note that it significantly shortens the battery life.
- Smartwatches I have been using
  - [Xiaomi Mi Band 3](https://en.wikipedia.org/wiki/Xiaomi_Mi_Band_3) (2018-2021)
  - [Xiaomi Mi Band 6](https://en.wikipedia.org/wiki/Xiaomi_Mi_Smart_Band_6) (2021→)


## Media boxes
- Instead of using a separate media box, consider purchasing an Android TV instead.
  That way you don't need to have multiple remotes, which is easier to use especially for older people.
  [Used Android TVs](https://www.tori.fi/recommerce/forsale/search?product_category=2.93.3906.62&q=Android) and
  [Google TVs](https://www.tori.fi/recommerce/forsale/search?product_category=2.93.3906.62&q=Google)
  can be surprisingly cheap.
- [Many Android media boxes come with malware preinstalled.](https://www.youtube.com/watch?v=1vpepaQ-VQQ)
  Only use boxes that are either from trustworthy vendors or on which you can install custom firmware.
- Good devices
  - Banana Pi BPI-M5:
    [docs](https://wiki.banana-pi.org/Banana_Pi_BPI-M5),
    [wiki](https://docs.banana-pi.org/en/BPI-M5/BananaPi_BPI-M5),
    [LineageOS](https://wiki.lineageos.org/devices/m5/)
  - [Google Chromecast](https://en.wikipedia.org/wiki/Chromecast): discontinued,
    [LineageOS](https://wiki.lineageos.org/devices/sabrina/)
  - [Google TV Streamer](https://store.google.com/product/google_tv_streamer)
  - [HardKernel ODROID-C4](https://www.hardkernel.com/shop/odroid-c4/):
    [LineageOS](https://wiki.lineageos.org/devices/odroidc4/)
  - [Nvidia Shield TV](https://en.wikipedia.org/wiki/Nvidia_Shield_TV):
    [LineageOS](https://wiki.lineageos.org/devices/#nvidia)
  - Raspberry Pi 4
    - [Android TV](https://konstakang.com/devices/rpi4/)
    - [LibreELEC](https://en.wikipedia.org/wiki/LibreELEC)


## Networking
### Network architecture
- Don't spend extra money for a motherboard with integrated 10 Gbps Ethernet, unless you're running out of PCIe lanes.
  If you have free PCIe slots left, install a separate network card instead.
- 10 Gbps switches are expensive and noisy.
  For a home network it's more cost-effective to install a direct 10 Gbps or 40 Gbps connection between the computer
  and the server.
- PoE is very handy if you're going to install multiple Wi-Fi access points or security cameras.
  However, PoE switches are more noisy than the non-PoE versions.

### Internet connections / subscriptions
There are various different technologies for providing internet access to consumers.
- VDSL
  - Uses old phone cables
  - VDSL2 provides up to 200 Mbps down and 100 Mbps up
- Cable TV ([DOCSIS](https://en.wikipedia.org/wiki/DOCSIS))
  - DOCSIS 4.0 provides up to 10 Gbps down and 6 Gbps up
  - The maximum speed is shared with neighbors just like with wireless networks,
    since the homes in a neighborhood share the same TV cable.
  - Check that your operator provides a plan with a sufficient upload speed.
    In many cases the upload speed is only 10% of the download speed,
    which will significantly limit the usability of cloud storage.
  - The cable modem has to be registered with the operator.
    If you buy a used one, ensure that it's not locked to another operator.
  - The cable modems provided by operators are often poorly maintained and buggy.
    See the [cable modems section below](#cable-modems-docsis) for better devices.
- Fiber / Ethernet
  - The best choice if available for a reasonable price
  - If there is fiber construction in your neighborhood, don't get left behind!
    It can be very difficult and expensive to get a fiber connection afterwards,
    if your neighbors already have the cabling but you don't.
    It's the most cost-effective to install the fiber to the entire neighborhood at the same time.
- 4G (LTE)
  - High latency -> not suitable for gaming
- 5G (NR)
  - There are two possible modes of operation:
    - NSA = non-standalone
      - Uses the existing 4G network for control signaling
      - The 5G network is used only for data
      - High latency -> not suitable for gaming
    - SA = standalone
      - Low latency -> suitable for gaming
  - mmWave
    - Additional high-frequency band for higher speeds (n258 in Finland)
    - Very high speeds but very short range
    - Supported by very few devices and base stations (as of 2025)
  - 5G SA is a valid replacement for wired connectivity.


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
Therefore, I recommend purchasing devices that are compatible with an alternative firmware
that provides security updates for longer.
[OpenWRT](https://openwrt.org/)
is perhaps the most feature-rich and well-maintained custom firmware, and it's also open source.
Therefore, you should prefer
[devices that are compatible with OpenWRT](https://openwrt.org/supported_devices).

If you're buying an enterprise device, and especially a used one, ensure that you have access to the firmware updates!
Various manufacturers only provide firmware downloads for registered enterprise customers.
The firmware updates may also require an expensive yearly license.
At least these are known to be problematic:
- Huawei
- WatchGuard


#### Features to look for, in the order of importance
- OpenWRT compatibility
- Enough flash (8 MB) and RAM (64 MB) for OpenWRT to work properly, preferably at least 16 MB flash and 128 MB RAM
- WPA3
  - WPA3-enterprise requires also 192-bit encryption support
- Wi-Fi 6 or Wi-Fi 7
- High-speed ports (> 1 Gbps Ethernet, SFP+)


#### Wi-Fi routers / access points
- [Banana Pi](https://www.banana-pi.org/) BPI-R4:
  [docs](https://docs.banana-pi.org/en/BPI-R4/BananaPi_BPI-R4),
  [wiki](https://wiki.banana-pi.org/Banana_Pi_BPI-R4),
  [Amazon](https://www.amazon.de/dp/B0DFCTLXJC)
  - [OpenWRT](https://openwrt.org/inbox/toh/sinovoip/bananapi_bpi-r4) support
  - Wi-Fi 7 and WPA3 (over 1 Gbps Wi-Fi)
  - 2x 10 Gbps SFP+ ports
  - Can be powered over USB-c, so you can also use the device on the go.
  - Firmware is easy to install, as you can boot the device from an SD card.
  - M.2 slot for 5G modem. My recommendation is the
    [Quectel RM520N-GL](https://www.quectel.com/product/5g-rm520n-series/):
    [Amazon](https://www.amazon.de/dp/B0DP69BYJW)
    - The default package may contain only three antennas.
      Contact the seller beforehand and ensure that they will ship four antennas as required by the device!
  - Can be used as a NAS or a small general-purpose server thanks to its M.2 SSD slot and USB 3.0 port.
    (The M.2 SSD and 5G modem can be installed simultaneously.)
  - Serial console is easily accessible for debugging and initial installation of the firmware.
- [Ubiquiti UniFi](https://ui.com/wi-fi)
  - If you need multiple access points for enterprise use with centralized management,
    UniFi access points are a cost-effective option with their default firmware.
    If you have only a few access points (such as in home use), you should
    [use OpenWRT instead](https://openwrt.org/toh/ubiquiti/start),
    as many UniFi access points are compatible with OpenWRT.

<!--
- ~~Xiaomi Mi Router 3G v1~~
  - I'm using one of these
  - No longer available
  - [AliExpress](https://www.aliexpress.com/item/32837907107.html)
  - [OpenWRT](https://openwrt.org/toh/xiaomi/mir3g)
  - v2 is a completely different device with a lot worse hardware!
  - Wi-Fi 5 (802.11ac)
  - Flashable over serial
- ~~[ASUS RT-AX58U](https://www.asus.com/networking-iot-servers/wifi-routers/asus-wifi-routers/rt-ax58u/)~~
  - I don't have one, but have received positive feedback from friends and relatives who have these.
  - Now that there are finally devices compatible with both OpenWRT and Wi-Fi 6, you should get one of those instead.
  - [Hinta.fi](https://hinta.fi/1780666/asus-rt-ax58u)
  - [Geizhals](https://geizhals.eu/asus-rt-ax58u-ax3000-90ig04q0-mo3r10-a2152041.html)
  - [Asuswrt-Merlin](https://www.asuswrt-merlin.net/)
  - Wi-Fi 6 (802.11ax)
-->


#### "Routers" / firewalls
- ~~[Huawei AR1200E](https://support.huawei.com/enterprise/en/routers/ar1220e-pid-24020781/)~~
  - Serial console password can be reset from the BootROM menu (Ctrl+B)
  - The mini-USB console may not be enabled by default, and you may have to use a USB-RJ45 serial console cable instead.
  - [Default BootROM password is Admin@huawei](https://forum.huawei.com/enterprise/en/corpus-595.html)
  - [Internal flash can only be formatted from the BootROM menu (Ctrl+B)](https://support.huawei.com/enterprise/en/doc/EDOC1000154645/e1352af8/how-do-i-format-a-storage-medium)
    - Formatting the internal flash also deletes the firmware from the device.
      Therefore, copy the existing firmware file from the internal flash to a USB drive before formatting
  - Default console username is admin and password is Admin@huawei
  - The firmware is based on [Wind River Linux](https://www.windriver.com/products/linux)
  - [Firmware download](https://support.huawei.com/enterprise/en/routers/ar1220e-pid-24020781/software)
    - Unfortunately this requires registering the device,
      which is only possible for devices that have been purchased by individual client companies, not carriers.
  - How to fully reset the device and update the firmware
    - First ensure that you have access to the firmware file
    - Copy the firmware file from the internal flash to a USB stick using the console
    - Format internal flash from the BootROM menu
    - Insert a USB stick which has the firmware file at its root folder, and boot the device
    - The device should automatically boot from the USB device
    - Wait for the firmware to start
    - Copy the new firmware file to the root folder of the internal flash using the serial console
    - Disconnect the USB stick and reboot the device
    - The device should now boot the updated firmware from its internal flash
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


### VDSL2 modems
- The operator-provided modems often have ancient firmware with security issues and poor performance.
  Therefore, I recommend using a separately bought one instead, preferably one with OpenWRT if there are any available.
- [Geizhals list](https://geizhals.eu/?cat=wlanroutmod&xf=4024_VDSL2%7E529_802.11ax%7E546_WPA3%7E758_VDSL2)
- [OpenWRT compatibility list](https://openwrt.org/toh/views/toh_modem_supported?datasrt=availability&dataflt%5BModem%2A~%5D=VDSL2)
- AVM FRITZ!Box 7490
  - [Geizhals](https://geizhals.eu/avm-fritz-box-7490-20002584-20002585-a992918.html)
  - [OpenWRT support pending](https://openwrt.org/toh/avm/fritz.box.7490) ([pull request](https://github.com/openwrt/openwrt/pull/5075))
- TP-Link Archer VR200
  - [Geizhals](https://geizhals.eu/tp-link-archer-vr200-a1369252.html)
  - [Supported by OpenWRT](https://openwrt.org/toh/tp-link/vr200v)
    - Note: 2.4 GHz Wi-Fi is not supported by OpenWRT!
- TP-Link Archer VR200v
  - [Geizhals](https://geizhals.eu/tp-link-archer-vr200v-a1230225.html)
  - [Supported by OpenWRT](https://openwrt.org/toh/tp-link/vr200v)
    - Note: 2.4 GHz Wi-Fi is not supported by OpenWRT!
  - [There may be issues in accessing the serial console for flashing](https://forum.openwrt.org/t/empty-serial-console-on-archer-vr200v/118390/)


### Cable modems ([DOCSIS](https://en.wikipedia.org/wiki/DOCSIS))
- The operator-provided modems often have ancient firmware with security issues and poor performance.
  As of 2023, there are no cable modems with OpenWRT support.
  Therefore, I recommend the AVM FRITZ!Box modems.
- [Geizhals list](https://geizhals.eu/?cat=wlanroutmod&xf=4024_Kabel-TV%7E529_802.11ax%7E546_WPA3)


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


### Bluetooth
- [Bluetooth audio codecs are a mess](https://www.headphonesty.com/2020/03/bluetooth-audio-codecs-explained/)
  - [Comparison of various codecs](https://habr.com/en/post/456182/)
  - [AAC](https://en.wikipedia.org/wiki/Advanced_Audio_Coding)
    - Proprietary
    - [AAC over Bluetooth is unstable on Android](https://www.soundguys.com/the-ultimate-guide-to-bluetooth-headphones-aac-20296/)
  - [aptX](https://en.wikipedia.org/wiki/AptX)
    - Proprietary
    - There are several variations with varying quality. In general, they are not much better than SBC.
  - [CVSD](https://en.wikipedia.org/wiki/Continuously_variable_slope_delta_modulation)
    - With microphone support. Horrible quality. Use mSBC instead.
  - [LC3](https://en.wikipedia.org/wiki/LC3_(codec))
    - Successor of SBC for Bluetooth 5.2 and Android 13 ->. Use this if you can.
  - [LDAC](https://en.wikipedia.org/wiki/LDAC_(codec))
    - The encoder is open source, but the decoder is proprietary. Supported by Android 8 -> and PipeWire (Ubuntu).
    - Much better than SBC and AAC. Use this if you can.
  - [LHDC](https://en.wikipedia.org/wiki/LHDC_(codec))
    - Supported by Android 10 ->
  - [LLAC](https://en.wikipedia.org/wiki/LHDC_(codec)#LLAC)
    - Low latency verison of LHDC, aka. LHDC LL
  - [mSBC](https://www.rfwireless-world.com/Terminology/SBC-vs-mSBC-codec.html)
    - SBC with microphone support. Horrible quality, but much better than CVSD.
  - [SBC](https://en.wikipedia.org/wiki/SBC_(codec))
    - Basic codec. Support is mandatory for all stereo Bluetooth audio devices.
  - [SBC-XQ](https://en.wikipedia.org/wiki/SBC_(codec)#Higher_quality_variants)
    - SBC with a higher bitrate, resulting in quality comparable to aptX HD.
      Supported by LineageOS 15 -> and PipeWire (Ubuntu 22.10 ->)
- Standard Bluetooth does not support stereo audio output and mic input at the same time.
  If you enable the microphone, the audio will be mono and of horrible quality.
  [This is a fundamental limitation of the Bluetooth protocol.](https://superuser.com/a/1123841/)

### Headphones / headsets
- Very few headsets have a good microphone.
  Especially wireless headsets are limited by the wireless bandwidth.
  Therefore, for the best audio quality you should use an external microphone such
  as a [Modmic](https://antlionaudio.com/) that you can attach to the headset.

### Wireless earplugs
- Active noise cancellation is a highly useful feature
- [Geizhals list](https://geizhals.eu/?cat=sphd&xf=1228_aktive+Ger%E4uschunterdr%FCckung+(ANC)%7E1231_Bluetooth%7E17987_Ladeetui%7E17987_USB-C+Ladeanschluss%7E6714_mit+Mikrofon)


## Accessories
### Security
Wireless peripherals often have poor security.
- Bluetooth-based devices should have at least Bluetooth 4.2. Previous versions are fundamentally broken.
- [Logi Bolt](https://www.logitech.com/en-eu/business/work-setups/logi-bolt-wireless-technology.html) is quite secure
  - It's based on Bluetooth Low Energy 5.0,
    and uses all the security mechanisms in the Bluetooth Low Energy Core Specification 4.2.
  - When using the official dongle, Logi Bolt uses security mode 1 with security level 4.
    This uses Authenticated LE Secure Connections (LESC) encrypted pairing, which is FIPS compliant and based on
    P-256 ECDH and AES-128-CCM and is FIPS compliant.
    However, the NIST ECDH curves such as P-256 are notoriously difficult to implement securely,
    which is why I won't be surprised if vulnerabilities are found in the future.
- [Logitech Unifying](https://www.logitech.com/en-eu/resource-center/what-is-unifying.html) is broken and should not be used
  - It's [vulnerable to both eavesdropping and keystroke injection](https://www.heise.de/news/Logitech-keyboards-and-mice-vulnerable-to-extensive-cyber-attacks-4464533.html).


### Keyboards
A good keyboard should have
- ISO or ANSI layout depending on your preference
- Hot-swappable mechanical switches
- [QMK](https://qmk.fm/) or [VIA](https://www.caniusevia.com/) firmware support
- Wired connectivity
- Detachable cable with USB-c
- Wireless connectivity is a plus, but be mindful of security.
  There should be a way to turn the wireless connectivity off.

Some good keyboards
- [Keychron K8 Pro ISO](https://www.keychron.com/products/keychron-k8-pro-qmk-via-wireless-mechanical-keyboard-iso-layout-collection?variant=40283914731609)
- [GMMK Pro ISO](https://www.gloriousgaming.com/products/glorious-gmmk-pro-75-barebone-iso-black-slate)


### Mice
There are significant difference in the accuracy of mice,
and price is not an indicator of good quality.
Please see
[this guide](https://sensor.fyi/info/)
for details, and
[this list](https://sensor.fyi/mice/)
for good mice.

I'm using
[Logitech G502](https://www.logitechg.com/en-us/products/gaming-mice/g502-hero-gaming-mouse.910-005469.html)
and
[Logitech PowerPlay](https://www.logitechg.com/en-us/products/gaming-mouse-pads/powerplay-wireless-charging.943-000109.html),
and am very happy with those.

Linux support for gaming mice, keyboards and headphones is provided by
[Piper](https://github.com/libratbag/piper/)
and
[libratbag](https://github.com/libratbag/libratbag).


### Webcams
- [Logitech Brio](https://www.logitech.com/fi-fi/products/webcams/brio-4k-hdr-webcam.960-001106.html):
  [hinta.fi](https://hinta.fi/1133348/logitech-960-001106),
  [Amazon](https://www.amazon.de/-/en/Logitech-Webcam-4096x2160-Digital-Microp/dp/B06X92Z67Z/)
  - Supports 4K 30 Hz and 1080p 60 Hz.
  - USB-c 3.0
  - Comes with a detachable privacy shutter.
  - Supported by OBS Windows and Linux.
- [Logitech C920e](https://www.logitech.com/fi-fi/products/webcams/c920e-business-webcam.html):
  [hinta.fi](https://hinta.fi/2241644/logitech-960-001360)
  - 1080p 30 Hz
  - USB-A 2.0
  - The C920e (e = enterprise) variant comes with a detachable privacy shutter.
  - The microphone is disabled by default, and you have to use the Logi Tune software to enable it.
  - Supported by OBS Windows and Linux.
- If you are connecting through a USB hub, prefer webcams with USB 3.0 or later.
  This way the webcam won't consume the limited bandwidth of the USB 2.0 lanes of the hub.


### Bluetooth adapters
The documentation of the
[Home Assistant Bluetooth integration](https://www.home-assistant.io/integrations/bluetooth)
has a list of known good adapters.


### Adapters
- [DisplayPort -> HDMI](https://www.amazon.de/-/en/dp/B0CPHXZG11)
- [DVI <-> HDMI](https://www.amazon.de/-/en/dp/B07WNR45X9)
- [HDMI 2.1 90 degrees](https://www.aliexpress.com/item/1005007749638497.html)
- [USB-c -> micro-USB](https://www.amazon.de/gp/product/B08GLNRTCD)


### Cables
- [DisplayPort 1.4](https://www.amazon.de/-/en/DisplayPort-Certified-Supports-Compatible-Monitor-gray/dp/B0CLXZ26BW)
- [DisplayPort 2.1](https://www.amazon.de/-/en/DisplayPort-Certified-Supports-Compatible-Monitor-gray/dp/B0BQ9ZGRNY)
- [HDMI 2.1](https://www.amazon.de/-/en/UGREEN-48Gbps-Vision-Compatible-Monitor/dp/B0CFFFSFFN)
  - [Optical](https://www.aliexpress.com/item/1005006860125774.html)
- [S/PDIF (optical audio)](https://www.amazon.de/-/en/gp/product/B00FQK3H8Q)
- [Thunderbolt 4, 100 W](https://www.amazon.de/-/en/dp/B084Z65YJQ)
- [USB-A active extension cable](https://www.amazon.de/dp/B08ZNL4JPR)
  - Nowadays, I'd prefer a USB-c cable with adapters for better future compatibility.
- [USB-A - USB-B, 5 Gbps](https://www.amazon.de/-/en/gp/product/B07FWFVDNV)
- [USB-A - USB-c, 10 Gbps](https://www.amazon.de/gp/product/B098DTBP29)
- USB-c
  - [480 Mbps, 240 W, 0.3-2 m](https://www.amazon.de/dp/B0DHJQLGPB)
  - [480 Mbps, 240 W, 5 m](https://www.amazon.de/dp/B0CP94S896)
  - [480 Mbps, 100 W, 3 m](https://www.amazon.de/dp/B0DH2GVLR4)
  - [10 Gbps, 100 W, 0.5-3 m, very stiff](https://www.aliexpress.com/item/1005003257832228.html)
  - [10 Gbps, 100 W, 1-3 m](https://www.aliexpress.com/item/1005001400212927.html)
  - [20 Gbps, 100 W, 0.5-3 m, very stiff](https://www.aliexpress.com/item/1005003257832228.html)
  - [20 Gbps, 240 W, 2 m](https://www.amazon.de/-/en/dp/B0BJ1NT76D)
  - [40 Gbps, 100 W, 0.5-2 m](https://www.aliexpress.com/item/1005003026399770.html)
- [USB-c to HDMI, 4K 60 Hz, USB-c PD](https://www.aliexpress.com/item/1005005736129454.html)


### USB chargers
- 250 W USB GaN multi-charger with display and Wi-Fi IoT:
  [hinta.fi](https://hinta.fi/4958682/anker-innovations-prime-250w-gan-poytalaturi-hopea),
  [Amazon](https://www.amazon.de/dp/B0CZ7D9G8D)
- [200 W USB GaN multi-charger](https://www.amazon.de/dp/B0CZ7BN1MF)
- [140 W USB GaN travel charger](https://www.amazon.de/dp/B0D3DSXRG4)
- [110 W USB multi-charger](https://www.aliexpress.com/item/1005003903150067.html)
  - The USB-c ports require USB-c PD negotiation,
    and are therefore not compatible with the USB-c - micro-USB adapters I have tested
- 100 W USB GaN multi-charger:
  [hinta.fi](https://hinta.fi/3824591/ugreen-nexode),
  [Amazon](https://www.amazon.de/-/en/UGREEN-Charger-Multiple-Compatible-MacBook-black/dp/B0B6N75KFC)
  - With detachable power cord
- [20 W Qi wireless charger](https://www.amazon.de/dp/B0CXDLWLDK)


### USB hubs and docks
- [USB-A, 10 Gbps, 4 ports, USB-c power input](https://www.amazon.de/-/en/dp/B0C5593DBH)
- [USB-A KVM switch](https://www.amazon.de/dp/B0B74SPYFN)
  - Client ports are unfortunately USB-A, not USB-B or USB-c. Unfortunately, this is the case with many KVM switches.
- [USB-c dock with VGA](https://www.amazon.de/-/en/dp/B0D95W2FGJ)
- [USB-c dock with 4K 60 Hz HDMI](https://www.amazon.de/-/en/dp/B0D1XLNWP2)
- Note that on USB hubs the USB 2.0 and USB >= 3.0 connectivity are separate.
  Therefore, the total bandwidth of a USB >= 3.0 hub is only 480 Mbps for USB 2.0 devices.
  This means that if you have several USB 2.0 devices connected to the hub, the link can easily become saturated,
  even though the USB >= 3.0 lanes of the hub have plenty of capacity left.
  This is a technical limitation of the USB standard.


## Other
- Battery chargers
  - Opus BT-C900
  - [SkyRC MC3000](https://www.skyrc.com/MC3000_Charger)
  - [SkyRC Q200](https://www.aliexpress.com/item/32878229674.html)
- Power strips
  - [10-port 5 m power strip with surge protection and USB ports](https://www.amazon.de/-/en/dp/B0CS68RVBL)
  - [7-socket rack power strip](https://www.amazon.de/dp/B002U03PZU)
  - [8-socket rack power strip](https://www.amazon.de/-/en/dp/B01MEHQ4T7)
  - [5 m power strip with EMI filter and surge protection](https://www.amazon.de/dp/B09XQZR4G9)
  - [Tiny 3x euro socket power strip](https://www.amazon.de/dp/B07JL476G3)
- [HDMI 2.1 switch](https://www.aliexpress.com/item/1005005070087774.html)
- [Rack mounting kit for HP switches](https://www.amazon.de/dp/B0B6RPMQYR)
- [Bike lamp](https://www.aliexpress.com/item/4001316728026.html)
  - Problem: The USB-c port does not negotiate properly,
    and cannot therefore be charged from a USB-c PD negotiating port,
    but only with a USB-a <-> USB-c adapter cable
    from a port that does not require negotiation to provide power.
- [Silicone soldering mat](https://www.amazon.de/dp/B07KJDMH62)
- [Smart card reader](https://www.amazon.de/-/en/dp/B08HVYHMZH)
- [IEC C14-C13 extension cable with switch](https://www.amazon.de/dp/B07ZJHZW2Q)
- [Cable management sleeve](https://www.amazon.de/-/en/dp/B08V8HLQPQ)
