---
layout: default
title: Firewall
---

# Firewall
[pfSense](https://www.pfsense.org/)
[OPNsense](https://opnsense.org/)
[OpenWRT](https://openwrt.org/)

## Installation
- Install on a ZFS mirrored software RAID if you can.
  This is supported by pfSense and OPNsense.
  It's better than a hardware RAID, as it can detect data corruption and read from the disk that has the correct data.

## Misc settings
For remote deployments,
enable SSH access from the local network in addition to the web GUI,
so that you can inspect issues in the case the web GUI goes down without having to access the physical console.
Preferably restrict SSH access to be with key only.

## Darkstat
[Darkstat](https://unix4lyfe.org/darkstat/)

## pfBlockerNG
[pfBlockerNG](https://docs.netgate.com/pfsense/en/latest/packages/pfblocker.html)

IPv4 lists
- [FireHOL level 3](https://raw.githubusercontent.com/firehol/blocklist-ipsets/master/firehol_level3.netset)
  - Note that this list may contain false positives such as GitHub IPs,
    which may cause issues with various services such as GitHub.
    Therefore, I recommend using the "Deny Inbound" settings for this list instead of "Deny Both".
- [EmergingThreats](https://rules.emergingthreats.net/blockrules/compromised-ips.txt)
- [BinaryDefense](https://www.binarydefense.com/banlist.txt)

IPv6 lists
- [Spamhaus](https://www.spamhaus.org/drop/dropv6.txt)

DNS lists
- [AdAway](https://adaway.org/hosts.txt)
- [EasyList](https://easylist-downloads.adblockplus.org/easylist_noelemhide.txt)
- [EasyPrivacy](https://easylist.to/easylist/easyprivacy.txt)
- [Malwaredomainlist](https://www.malwaredomainlist.com/hostslist/hosts.txt)

## Snort
[Snort](https://www.snort.org/)

### Suppress list
```
suppress gen_id 1, sig_id 2002910
suppress gen_id 1, sig_id 2003068

#ET USER_AGENTS Microsoft Device Metadata Retrieval Client User-Agent
suppress gen_id 1, sig_id 2027390

suppress gen_id 1, sig_id 2028651
suppress gen_id 119, sig_id 4
suppress gen_id 119, sig_id 7
suppress gen_id 119, sig_id 24
suppress gen_id 119, sig_id 31

#(http_inspect) SIMPLE REQUEST
suppress gen_id 119, sig_id 32

#(http_inspect) UNESCAPED SPACE IN HTTP URI
suppress gen_id 119, sig_id 33

suppress gen_id 120, sig_id 3
suppress gen_id 120, sig_id 6
suppress gen_id 120, sig_id 8
suppress gen_id 120, sig_id 18

#(http_inspect) JUNK LINE BEFORE HTTP RESPONSE HEADER
suppress gen_id 120, sig_id 26

suppress gen_id 123, sig_id 8

# GitLab SSH
#(spp_ssh) Challenge-Response Overflow exploit
suppress gen_id 128, sig_id 1

#(spp_ssh) Protocol mismatch
suppress gen_id 128, sig_id 4

# Telegram
suppress gen_id 137, sig_id 1

#(spp_sip) URI is too long
suppress gen_id 140, sig_id 3

suppress gen_id 141, sig_id 1

# Kapsi IMAP4
#(IMAP) Unknown IMAP4 response
suppress gen_id 141, sig_id 2

#(POP) Unknown POP3 command
suppress gen_id 142, sig_id 1
```

## Suricata
[Suricata](https://suricata.io/)
