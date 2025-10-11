---
layout: default
title: Information security
---

# Information security
Here are some information security tips.
This list is a work in progress.


## Checklist
CIA model:
- Confidentiality
- Integrity
- Availability


## Practical tips
- Have cards from multiple banks in case one of them is down
- Electronic identity card
  - [In Finland](https://poliisi.fi/henkilokortti)
  - [Linux compatibility](https://www.linux.fi/wiki/HST)


## Privacy
[Privacy Not Included](https://foundation.mozilla.org/en/privacynotincluded/)


## Maps
- [GPSJAM GPS/GNSS Interference Map](https://gpsjam.org)
- Internet attack maps
  - The practicaul utility of these maps is very limited.
  - [Bitdefender Cyberthreat Real-Time Map](https://threatmap.bitdefender.com/)
  - [Fortinet Threat Map](https://threatmap.fortiguard.com/)
  - [Radware Live Threat Map](https://livethreatmap.radware.com/)


## Travel
### Before travelling
- Make a backup of all important data.
- Install the latest security updates.
- Encrypt all devices that contain sensitive data.
  Merely having a login password does not prevent an attacker from extracting data from the device.
- Enable biometric authentication only when used as a part of a multi-factor authentication.
  Many countries have legislation that permits the authorities to force
  one to perform biometric authentication,
  whereas in the western world passwords often fall under the
  [self-incrimination](https://en.wikipedia.org/wiki/Self-incrimination)
  protection.
- Have a verified boot chain on all of your devices to prevent tampering.
  On PCs this means enabling Secure Boot,
  protecting the UEFI/BIOS with a password and enabling UEFI/BIOS rollback protection.
  On Android one should preferably have a locked bootloader.
- To ensure that your laptop will not be tampered with,
  put a bit of nail polish on one of the laptop screws.
  Preferably use a nail polish with e.g. glitter that creates unique patterns.
  Take a picture of these patterns.

### When travelling
- Do not connect untrusted peripherals or cables.
  Even a regular-looking USB cable (such as the
  [O.MG cable](https://o.mg.lol/)) can contain a chip that can infect a computer,
  or even wireless connectivity for remote control!
  The only exception to this are monitors over display cables (HDMI, DisplayPort, DVI, VGA),
  as their capabilities for transferring anything else than video is rather limited.
  However, connecting a monitor with USB-c is not safe!
- Do not plug your devices to untrusted USB ports.
  Only charge your USB devices using trusted chargers.
  This includes laptops.
- Do not leave your laptop unattended, even in the hotel room.
  Even the safe in your hotel room is not safe,
  as the hotel personnel can access it.
- If you are dealing with sensitive data,
  do not connect your devices to high-risk networks such as public Wi-Fi.
  Buy a local cell phone / data plan instead.


## Securing a Windows desktop
- Keep Windows updated
- Keep apps updated
- Enable Secure Boot and TPM
- Enable BitLocker

### Disk encryption
- [BitLocker](https://docs.microsoft.com/en-us/windows/security/information-protection/bitlocker/bitlocker-overview)
- [VeraCrypt](https://www.veracrypt.fr/en/Home.html)


## Securing cloud services
- Apple
  - Enable [Advanced Data Protection](https://support.apple.com/en-us/108756)
- Google
  - Enable [Advanced Protection Program](https://landing.google.com/advancedprotection/)
    if you're not planning to install apps from outside the Play Store.
    The Advanced Protection Program is otherwise highly useful,
    but unfortunately it blocks app installations from outside the Play Store.
- Microsoft
  - Enable [multi-factor authentication](https://aka.ms/mfasetup)


## Securing a Linux desktop
- Enable LUKS disk encryption when installing the OS.
- Keep software updated: apt-get, snap, flatpak etc.
- Enable firewall
- Enable Secure Boot

### Disk encryption
- LUKS
  - [Arch Wiki](https://wiki.archlinux.org/title/Dm-crypt/Encrypting_an_entire_system)
  - [Gentoo Wiki](https://wiki.gentoo.org/wiki/Dm-crypt_full_disk_encryption)
  - [Current state and flaws](https://0pointer.net/blog/authenticated-boot-and-disk-encryption-on-linux.html)
- [ZFS](https://wiki.archlinux.org/title/ZFS#Native_encryption)


## Securing a Linux server
- Disable SSH password authentication and use keyfiles instead
- Keep software updated: apt-get, snap, flatpak etc.
- Enable firewall
- Enable Secure Boot
- Restrict physical access
  - Lock the case
  - Put the server in a locked rack
  - Attach the case or rack to the building with a lock

### Firewall
Enabling the firewall
``` bash
sudo ufw default deny
sudo ufw enable
```
Allowing a program to receive connections:
``` bash
sudo ufw allow <port_number> comment "My program"
```


## Securing an Android device
- Keep the firmware (aka. Android version) up to date
  - Every month [several vulnerabilities](https://source.android.com/security/bulletin)
    are discovered in Android and fixed.
    Therefore, a device that is not up to date will most likely have
    well-known critical vulnerabilities waiting to be exploited.
  - If your device no longer receives security updates from the manufacturer,
    you should switch to an alternative firmware such as [LineageOS](https://lineageos.org/) or buy a new phone.
- Install only the apps that you need
  - Even a single malicious app is enough to compromise a phone.
- Reduce the permissions given to apps
- Keep Bluetooth disabled if you don't need it


## Securing a router
The most important thing about securing a router is keeping it up to date.
Most manufacturers are notoriously poor in providing security updates for their devices,
and if they do, it's often only for a few years.
If a router no longer receives security updates, you should not connect it to the internet!
Depending on the latest security updates it received,
you may be able to repurpose it as e.g. an additional Wi-Fi access point within your own network, though.

Many old devices also lack important settings and features such as
802.11w management frame protection that protects from
[deauth jamming](https://github.com/SpacehuhnTech/esp8266_deauther),
and countermeasures for the
[KRACK attacks](https://www.krackattacks.com/).
However, it should be noted that old client devices may not be compatible with these protections.
If you are still using such devices, you should create a separate Wi-Fi SSID for them
so that you don't have to reduce the security for the rest of your devices.

[OpenWRT](https://openwrt.org/)
is perhaps the most feature-rich and well-maintained custom firmware, and it's also open source.
Please see whether your device is
[compatible with OpenWRT](https://openwrt.org/supported_devices).
If it's not, please see whether it's compatible with some other notable custom firmware, such as:
- [Asuswrt-Merlin](https://www.asuswrt-merlin.net/) ([supported devices](https://www.asuswrt-merlin.net/about))
- [DD-WRT](https://dd-wrt.com/) ([supported devices](https://wiki.dd-wrt.com/wiki/index.php/Supported_Devices))
- [Gargoyle](https://www.gargoyle-router.com/) ([supported devices](https://www.gargoyle-router.com/wiki/doku.php?id=supported_routers_-_tested_routers)
- [LibreCMC](https://librecmc.org/) ([supported devices](https://librecmc.org/fossil/librecmc/wiki?name=Supported_Hardware))
- [Tomato by Shibby](https://tomato.groov.pl/) ([supported devices](https://tomato.groov.pl/?page_id=164))
- [AdvancedTomato](https://advancedtomato.com/) ([supported devices](https://advancedtomato.com/downloads))
- [FreshTomato](https://freshtomato.org/) ([supported devices](https://wiki.freshtomato.org/doku.php/hardware_compatibility))


For further details on the firmware compatibility,
please see my purchase guide.

These alternative firmwares include:
- [OpenWRT](https://openwrt.org/)
- [pfSense](https://www.pfsense.org/)
- [OPNSense](https://opnsense.org/)

Please see the [purchase guide](./purchasing.md) on instructions for purchasing a router.

- When buying a new router, I recommend choosing a model that is supported by one or more of these,
as it will help ensuring that the router will have a long lifespan and not just the year or two that
manufacturers typically provide security updates for.


### DNSSEC
DNS is the protocol that connects human-readable urls such as "google.com"
to addresses that routers know to send traffic to, such as "216.58.210.174".
By default this is done without any kind of validation, and is relatively trivial to spoof.
DNSSEC is a method for validating the authenticity of this information, preventing malicious modifications.
You can test whether you have DNSSEC enabled with this
[DNSSEC test](https://dnssec.vs.uni-due.de/).
If you don't please switch to a secure DNS provider such as one of those in the following section.


### DNS over TLS
By default, DNS queries are sent without any kind of encryption.
This means that anyone snooping on the connection can see the names of the websites you are visiting.
You can avoid this by using DNS over TLS (DoT).


### DNS providers
The DNS provider can see the names of all websites you visit.
Therefore, it is important to choose a provider that respects your privacy.
Some DNS providers can also filter out ads and malware.
When choosing a DNS provider, you should ensure that they support at least DNSSEC and DNS over TLS.
My recommendations are:
- [Mullvad](https://mullvad.net/en/help/dns-over-https-and-dns-over-tls)
- [European public DNS resolvers](https://european-alternatives.eu/category/public-dns)


### OpenVPN
I've found that these settings work well enough.
Please let me know if there's something to be improved.
- Server mode: `Remote Access (SSL/TLS)`
  - This is more secure than a shared key or user auth.
- Device mode: `tun - Layer 3 Tunnel Mode`
  - In most use cases there's no need for tap (OSI layer 2).
- Protocol: `UDP IPv4 and IPv6 on all interfaces (multihome)`
- Local port: preferably the default of 1194. If you have multiple servers, just increment the port number.
- TLS configuration: `Use a TLS Key`, and automatically generate it.
- Peer Certificate Authority: see the [cryptography section](#Cryptography)
- DH Parameter Length: `ECDH only`
- ECDH Curve: See the [cryptography section](#Cryptography)
- Data Encryption Algorithms
  - AES-256-GCM
  - CHACHA20-POLY1305
  - If you want better performance, also add AES-128-GCM
- Fallback Data Encryption Algorithm: AES-256-CBC
- Auth Digest Algorithm
  - To quote the pfSense documentation,
    "[The GUI default of SHA256 is a good balance of security and speed.](https://docs.netgate.com/pfsense/en/latest/vpn/openvpn/configure-server-crypto.html#auth-digest-algorithm)"
- Hardware Crypto
  - "When left unspecified, OpenVPN will choose automatically based on what is available in the operating system to accelerate ciphers OpenVPN wants to use."
  - "In most common deployments this setting is unnecessary as the automatic behavior of OpenVPN is correct."
  - AES-NI is enabled automatically regardless of this setting.
- Certificate depth: `One (Client+Server)`, unless you have some fancy PKI setup.
- Client Certificate Key Usage Validation: yes
- Allow Compression: `Refuse any non-stub compression (Most secure)`
- Duplicate Connection: yes if multiple devices use the same client certificate
- Dynamic IP: yes
  - This is necessary to allow the clients to switch e.g. from mobile data to Wi-Fi without interrupting connectivity
- DNS Server enable: yes if you want the clients to access e.g. Active Directory
- Block Outside DNS: yes to ensure that local domain names are queried from the local DNS servers
- Force DNS cache update: yes
- UDP Fast I/O: Enable. I've had no trouble with this.
- Send/Receive Buffer: change this from the default value according to the instructions on the config page


## Hardware security keys
[Services that support YubiKey/WebAuthn](https://www.yubico.com/fi/works-with-yubikey/catalog/?sort=popular), including:
- [Binance](https://accounts.binance.com/en/manage-yubikey-authenticator)
  - Firefox on Linux is not supported
- [Bitbucket](https://bitbucket.org/account/settings/two-step-verification/manage)
- [Bitfinex](https://setting.bitfinex.com/security)
- Coinbase
- Discord
- eBay
- Electronic Arts
- Epic Games
- EVE Online
- [Facebook](https://www.facebook.com/security/2fac/settings/)
- [Gate.io](https://www.gate.io/myaccount/webauthn)
- [GitHub](https://github.com/settings/security)
- [GitLab](https://gitlab.com/-/profile/two_factor_auth)
- [GNOME GitLab](https://gitlab.gnome.org/-/profile/two_factor_auth)
- [Google](https://myaccount.google.com/signinoptions/two-step-verification)
- Heroku
- Home Assistant Community
- Instagram
- KeePassXC ([see this description](https://security.stackexchange.com/a/258414/))
- Kickstarter
- Microsoft
- Microsoft Azure Active Directory
  - [Firefox on Linux is not supported](https://learn.microsoft.com/en-us/azure/active-directory/authentication/fido2-compatibility),
    [as it does not yet support CTAP2](https://bugzilla.mozilla.org/show_bug.cgi?id=1530370)
  - Setup at [https://aka.ms/mfasetup](https://aka.ms/mfasetup)
- NiceHash
- [Nvidia](https://profile.nvgs.nvidia.com/security/webauthn)
- [OVH](https://www.ovh.com/manager/#/dedicated/useraccount/security)
- [PayPal](https://www.paypal.com/myaccount/security/twofactor/authentication)
- ProtonMail
- [PyPI](https://pypi.org/manage/account/webauthn-provision)
- Signal Community
- Reddit
- TeamViewer
- Twitch
- Twitter
- [WordPress](https://wordpress.com/me/security/two-step)

Services that will support YubiKey/WebAuthn in the future
- [Self-developed Django applications](https://github.com/jazzband/django-two-factor-auth/pull/408)

### Resetting a YubiKey
``` bash
ykman fido reset
ykman oath reset
ykman openpgp reset
ykman otp delete 1
ykman otp delete 2
ykman piv reset
```

### Configuring a YubiKey
Verify
[on this page](https://www.yubico.com/genuine/)
that the YubiKey is genuine.

``` bash
ykman fido access change-pin
```


### YubiKey with KeePassXC
- [Security benefits](https://security.stackexchange.com/a/258414/)
- [Official FAQ](https://keepassxc.org/docs/#faq-yubikey-howto)
- [KeePassXC 2.6.0 is not compatible due to a bug](https://github.com/keepassxreboot/keepassxc/issues/4987)


## Cryptography
See [this site](https://www.keylength.com/)
for the key length recommendations of various organizations.

RSA
- Use key sizes of at least 2048 bits, and 4096 bits for CAs.
- Note that many hardware devices, such as TPMs, cannot store keys longer than 2048 bits.
- With TLS and OpenVPN, the key sizes affect the performance of only the negotiation handshake at the start of the connection
  and during renegotiation, which for OpenVPN happens once per hour.


Diffie-Hellman parameters
- At least 2048 bits.
  [1024 bit Diffie-Hellman can be cracked by nation states.](https://weakdh.org/)
- Generate your own parameters whenever possible.

Elliptic Curve Diffie-Hellman (ECDH)
- See [this list](https://safecurves.cr.yp.to/) for safe curves,
  and [this list](https://en.wikipedia.org/wiki/Comparison_of_TLS_implementations#Supported_elliptic_curves)
  for compatibility with TLS implementations.
- The NIST curves
  [may contain NSA backdoors](https://security.stackexchange.com/a/256108)
  and are
  [difficult to implement without vulnerabilities for side-channel attacks](https://safecurves.cr.yp.to/).
- Curve25519 (used in the X25519 Diffie-Hellmann key exchange)
  - A lot less prone to side-channel attacks than the NIST curves.
    [Use this whenever you can.](https://security.stackexchange.com/a/230713)
  - [Not supported by most browsers for certificates (as of 2023)](https://security.stackexchange.com/a/270111)
  - X25519 is supported by
    [Firefox](https://blog.mozilla.org/security/2020/07/06/performance-improvements-via-formally-verified-cryptography-in-firefox/)
    and
    [Chrome](https://chromestatus.com/feature/5682529109540864)
- prime256v1 = NIST P-256
  - Not as secure as the other options. Do not use this unless you have to for compatibility.
- secp384r1 = NIST P-384
  - The default for pfSense OpenVPN
  - Good compromise between security and performance
  - Compatible with most web browsers
  - If setting up an enterprise system with various clients, I'd go with this just to be sure about
    [compatibility](https://security.stackexchange.com/a/78624).
- secp521r1 = NIST P-521
  - Theoretically more secure than secp384r1, but not widely used.
    [Chromium has dropped support for it](https://security.stackexchange.com/questions/100991/why-is-secp521r1-no-longer-supported-in-chrome-others),
    which is rather suspicious.
  - If setting up a highly secure system which has only a few users and
    where safe curves such as Curve25519 are not available,
    I'd go with this over secp384r1.

Hashing
- Do not use SHA-1, as [it has been broken](https://shattered.io/).
- [SHA-256 is good enough](https://security.stackexchange.com/a/165568),
  and SHA-512 is not worth it for online systems due to the longer hashes.
  - [Windows 7 and 8 require an update to enable SHA512 for TLS 1.2](https://support.microsoft.com/en-us/topic/sha512-is-disabled-in-windows-when-you-use-tls-1-2-5863e74e-e5b6-cc3b-759b-ece8da875825)
