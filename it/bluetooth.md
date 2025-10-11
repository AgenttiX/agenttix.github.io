---
layout: default
title: Bluetooth
---

# Bluetooth
[Bluetooth](https://en.wikipedia.org/wiki/Bluetooth)
is a highly versatile wireless communication technology
that is widely used for connecting devices over short distances.
However, its capabilities differ significantly between versions,
and it's therefore important to pay a close attention to the details
to ensure proper security and functionality such as audio quality.


## Version history
- Bluetooth 4.0 (2010)
  - [Bluetooth Low Energy](https://en.wikipedia.org/wiki/Bluetooth_Low_Energy) (Bluetooth LE, aka. BLE),
    which is an independent protocol from classic Bluetooth.
- Bluetooth 4.2 (2014)
  - LE Secure connections (LESC), which improves the security significantly
    and fixes the broken BLE key exchange protocol in Bluetooth 4.0 and 4.1.
- Bluetooth 5.0 (2016)
  - Higher transmission speed (2 Mbps), longer range and lower battery consumption for BLE
- Bluetooth 5.1 (2019)
  - [Angle of arrival](https://en.wikipedia.org/wiki/Angle_of_arrival) (AoA) and Angel of Departure (AoD),
    which provide knowledge on the direction of nearby devices.
- Bluetooth 5.2 (2019)
  - LE Audio, including the [LC3 codec](#audio)
- Bluetooth 6.0 (2024)
  - [Channel Sounding](https://www.bluetooth.com/learn-about-bluetooth/feature-enhancements/channel-sounding/):
    distance estimation of nearby devices
    - Phase-Based Ranging (PBR)
    - Round-Trip Time (RTT)


## Security
- Bluetooth versions prior to 4.2 are fundamentally broken.
  - Bluetooth 4.0 and 4.1 key exchange is broken, allowing an attacker to decrypt the traffic,
    sometimes in less than a second.
- Bluetooth 4.2 introduces the LE Secure Connections (LESC), which fixes this and improves the security significantly.
  - LESC has four security levels
    - Level 1: no encryption
    - Level 2: AES-CMAC (aka. AES-128, RFC 4493, FIPS-compliant), no pairing required
    - Level 3: encryption and with pairing requirement
    - Level 4: ECDHE authentication with the P-256 curve
      - P-256 is one of the NIST curves and notoriously difficult to implement.
        Therefore, I won't be surprised if and when vulnerabilities are found in the implementations.
  - LESC also has four security modes
    - Mode 1: no signing
    - Mode 2: signing for both paired and unpaired connections
    - Mixed security mode: support for both mode 1 and 2
- When purchasing Bluetooth keyboards or other devices that transmit sensitive information,
  ensure that they support at least Bluetooth 4.2, preferably Bluetooth 5.0 or above.
- Most devices prior to 2018 are vulnerable to the [KNOB attack](https://knobattack.com/).
- Bluetooth 4.2 - 5.4 (and likely above) are vulnerable to
  [the BLUFFS MITM attack](https://francozappa.github.io/post/2023/bluffs-ccs23/)
  ([CVE-2023-24023](https://nvd.nist.gov/vuln/detail/CVE-2023-24023)).
- Please see the [accessories section](./purchasing#accessories) of the purchase guide
  for further information on the security of Bluetooth accessories.
- [SweynTooth](https://asset-group.github.io/disclosures/sweyntooth/)
- [BlueBorne](https://en.wikipedia.org/wiki/BlueBorne_(security_vulnerability))


## Audio
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


## Adapters
The documentation of the
[Home Assistant Bluetooth integration](https://www.home-assistant.io/integrations/bluetooth)
has a list of known good adapters.
However, many of those are for old Bluetooth versions,
and therefore I recommend finding one with at least Bluetooth 5.0, preferably 6.0 or later.

I'm currently using
[this Bluetooth 6.0 adapter](https://www.aliexpress.com/item/1005009587868790.html)
for my home automation.
(The "official" Windows drivers are available from
[this link](https://bit.ly/3GHevXY), which points to
[this Dropbox folder](https://www.dropbox.com/scl/fi/mqqmyghnsfvqx5n3qz674/V6.0.rar?rlkey=n8ygq5zl2kcmzj7xosnvlw69t))


## Trackers
Finding lost and stolen items with Bluetooth trackers is based on the idea
that a phone that is part of the tracker network will pass by.
To enable this, the tracker should be part of a large network.
At the moment, the largest tracker networks are Apple's Find My network and Google's Find My Device network.
Therefore, the tracker should be compatible with at least one of these networks, preferably both.
However, no tracker can work with both networks simultaneously, as
[this is forbidden by both Apple and Google licensing agreements](https://www.reddit.com/r/AirTags/comments/170px48/comment/kwhismm).
The tracker should also support Bluetooth 6.0 (or later) or UWB
for finding its precise location when close to the device.

Directional tracking is possible with trackers that support
[Ultra-wideband](https://en.wikipedia.org/wiki/Ultra-wideband) (UWB) communication.
This requires an UWB radio in the phone.
UWB is supported in
[Android 13 and later](https://source.android.com/docs/core/connect/uwb), and in
[iPhone 11 and later](https://support.apple.com/en-us/109512).
However, as of 2025, Android devices with UWB support are still quite rare.
Wikipedia has a
[list of supported devices](https://en.wikipedia.org/wiki/List_of_UWB-enabled_mobile_devices).

To use trackers on Android or to help others find their devices by contributing to the network, install the
[Google Find Hub app](https://play.google.com/store/apps/details?id=com.google.android.apps.adm).
By default, the app only sends location information to the network
when detecting trackers in high-traffic areas
so that the location information cannot be used by Google to identify you,
at least according to what Google claims.
However, the downside is that if you lose your tracker, especially in a low-traffic area,
it may take a long time before enough users have passed by the tracker for its location to be reported.
If you want to find your trackers faster and to help others
at the expense of providing more location information about yourself to Google,
you should open the Google Find Hub app, go to "Settings &rarr; Find Hub &rarr; Find your offline devices"
and set it to "With network in all areas".
If you have
[any issues](https://www.reddit.com/r/Chipolo/comments/1nl4z8l/chipolo_is_mostly_useless_compared_to_samsung/)
with slow or missing location updates,
then you should try enabling this feature.
Please see
[the Google Find Hub privacy documentation](https://support.google.com/android/answer/14796936)
for more details.

As of 2025, my recommended devices are the
[Chipolo POP](https://chipolo.net/en/products/chipolo-pop-6-pack?variant=4001400),
[Chipolo CARD](https://chipolo.net/en/products/chipolo-card-4-pack?variant=4142891) and
[Chipolo LOOP](https://chipolo.net/en/products/chipolo-loop-6-pack?variant=4142763).
They support both Apple and Google networks and BLE 6.0 and are
[made in Europe](https://chipolo.net/en/pages/our-story).
However, they lack support for UWB.
<!-- Side note: the Chipolo Pop has these antenna specifications in its manual:
- Modulation method: GFSK
- Antenna power: < 1 mW
- Operating frequency band: 2402 - 2480 MHz
-->

If you want to create your own Bluetooth tracker,
please have a look at
[OpenHaystack](https://github.com/seemoo-lab/openhaystack).
