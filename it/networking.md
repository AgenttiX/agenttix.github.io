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
