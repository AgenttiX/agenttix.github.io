---
layout: default
title: Networking
---
# Networking

## Home network structure
### Simplest option
The simplest and most common option is to have a Wi-Fi router that creates a single network for all devices.
In this setup all devices can communicate with each other,
which enables easy setup and control of IoT devices such as smart plugs, TVs and speakers.
The downside is that if one device is compromised,
it can contaminate other devices on the same network.


### Secure option
To reduce the attack surface,
yo can separate IoT and guest devices to separate networks using virtual LANs (VLANs).
This way, if a visiting friend has a compromised device,
it cannot directly communicate with the vulnerable IoT devices on your network,
nor access your file servers.

Here is an example of what a possible separation of networks can look like:

| SSID   | VLAN  | Encryption | Notes                                                          |
|--------|-------|------------|----------------------------------------------------------------|
| Main   | Main  | WPA3       | Computers, phones & servers etc.                               |
| Legacy | Main  | WPA2       | Devices that are not compatible with WPA3                      |
| IoT    | IoT   | WPA2/WPA3  | IoT devices                                                    |
| Guest  | Guest | WPA2/WPA3  | You can share the Wi-Fi password to friends                    |
| -      | DMZ   | -          | Servers that need to be accessible primarily from the internet |

In this setup there is an intentional compromise:
6 GHz Wi-Fi (e.g. Wi-Fi 6E and Wi-Fi 7) requires WPA3,
but in many homes there are legacy devices that don't support WPA3
but need to have access to LAN resources such as file servers or direct connectivity to phones (e.g. smart speakers).
Therefore, the main VLAN is accessible using both Main (WPA3) and Legacy (WPA2) SSIDs.
This way you can have both 6 GHz Wi-Fi and legacy devices on the same network.
Once you no longer have legacy devices, you should disable the Legacy SSID for security.
If your legacy devices have Ethernet ports (e.g. gaming consoles),
you should connect them to the network with a cable instead of wireless,
and disable the legacy SSID.


### Cabling
It's a lot easier to install cables when you're renovating other things at the same time.
Installing cables afterward is a lot more difficult.
Therefore, install more cables than you think you need at the time.

CAT7 or better is a good choice of cabling.



## Enterprise network structure
The simplest networks for small businesses look like home networks.
However, as a business grows, the number of devices increases and the network becomes more complex.
It is a good idea to implement a proper separation of VLANs early on,
as it is easier to implement the firewall rules between VLANs as the business grows,
instead of having to configure everything at once.

Here is an example of what a possible separation of networks can look like:

- Main
  - Computers & servers
  - WPA3 Enterprise Wi-Fi with certificate-based RADIUS authentication.
    The certificates can be provided by Active Directory
    and stored securely on the TPMs of client devices using a Windows group policy.
    - Another option is to provide only a guest Wi-Fi SSID,
      and allow wireless access to the main network only from physical sockets and over VPN.
      The downside of this is that clients will have to connect and disconnect the VPN
      when switching from Ethernet to Wi-Fi and vice versa,
      and that the wireless access to file servers will be slower.
- Management
  - Hypervisors, switches, firewalls etc.
  - Only sysadmins should have access to this network
- Wi-Fi management
  - Wi-Fi access points
  - This should be separate from the management network
    so that the management network is not exposed to the sockets of the access points,
    and is therefore accessible only from secure areas.
  - The Wi-Fi management VLAN should be provided to the Wi-Fi access points as untagged,
    and the networks that are going to be shared wirelessly (e.g. main) should be provided as tagged.
    This way the same access points can provide multiple SSIDs.
- IoT
  - Segmenting IoT devices to a separate network is important especially if the IoT devices don't support
    WPA3 Enterprise authentication, but only e.g. WPA2 PSK.
    This way if a IoT device is compromised or stolen and the Wi-Fi password is extracted from the device,
    the attacker cannot access the main network.
- DMZ
  - If the company has public-facing servers,
    they should be on a separate network so that their compromise does not provide access to the internal network.
- Guest
  - Guest Wi-Fi and physical ports at e.g. conference rooms
  - Personal devices of employees etc.
- VPN
  - VPN clients don't usually need access to the entire main network, but only to certain servers on the main network.


## Wireless networking (WWAN: 4G, 5G)
The wireless networking standards are a mess.


### 5G SA vs NSA
5G can be implemented in two different ways.
In 5G non-standalone (NSA) mode,
the existing 4G LTE infrastructure is used for control signaling,
and 5G is used only as an additional band for data transfer.
This means that the connection will have the high latency of 4G LTE,
and that the client device will need to have both 4G and 5G modems online,
resulting in higher power consumption and therefore battery drain.
A better name for 5G NSA would be 4.5G.

