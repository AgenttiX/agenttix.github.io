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
    Therefore a device that is not up to date will most likely have well-known critical vulnerabilities waiting to be exploited.
  - If your device no longer receives security updates from the manufacturer,
    you should switch to an alternative firmware such as [LineageOS](https://lineageos.org/) or buy a new phone.
- Install only the apps that you need
  - Even a single malicious app is enough to compromise a phone.
- Reduce the permissions given to apps
- Keep Bluetooth disabled if you don't need it


## Securing a router
The most important thing about securing a router is keeping it up to date.
If your router no longer receives security updates from the manufacturer,
you should switch to an alternative firmware or buy a new router.
These alternative firmwares include
OpenWRT
Tomato
pfSense
OPNSense
When buying a new router, I recommend choosing a model that is supported by one or more of these,
as it will help ensuring that the router will have a long lifespan and not just the year or two that
manufacturers typically provide security updates for.

### DNSSEC
DNS is the protocol that connects human-readable urls such as "google.com"
to addresses that routers know to send traffic to, such as "216.58.210.174".
By default this is done without any kind of validation, and is relatively trivial to spoof.
DNSSEC is a method for validating the authenticity of this information, preventing malicious modifications.
You can test whether you have DNSSEC enabled with this
[DNSSEC test](https://dnssec.vs.uni-due.de/).

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

### Setting up SSH authentication
Check that your clients and servers have OpenSSH 8.2 or later:
``` bash
ssh -V
```
Create the SSH key
([Yubico instructions](https://www.yubico.com/blog/github-now-supports-ssh-security-keys/)).
Use ed25519-sk instead of ecdsa-sk, as the latter is difficult to implement without side-channel vulnerabilities.
See the [cryptography section](#cryptography) for details.
``` bash
ssh-keygen -t ed25519-sk -O resident -O verify-required
```

Support has been requested for
- [Android](https://www.reddit.com/r/yubikey/comments/shrd2u/u2f_and_ssh_on_android/)
- [iOS](https://www.reddit.com/r/yubikey/comments/krygf6/security_key_nfc_for_ssh_in_ios/)
- [TermBot](https://github.com/cotechde/termbot/issues/27)
- [Termius](https://ideas.teams.termius.com/c/47-u2f-fido2-token-support)
  - Already works on desktop but not on Android
- [Termux](https://github.com/termux/termux-packages/issues/4942)

### SSH authentication with TPM
If you want to use SSH without having to touch a physical security key,
you can store the SSH keys on a TPM instead.
These instructions are based on
[the instructions in Gentoo wiki](https://wiki.gentoo.org/wiki/Trusted_Platform_Module/SSH)
``` bash
sudo apt-get install libtpm2-pkcs11-1 libtpm2-pkcs11-tools
sudo usermod -a -G tss "${USER}"
# Log out and back in for the group membership to be applied.
# If this command does not work without sudo, reboot the computer.
tpm2_ptool init
# Create long random PINs and write them down in e.g. your password manager software
tpm2_ptool addtoken --pid=1 --label=ssh --userpin=MySecretPassword --sopin=MyRecoveryPassword
# See the list of supported algorithms. If ed25519 is there, use it. (As of 2023, it's not yet supported.)
tpm2_ptool addkey --help
# If you get an error, try rsa2048 instead
tpm2_ptool addkey --label=ssh --userpin=MySecretPassword --algorithm=rsa4096
# Retrieve the public key from the TPM
# https://github.com/tpm2-software/tpm2-pkcs11/issues/792
TPM2_PKCS11_LOG_LEVEL=0 ssh-keygen -D /usr/lib/x86_64-linux-gnu/libtpm2_pkcs11.so.1
# Load the stored key into the SSH agent
ssh-add -s /usr/lib/x86_64-linux-gnu/libtpm2_pkcs11.so.1
```

Use RSA instead of ECC, since ECC is difficult to implement without side-channel vulnerabilities.
[Such vulnerabilities have already been found in TPMs](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-25082).
ED25519 is in the TPM specification and
[support for it has been requested for tpm2-pkcs11](https://github.com/tpm2-software/tpm2-pkcs11/issues/785),
but TPM manufacturers will first have to implement the algorithm in their devices.
As of 2023, no TPM manufacturer has yet done so.

### YubiKey with KeePassXC
- [Security benefits](https://security.stackexchange.com/a/258414/)
- [Official FAQ](https://keepassxc.org/docs/#faq-yubikey-howto)
- [KeePassXC 2.6.0 is not compatible due to a bug](https://github.com/keepassxreboot/keepassxc/issues/4987)

### Setting up PGP
These instructions are a work in progress.

- These steps must be done on a highly secure computer!
- [YubiKey instructions](https://support.yubico.com/hc/en-us/articles/360013790259-Using-Your-YubiKey-with-OpenPGP)
- [A comprehensive guide](https://github.com/drduh/YubiKey-Guide)

Change the user and admin PINs
``` bash
gpg --change-pin
```

Require touch for using the YubiKey
``` bash
ykman openpgp keys set-touch aut on
ykman openpgp keys set-touch enc on
ykman openpgp keys set-touch sig on
```

Feed entropy from the YubiKey to the system pseudorandom number generator (PRNG)
``` pass
echo "SCD RANDOM 512" | gpg-connect-agent | sudo tee /dev/random | hexdump -C
```

Generate the master key
``` bash
gpg --expert --full-gen-key
```
- Do not set an expiry date

TODO

Verify that the sub-keys have been moved to the YubiKey
``` bash
gpg -K
```


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
