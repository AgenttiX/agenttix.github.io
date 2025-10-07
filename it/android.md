---
layout: default
title: Android
---

# Android

## Installation of third-party apps
Warning!
[Google will block the installation of unverified applications](https://arstechnica.com/gadgets/2025/08/google-will-block-sideloading-of-unverified-android-apps-starting-next-year/)
starting in March 2026 on all devices with Google Play services.
If your device has the Google Play Store, you won't be able to install apps from outside the Play Store,
unless the app developer has submitted their government ID to Google and got Google to sign their app.
**This is the end of Google's Android as an open platform.**
To avoid this, switch to
[GrapheneOS](https://grapheneos.org/),
since it enables the installation of Google Play services in a sandbox,
or switch to a custom ROM that does not have Google Play services at all.


## EU digital wallet and age verification app
EU is developing its
[digital wallet](https://github.com/eu-digital-identity-wallet) and
[age verification (AV) app](https://github.com/eu-digital-identity-wallet/av-app-android-wallet-ui)
for Android and iOS.
Unfortunately, as of 2025 according to the current plans, they will require Google Play Integrity verification.
This means that in order to use the apps, the user must have Google Play services installed on their phone,
and they will therefore have to accept
[Google Play terms of service](https://play.google.com/about/play-terms/)
and
[Google terms of service](https://policies.google.com/terms).
In order to access the basic functions of a citizen,
one must not be required to accept the terms of a private company,
especially of one from outside the EU.

To avoid this, please comment and vote on these GitHub issues:
[#15](https://github.com/eu-digital-identity-wallet/av-app-android-wallet-ui/issues/15),
[#19](https://github.com/eu-digital-identity-wallet/av-app-android-wallet-ui/issues/19),
[#22](https://github.com/eu-digital-identity-wallet/av-app-android-wallet-ui/issues/22),
[#29](https://github.com/eu-digital-identity-wallet/av-app-android-wallet-ui/issues/29),
[#38](https://github.com/eu-digital-identity-wallet/av-app-android-wallet-ui/issues/38).

And these discussions:
[#19](https://github.com/eu-digital-identity-wallet/av-doc-technical-specification/discussions/19)

Other already closed issues:
[#287](https://github.com/eu-digital-identity-wallet/eudi-app-android-wallet-ui/issues/287),
[#390](https://github.com/eu-digital-identity-wallet/eudi-app-android-wallet-ui/issues/390)
[#576](https://github.com/eu-digital-identity-wallet/eudi-doc-architecture-and-reference-framework/issues/576)


## Version history
- Android 10
  - Support for [AV1](https://en.wikipedia.org/wiki/AV1) video decoding
  - [Project Mainline](https://source.android.com/docs/core/ota/modular-system),
    which enables system components to be updated through Google Play
    instead of waiting for the device manufacturer to release a device-specific update.
- Android 12
  - Support for the [AVIF](https://en.wikipedia.org/wiki/AVIF) image format
  - [WireGuard VPN support is enabled by default in the Generic Kernel Image (GKI).](https://www.xda-developers.com/google-adds-wireguard-vpn-android-12-linux-kernel-5-4/)
    However, you need root access to use the kernel module.
    Also, the availability of the kernel module may depend on the device,
    as some manufacturers may use kernels that have WireGuard disabled.
- Android 13
  - Support for Bluetooth LE audio and the LC3 audio codec
  - [Updatable Bluetooth module](https://source.android.com/docs/core/ota/modular-system/bluetooth)
- Android 14
  - Support for [AV1](https://en.wikipedia.org/wiki/AV1) video encoding
- Android 16
  - Support for [APV](https://en.wikipedia.org/wiki/Advanced_Professional_Video) encoding and decoding
  - Desktop mode
  - [Linux terminal](#linux-terminal)
  - Connection to multiple speakers and headphones simultaneously with Bluetooth LE Audio Auracast
- [Official list of supported media formats](https://developer.android.com/guide/topics/media/media-formats)


## Apps
These are some of the apps that I have found useful.

- [112 Suomi](https://112.fi/112-suomi)
- [3DMark](https://play.google.com/store/apps/details?id=com.futuremark.dmandroid.application)
- [AdAway](https://adaway.org/) (GPLv3, [GitHub](https://github.com/AdAway/AdAway))
  - Requires root
- [AppLock](https://play.google.com/store/apps/details?id=com.sp.protector.free)
- [Authy](https://authy.com/)
- [BOINC](https://f-droid.org/en/packages/edu.berkeley.boinc/) (GPLv3+)
  - Use only on devices that don't have a battery, e.g. media boxes,
    as batteries can't withstand the prolonged high temperatures.
- [Briar](https://briarproject.org/) (GPLv3, [GitLab](https://code.briarproject.org/briar/briar))
- [Call Recorder](https://f-droid.org/en/packages/com.github.axet.callrecorder/) (GPLv3, [GitLab](https://gitlab.com/axet/android-call-recorder))
- [CellMapper](https://play.google.com/store/apps/details?id=cellmapper.net.cellmapper)
- [CREDO Detector](https://play.google.com/store/apps/details?id=science.credo.mobiledetector)
- [Digital Wellbeing](https://play.google.com/store/apps/details?id=com.google.android.apps.wellbeing)
  - Preinstalled on some devices, and included in some Google Apps packages.
    Possibilities of installing it afterwards are very limited.
- [DriveDroid](https://www.drivedroid.io/)
- [DRM Info](https://play.google.com/store/apps/details?id=com.androidfung.drminfo)
- [F-Droid](https://f-droid.org/)
- [Findroid](https://play.google.com/store/apps/details?id=dev.jdtech.jellyfin)
- [Firefox](https://play.google.com/store/apps/details?id=org.mozilla.firefox)
- [FlorisBoard](https://play.google.com/store/apps/details?id=dev.patrickgold.florisboard) (Apache 2.0, [GitHub](https://github.com/florisboard/florisboard))
- [Fossify Keyboard](https://play.google.com/store/apps/details?id=org.fossify.keyboard) (GPLv3, [GitHub](https://github.com/FossifyOrg/Keyboard))
- [Google Fit](https://play.google.com/store/apps/details?id=com.google.android.apps.fitness)
- [Google SMB client](https://github.com/google/samba-documents-provider)
- [GSam Battery Monitor](https://play.google.com/store/apps/details?id=com.gsamlabs.bbm)
  ([pro](https://play.google.com/store/apps/details?id=com.gsamlabs.bbm.pro))
- [hueManic](https://play.google.com/store/apps/details?id=com.urbandroid.hue)
- [IP Webcam](https://play.google.com/store/apps/details?id=com.pas.webcam)
- [Jellyfin](https://play.google.com/store/apps/details?id=org.jellyfin.mobile)
  (GPLv2, [GitHub](https://github.com/jellyfin/jellyfin-android))
- [K-9 Mail](https://k9mail.app/)
  (Apache 2.0, [GitHub](https://github.com/thundernest/k-9))
- [KDE Connect](https://play.google.com/store/apps/details?id=org.kde.kdeconnect_tp)
  (GPLv2, [GitHub](https://github.com/KDE/kdeconnect-android))
- [Keepass2Android](https://play.google.com/store/apps/details?id=keepass2android.keepass2android)
  (GPLv3, [GitHub](https://github.com/PhilippC/keepass2android))
- [Manual Camera Compatibility](https://play.google.com/store/apps/details?id=pl.vipek.camera2_compatibility_test)
- [Notify for Mi Band](https://play.google.com/store/apps/details?id=com.mc.miband1)
- [Obsidian](https://play.google.com/store/apps/details?id=md.obsidian)
- [Olauncher](https://play.google.com/store/apps/details?id=app.olauncher)
  (GPLv3, [F-Droid](https://f-droid.org/en/packages/app.olauncher/),
  [GitHub](https://github.com/tanujnotes/Olauncher))
  - Paid version: [Pro Launcher](https://play.google.com/store/apps/details?id=app.prolauncher)
- [OONI Probe](https://play.google.com/store/apps/details?id=org.openobservatory.ooniprobe)
- [OpenCamera](https://play.google.com/store/apps/details?id=net.sourceforge.opencamera)
  - [AVIF is not yet supported, but support has been requested.](https://sourceforge.net/p/opencamera/tickets/963/)
- [OpenKeychain](https://www.openkeychain.org/)
- [OpenVPN for Android](https://play.google.com/store/apps/details?id=de.blinkt.openvpn)
- [Orbot](https://play.google.com/store/apps/details?id=org.torproject.android)
- [PCMark](https://play.google.com/store/apps/details?id=com.futuremark.pcmark.android.benchmark)
- [Personal Safety](https://play.google.com/store/apps/details?id=com.google.android.apps.safetyhub)
  - Preinstalled on some devices. Possibilities of installing it afterwards are very limited.
- [Plex](https://play.google.com/store/apps/details?id=com.plexapp.android)
- [Plexamp](https://play.google.com/store/apps/details?id=tv.plex.labs.plexamp)
- [Plex Dash](https://play.google.com/store/apps/details?id=tv.plex.labs.dash)
- [Prey](https://preyproject.com/)
- [ProCam X](https://play.google.com/store/apps/details?id=com.intermedia.hd.camera.pro)
- SD Maid
  - [SD Maid 1](https://play.google.com/store/apps/details?id=eu.thedarken.sdm) for old Android versions
    ([pro](https://play.google.com/store/apps/details?id=eu.thedarken.sdm.unlocker),
    [GitHub](https://github.com/d4rken-org/sdmaid))
  - [SD Maid 2/SE](https://play.google.com/store/apps/details?id=eu.darken.sdmse) for new Android versions
    ([GitHub](https://github.com/d4rken-org/sdmaid-se))
  - Requires root
- [Signal](https://play.google.com/store/apps/details?id=org.thoughtcrime.securesms)
- [SnoopSnitch](https://f-droid.org/packages/de.srlabs.snoopsnitch/)
  - Requires root
  - The version in Google Play does not have all the features. Download from F-Droid instead.
- [Speedtest](https://play.google.com/store/apps/details?id=org.zwanoo.android.speedtest)
- [Sleep as Android](https://play.google.com/store/apps/details?id=com.urbandroid.sleep)
- [Swift Backup](https://play.google.com/store/apps/details?id=org.swiftapps.swiftbackup)
  - Requires root
- [Syncthing](https://play.google.com/store/apps/details?id=com.nutomic.syncthingandroid)
- [Tankille](https://play.google.com/store/apps/details?id=fi.creosys.fuelfellow)
- [TeamViewer QuickSupport](https://play.google.com/store/apps/details?id=com.teamviewer.quicksupport.market)
- [Termux](https://play.google.com/store/apps/details?id=com.termux)
- [Titanium Backup](https://play.google.com/store/apps/details?id=com.keramidas.TitaniumBackup)
  ([pro](https://play.google.com/store/apps/details?id=com.keramidas.TitaniumBackupPro))
  - Requires root
- [Tor Browser](https://play.google.com/store/apps/details?id=org.torproject.torbrowser)
- [VLC](https://play.google.com/store/apps/details?id=org.videolan.vlc)
- [WiGLE](https://play.google.com/store/apps/details?id=net.wigle.wigleandroid)
- [WireGuard](https://play.google.com/store/apps/details?id=com.wireguard.android)
- [Xournal++](https://play.google.com/store/apps/details?id=online.xournal.mobile)
- [X-Plore](https://play.google.com/store/apps/details?id=com.lonelycatgames.Xplore)
- [YouTube ReVanced](https://github.com/revanced)
  - To install, download [ReVanced Manager](https://github.com/revanced/revanced-manager)
  - If you don't have root, you will also need the
    [official YouTube apk](https://www.apkmirror.com/apk/google-inc/youtube/)
    and
    [ReVanced MicroG (GMSCore)](https://github.com/ReVanced/GmsCore), [instructions](https://rvx.to/gmscore/)
- [YouTube ReX ReVanced Extended](https://rvx.to/youtube-rex/)
  - First install [ReVanced MicroG (GMSCore)](https://github.com/ReVanced/GmsCore), [instructions](https://rvx.to/gmscore/)


### Play Integrity and SafetyNet testers
- [Play Integrity API Checker](https://play.google.com/store/apps/details?id=gr.nikolasspyr.integritycheck)
- [SafetyNet Integrity Checker](https://play.google.com/store/apps/details?id=com.flinkapps.safteynet)
- [YASNAC](https://play.google.com/store/apps/details?id=rikka.safetynetchecker)


### Apps that are likely not to work on rooted devices
Tested on OnePlus 9 Pro with the Play Integrity Fix Magisk module.
- [Bank Norwegian](https://play.google.com/store/apps/details?id=com.banknorwegian)
- [Ingress](https://play.google.com/store/apps/details?id=com.nianticproject.ingress)
- [S-mobiili](https://play.google.com/store/apps/details?id=fi.spankki)


### Apps that work on rooted devices
Tested on OnePlus 9 Pro with the Play Integrity Fix Magisk module.
- [Danske ID](https://play.google.com/store/apps/details?id=com.danskebank.danskeid)
- [Danske Mobiilipankki](https://play.google.com/store/apps/details?id=com.danskebank.mobilebank3.fi)
- [Google Wallet](https://play.google.com/store/apps/details?id=com.google.android.apps.walletnfcrel)
- [MobilePay](https://play.google.com/store/apps/details?id=fi.danskebank.mobilepay)
- [Nordnet](https://play.google.com/store/apps/details?id=com.nordnet)
- [OmaElisa](https://play.google.com/store/apps/details?id=com.saunalahti.oma)
- [OP-mobiili](https://play.google.com/store/apps/details?id=fi.op.android.opmobiili)


## 5G connectivity
5G can be implemented in two ways that are significantly different from each other.
Non-standalone 5G (NSA) uses the 4G network for control and signaling,
whereas standalone 5G (SA) uses only the 5G network.
NSA was the first implementation to arrive and is still the most common one,
but it has high latency and high battery use.

Most devices technically support 5G SA, but unfortunately many of them have SA disabled in the software.
To identify whether your Android phone is connected with SA or NSA, go to Settings -> About phone -> SIM status.
In the "Mobile data network type" you should see "5G SA" or "5G NSA".
For further details, enable developer mode and enter *#*#4636#*#* in the dialer.

5G SA device compatibility
- [Official list by Elisa](https://elisa.fi/5g/itsenainen-5g/#sa_puhelimet)
- [Instructions for enabling 5G SA on OnePlus 7 - 9](https://mt-tech.fi/en/modify-oneplus-7-pro-5g-8-and-8-pro-nr-lte-a-band-combos/)
- [Apple devices do not support 5G SA without custom configuration](https://yhteiso.elisa.fi/puheliittymaet-7/milloin-5g-standalone-tulee-iphone-puhelimiin-526522)


## Linux terminal
Android 16 introduces Linux Terminal,
which in fact is a full Linux virtual machine running on top of the
[Android Virtualization Framework (AVF)](https://source.android.com/docs/core/virtualization)
using
[KVM](https://en.wikipedia.org/wiki/Kernel-based_Virtual_Machine) or
[Gunyah](https://github.com/quic/gunyah-hypervisor).
It also supports GUI applications with Wayland.


## Pros and cons of custom ROMs
### Pros
- Better privacy: no telemetry to the manufacturer
- Better security
  - Faster updates and newer Android version
- Newer Android version with new and better features


### Cons
- The camera may not work at its full resolution for either photos or videos
  - In many phones 4K 60 Hz recording and above is not available on custom ROMs,
    as it's based on a proprietary API.
    [OnePlus blog post](https://community.oneplus.com/thread/477075)
- There may be bugs specific to your device model.
  Some features may not work at all,
  and the only way to know if such major bugs exist is by testing the ROM on your device.


## Links for devices I've tested
Whichever ROM or kernel you use as your daily driver,
it should have SELinux set to enforcing.
Setting SELinux to permissive opens up
a vulnerability that allows any installed app to gain root access.
([XDA Developers](https://www.xda-developers.com/permissive-selinux-dangers-exploits/),
[Twitter](https://twitter.com/topjohnwu/status/1359054106019565571),
[Reddit](https://www.reddit.com/r/Android/comments/lfye5r/comment/gmoi05a/),
[GitHub](https://github.com/vvb2060/Magica))


### OnePlus 6 (enchilada)
- [LineageOS](https://download.lineageos.org/enchilada)
- [TWRP](https://twrp.me/oneplus/oneplus6.html)
- [Stock ROM](https://www.oneplus.com/global/support/softwareupgrade/details?code=PM1574156173727)
- Kernel
  - [CleanSlate](https://forum.xda-developers.com/t/kernel-cleanslate-q-v3-7-9-flashlight-led-kcal-fingerprnt-battery-25jul.3797668/) (OxygenOS-based ROMs only?)
  - [ElementalX](https://forum.xda-developers.com/t/kernel-april-4-elementalx-op6-6-02.3799054/) (OxygenOS-based ROMs only?)


### OnePlus 9 Pro (lemonadep)
- [LineageOS](https://wiki.lineageos.org/devices/lemonadep/)
  - [LineageOS 21 (Android 14) XDA thread](https://xdaforums.com/t/rom-official-lemonadep-14-lineageos-21.4656703/)
- [TWRP](https://twrp.me/oneplus/oneplus9pro.html)
- [Stock ROM](https://service.oneplus.com/global/search/search-detail?id=2096329)
  - Note that this page may have an older firmware than what's available with OTA.
    In that case, use the OTA firmware instead of the one available from the website,
    and skip the manual update of the additional firmware partitions.
- Kernel
  - [blu_spark](https://xdaforums.com/t/kernel-blu_spark-r158-op9-pro-a13-custom.4286037/)
- Camera mod
  - Reddit posts
    - [OnePlus 9 Pro Low Max Camera Resolution](https://www.reddit.com/r/LineageOS/comments/x0rplf/oneplus_9_pro_low_max_camera_resolution/)
    - [LineageOS on OnePlus 9 Pro?](https://www.reddit.com/r/LineageOS/comments/wxrww2/lineageos_on_oneplus_9_pro/)
    - [What's up with the cameras on LOS?](https://www.reddit.com/r/LineageOS/comments/109zi7o/whats_up_with_the_cameras_on_los/)
    - [OnePlus 9 Pro (lemonadep): the new camera app doesn't see the aux cameras (LOS 20)](https://www.reddit.com/r/LineageOS/comments/103dxct/oneplus_9_pro_lemonadep_the_new_camera_app_doesnt/)
    - [OnePlus9Pro What's working or isn't?](https://www.reddit.com/r/LineageOS/comments/s7gz6l/oneplus9pro_whats_working_or_isnt/)
    - [OnePlus 9Pro LineageOS camera](https://www.reddit.com/r/LineageOS/comments/pkouh4/oneplus_9pro_lineageos_camera/)


### Samsung Galaxy Note 3 LTE (SM-N9005, hlte)
- [LineageOS](https://wiki.lineageos.org/devices/hlte/)
  - Official download is no longer available
  - [Unofficial LineageOS 20](https://xdaforums.com/t/rom-unofficial-13-lineageos-20-0-for-samsung-galaxy-note-3-hlte-h3gduoschn.4519389/) (Android 13)
- [TWRP](https://twrp.me/samsung/samsunggalaxynote3qualcomm.html)
- [Lolz kernel](https://forum.xda-developers.com/t/clang-13-lolz-kernel-v16-android-9-10-11-stable.3812469/)
  ([download](https://www.pling.com/p/1410846/))
- [Stock ROM](https://sfirmware.com/samsung-sm-n9005/)


### Samsung Galaxy Note 2 LTE (GT-N7105, t0lte)
- [LineageOS](https://wiki.lineageos.org/devices/t0lte/)
  - [Unofficial LineageOS 14](https://forum.xda-developers.com/t/rom-eol-7-1-2-official-lineageos-for-t0lte.3538310/) (Android 7,
    [download](https://androidfilehost.com/?fid=1395089523397906488))
  - [Unofficial LineageOS 20](https://xdaforums.com/t/rom-unofficial-13-n7105-t0lte-samsung-galaxy-note-2-lte-lineageos-20-0-alpha.4516507/)
- [TWRP](https://twrp.me/samsung/samsunggalaxynote2n7105.html)
- [Stock ROM](https://sfirmware.com/samsung-gt-n7105/)


### Samsung Galaxy Note 8 (SM-N950F, greatlte)
- [Unofficial LineageOS 19](https://forum.xda-developers.com/t/lineageos-19-1-android-12l-signature-spoofing-ota-updates-for-s8-s8-note8.4370375/) (Android 12)
- [Unofficial LineageOS 20](https://forum.xda-developers.com/t/lineageos-20-0-android-13-signature-spoofing-ota-updates-for-s8-s8-note8.4485527/) (Android 13)
- [Unofficial LineageOS 21](https://xdaforums.com/t/lineageos-21-0-android-14-signature-spoofing-ota-updates-for-s8-s8-note8.4655373/) (Android 14)
- [TWRP](https://twrp.me/samsung/samsunggalaxynote8.html)
- Kernel
  - All these have SELinux set to permissive and
    [should not therefore be used](https://www.reddit.com/r/Android/comments/lfye5r/selinux_permissive_romskernels_are_very_bad/)!
  - [A2N Kernel](https://forum.xda-developers.com/t/kernel-9-a2n-kernel-for-galaxy-s8-s8-note8-exynos-high-end-stable-v-2022-07-01.4399227/)
  - [DeluxeROM & kernel](https://forum.xda-developers.com/t/deluxerom-v32-n950f-g955f-g950f-dug6-pie-aroma-romcontrol-kernel-final.3784712/)
  - [RAD Kernel](https://forum.xda-developers.com/t/kernel-q-aosp-oneui-2-r4-rad-kernel-n950-f-n-fd.4172681/)
  - [RZ Kernel](https://forum.xda-developers.com/t/kernel-eas-eol-9-10-treble-n950n-f-fd-rz-kernel-for-samsung-galaxy-note-8.3916568/)
- Stock ROM:
  [SamMobile](https://www.sammobile.com/samsung/galaxy-note-8/firmware/)
  [Samsung Fan Club](https://sfirmware.com/samsung-sm-n950f/)


### Samsung Galaxy Tab 3 10.1 (GT-P5220)
- [LineageOS](https://forum.xda-developers.com/t/rom-gt-p52xx-unofficial-7-1-2-lineageos-14-1.3587761/)
- [TWRP](https://forum.xda-developers.com/t/recovery-gt-p52xx-unofficial-twrp-3-x-for-samsung-galaxy-tab-3-10-1.3340938/)


## Google Apps
- [MindTheGapps](https://wiki.lineageos.org/gapps) ([Repository](https://gitlab.com/MindTheGapps))
  - Recommended for LineageOS
  - Can be installed with the Lineage recovery,
    but not with TWRP due to differences in the mount paths (as of writing in 2025).
- [FlameGApps](https://flamegapps.github.io/)
  - Good Google Apps for Android 12.
  - For Android 12 I used the basic package with the following extensions:
  - I'm using the basic package with the following extensions
    - Android Auto
    - Google Search + Assistant
    - Google TTS
    - Google WebView
- [Open GApps](https://opengapps.org/)
  - Good Google Apps for Android <= 11. The nano version was my go-to GApps.
- [NikGApps](https://nikgapps.com/)


## Custom ROM installation steps
These instructions look very complicated, but they are actually quite straightforward,
unless you have a device with the A/B partition scheme or without a separate recovery partition.

- Download (These may take a while, so start the downloads before reading further.)
  - Latest stock ROM (if available)
  - Custom ROM
  - TWRP or some other custom recovery
  - (Custom kernel)
  - (Google Apps)
  - (Magisk)
- Upgrade the stock ROM to get low-level firmware upgrades (if doing a clean install and if it's possible)
  - The stock ROM may contain newer firmware for the modem, bluetooth etc., which improves security and reliability.
    Some of this firmware may be saved beyond the usual partitions,
    and can therefore be carried on to the custom ROM
    even though the system and data partitions will be wiped during the installation of the custom ROM. 
  - Please check beforehand, though, that the newer stock ROM doesn't lock the bootloader or introduce other additional restrictions.
- Boot the device to the stock firmware and test that all features work.
  This way if you have any issues later, you will know if it's a hardware issue or caused by the custom firmware.
  Test especially these features:
  - Phone calls
  - SMS
  - VoLTE / VoWIFI (On some devices, this has to be used at least once with the stock firmware to provision
    [IMS](https://en.wikipedia.org/wiki/IP_Multimedia_Subsystem).)
  - Camera, including all special imaging modes (4K 60 Hz, 4K 120 Hz, 8K, zoom, macro, monochrome etc.)
- Boot the phone to fastboot mode
- Select the boot slot you want to install to
  - `sudo fastboot --set-active=a` (or b)
- Install fastboot-installable official firmware from the stock ROM (if not already upgraded)
  - Unzip the official firmware zip. If it contains only `payload.bin` instead of separate files for each partition,
    you can use.
    [Android OTA Payload Extractor](https://github.com/tobyxdd/android-ota-payload-extractor)
    to extract the file.
  - Flash the fastboot-flashable partitions using
    [my scripts](https://github.com/AgenttiX/linux-scripts/tree/master/android).
  - Flash the LineageOS `boot.img`, `dtbo.img` and `vbmeta.img` over the default ones.
    - DTBO = Device Tree Blob for Overlay, which contains information about the hardware of the device.
    - vbmeta = [Android Verified Boot (AVB)](https://wiki.postmarketos.org/index.php?title=Android_Verified_Boot_(AVB)) metadata
  - If you get the error `Flashing is not allowed for Critical Partitions`, reboot after installing the LineageOS `boot.img` and run the script using the fastboot mode of the LineageOS recovery.
- Boot to recovery (TWRP)
  - Try these in this order until one of them works
    - Samsung devices
       1) `sudo heimdall flash --RECOVERY <TWRP image>.img`
       2) Use Odin
    - Fastboot devices
      1) `sudo fastboot flash recovery <TWRP image>.img` and boot from the on-device menu
      2) `sudo fastboot boot <TWRP image>.img`
      3) `sudo fastboot flash boot <TWRP image>.img` and boot from the on-device menu
  - If TWRP gets stuck at the logo, try an older version.
- Install ADB-installable firmware from the stock ROM (if doing a clean install) using
  [my scripts](https://github.com/AgenttiX/linux-scripts/tree/master/android).
- ROM (LineageOS)
  - Select the boot slot you want to install to.
  - Wipe the system and cache partitions
    - On devices without a separate recovery partition TWRP cannot be booted without a working OS installation,
      so don't reboot after wiping system before LineageOS is installed.
  - Select the boot slot you don't want to install to,
    since the LineageOS zip will auto-install itself to the slot that is not active at the moment.
  - Upload the LineageOS zip to the device.
    (If your device does not require a reboot to the LineageOS recovery,
    then you can push the rest of the zips, e.g. Google Play and Magisk, here.)
    You can use ADB for this: `adb push <file>.zip /sdcard/`
  - Install LineageOS.
  - Go to the reboot menu and select the installed slot before rebooting.
  - Reboot the device to the recovery. (This may be necessary to install Google Apps,
    since the installer may require the recovery Android version to match that of the OS.)
  - Ensure that the device rebooted to the correct slot.
    If not, reboot to fastboot, select the correct slot and reboot to recovery.
- Install the rest of the zips
  - If the device booted to the LineageOS recovery, click "Apply update" and send the zips with `adb sideload <file>.zip`.
  - Install regardless of the signature warnings. They merely warn that the additional zips aren't provided by LineageOS.
- Google Apps
- Kernel (if available)
- TWRP zip (on devices without a recovery partition)
  - This will install to both slots.
- Root (Magisk)
  - The Magisk .apk may have to be renamed to a .zip for it to work.
  - TWRP installation wipes Magisk, so you have to do this for both slots when upgrading.
- Reboot to system

([XDA discussion of proper installation order](https://forum.xda-developers.com/t/what-is-the-proper-order-of-flashing-rom-kernel-root-gapps-and-anti-throttle.3651521/))


## Root installation steps
- Install Magisk when installing the ROM as above
- Install [Magisk Manager](https://github.com/topjohnwu/Magisk)
- Go to Magisk Manager settings and set these:
  - Hide Magisk app
  - Enable Zygisk
  - Enable Zygisk DenyList
  - [Show system and OS apps in Zygisk DenyList](https://i.imgur.com/jsu2Xsm.jpg)
- Add these apps to the DenyList
  - Google Play services
  - Google Play Store
  - (Google Services Framework)
  - Google Wallet
  - All apps related to banking and payments
  - All streaming apps
  - All other apps that refuse to work on rooted phones
- Install [Shamiko](https://github.com/LSPosed/LSPosed.github.io/releases)
- Install [TrickyStore](https://github.com/5ec1cff/TrickyStore)
- Install [PIFS](https://tryigit.dev/pif/) ([GitHub](https://github.com/tryigit/PlayIntegrityFix))
- If using an old firmware or old device, these additional tools may help
  - [LSposed_mod](https://github.com/mywalkb/LSPosed_mod)
  - [Zygisk Next](https://github.com/Dr-TSNG/ZygiskNext)
  - [Play Integrity Fix](https://github.com/chiteroman/PlayIntegrityFix)
  - [Zygisk Assistant](https://github.com/snake-4/Zygisk-Assistant)
  - [MagiskHide Props Config](https://github.com/Magisk-Modules-Repo/MagiskHidePropsConf)
  - [Google Pay SQlite Fix Module](https://forum.xda-developers.com/t/working-magisk-with-google-pay-as-of-gms-17-1-22-on-pie.3929950/page-9#post-79643248)
  - [Universal SafetyNet Fix](https://github.com/kdrag0n/safetynet-fix)
- Reboot
- Delete app data and cache for the aforementioned Google apps
- Install and run one of the Play Integrity or SafetyNet testers mentioned above
  - Your device should now pass the check
- Test that key attestation works with the
  [Key Attestation Demo](https://play.google.com/store/apps/details?id=io.github.vvb2060.keyattestation)
- Delete app data and cache for the apps that still refuse to work
- Test results for OnePlus 9 Pro on 2025-01-27 using Play Integrity Fix Magisk module
  - [YASNAC](https://play.google.com/store/apps/details?id=rikka.safetynetchecker)
    - Basic Integrity: OK
    - CTS profile match: OK
    - Evaluation type: BASIC
  - [SafetyNet Integrity Checker](https://play.google.com/store/apps/details?id=com.flinkapps.safteynet)
    - SafetyNet
      - Basic Integrity: Success
      - CTS Profile Match: Success
      - Response Signature Verification: Success
    - Play Integrity
      - Response Signature Verification: Success
      - Account Verification: Success
      - Device Integrity: Success
      - App Integrity: Success


## Setting up the device
The initial setup menu can be very buggy, and easily gets stuck in an eternal loop.
Therefore, when initially setting up the device, skip all optional setup menus and do the configuration later.
If you decide not to follow my advice and end up with a stuck initial setup menu,
just factory reset the device without having to reinstall the firmware,
and try again.

Skip especially these:
- Copying data from an old phone
  - If your old phone is not rooted and this is therefore the only way to migrate your data,
    you should first do the setup once so that you know it works.
    Then, when you are at the Android home screen,
    try to migrate data by clicking the device setup notification.
    If the notification is not available,
    reset the phone and do the initial setup again but migrating the data this time.
- Google account setup
- Screen lock setup


## Backups
### Apps that should be restored using backup software
- Syncthing (if using the same device)
  - Either backup restore the contents of the synced folders manually to enable the app to find them,
    or remove and re-add the folders in the app to force a resync.
- Snapchat
  - Backing up may not be necessary, as the messages may be stored in the cloud,
    but at least the use of a backup software works.
- Telegram
  - This way you can keep your secret chats.
- WhatsApp
  - Titanium Backup may not work. Use Swift Backup instead.


### Apps that have their own backup systems
The most of these apps support only manual backups.

- Authy
- K-9 mail
- Notify for Mi Band
- OpenCamera
- QKSMS
- Signal
  - Titanium Backup and Swift Backup may not work. If they fail, use Signal's own file-based backup instead.
- Sleep As Android
- WhatsApp
  - Using its own backup feature results in regeneration of the encryption keys.
    By using Swift Backup you can avoid this.