5G standalone (SA) mode is the true 5G that does not depend on 4G LTE.
In 5G SA mode, the 5G network is used for all connectivity.
This provides lower latency than in 4G LTE.
This makes 5G SA a valid replacement for wired connectivity.
Some network operators, such as Elisa, market 5G SA as "5G+".

Many network operators support only 5G NSA or restrict 5G SA to certain plans.
Therefore, when purchasing a 5G network plan, ensure that it has support for 5G SA.
If not, consider the options of competing network operators.


### 5G Advanced
[5G Advanced](https://en.wikipedia.org/wiki/5G#5G-Advanced),
also known as 5.5G or 5G-A, is an upgrade to the 5G standard.
[In Finland, the deployment of 5G Advanced started in February 2025.](https://elisa.fi/yhtiotieto/uutishuone/tiedotteet/odotettu-parannus-mobiiliyhteyksiin-%E2%80%93-maailman-ensimm%C3%A4iset-kuluttaja-asiakkaat-k%C3%A4ytt%C3%A4v%C3%A4t-5-5g:t%C3%A4-elisan-verkossa/76140715069966/)


### 4G bands in Finland
In Finland, there are five
[4G LTE frequency bands](https://en.wikipedia.org/wiki/LTE_frequency_bands).
When purchasing a 4G device, ensure that it supports as many of these as possible.
When purchasing a 4G antenna, ensure that it has support for the frequency range of 700–2800 MHz,
but preferably also for the 700–3500 MHz range of 5G for future-proofing.

- b1: 2100 MHz
- b3: 2800 MHz
- b7: 2600 MHz
- b28: 700 MHz
- b20: 800 MHz


### 5G bands in Finland
In Finland, there are three
[5G NR frequency bands](https://en.wikipedia.org/wiki/5G_NR_frequency_bands).
When purchasing a 5G device, ensure that it supports all three bands,
or at least the n78 band.
For a 5G device to work reliably in Finland, it must support at least the n28 and n78 bands.
When purchasing a 5G antenna, ensure that it has support for the frequency range of 700–3500 MHz.

- n1: 2100 MHz
- n28: 700 MHz
  - Used to provide better upload speeds when used together with n78 with carrier aggregation
  - May require support for Dynamic Spectrum Sharing, since it shares the frequencies with the LTE b28 band
- n78: 3500 MHz
  - High frequency → short range, high download speed, upload speed is highly dependent on the distance
- n258: 26 GHz, mmWave
  - Upcoming (as of 2025)

The simultaneous use of several frequency bands is known as
[carrier aggregation (CA)](https://en.wikipedia.org/wiki/Carrier_aggregation).
When purchasing a 5G device in Finland, ensure that it supports at least the n28+n78 carrier aggregation.


### 5G modem: Quectel RM520N-GL
My recommendation for a 5G modem is the
[Quectel RM520N-GL](https://www.quectel.com/product/5g-rm520n-series/)
([hinta.fi](https://hinta.fi/haku?q=RM520N-GL), [Amazon](https://www.amazon.de/dp/B0DP69BYJW)).
According to
[the documentation](https://github.com/4IceG/RM520N-GL/blob/main/Documents/Quectel_RM520N-GL_CA%26EN-DC_Features_V1.0.xls),
it supports the following 5G carrier aggregation profiles that are relevant in Finland:
- CA_n1A-n28A
- CA_n1A-n78A
- CA_n28A-n78A

Dual connectivity profiles with n1+n28:
- DC_28A_n1A-n78A
- DC_3A_n1A-n78A
- DC_7A_n1A-n78A
- DC_20A_n1A-n78A
- DC_7A-7A_n1A-n78A
- DC_3A-3A_n1A-n78A
- DC_3C_n1A-n78A
- DC_7C_n1A-n78A

Dual connectivity profiles with n28+n78:
- DC_1A_n28A-n78A
- DC_3A_n28A-n78A
- DC_3C_n28A-n78A
- DC_7A_n28A-n78A
- DC_7C_n28A-n78A
- DC_20A_n28A-n78A

The modem can be controlled with the AT commands available
[here](https://github.com/4IceG/RM520N-GL/blob/main/Documents/Quectel_RG520N%26RG525F%26RG5x0F%26RM5x0N%26RM521F_Series_AT_Commands_Manual_V1.0.pdf).

