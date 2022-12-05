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

### Disk encryption
- [BitLocker](https://docs.microsoft.com/en-us/windows/security/information-protection/bitlocker/bitlocker-overview)
- [VeraCrypt](https://www.veracrypt.fr/en/Home.html)


## Securing a Linux desktop
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


## Hardware security keys
[Services that support YubiKey/WebAuthn](https://www.yubico.com/fi/works-with-yubikey/catalog/?sort=popular), including:
- [Binance](https://accounts.binance.com/en/manage-yubikey-authenticator)
  - Firefox on Linux is not supported
- [Bitbucket](https://bitbucket.org/account/settings/two-step-verification/manage)
- [Bitfinex](https://setting.bitfinex.com/security)
- Coinbase
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
Use ed25519-sk instead of ecdsa-sk, as the latter is not cryptographically secure!
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

### YubiKey with KeePassXC
- [Security benefits](https://security.stackexchange.com/a/258414/)
- [Official FAQ](https://keepassxc.org/docs/#faq-yubikey-howto)
- [KeePassXC 2.6.0 is not compatible due to a bug](https://github.com/keepassxreboot/keepassxc/issues/4987)
