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
- [LUKS](https://wiki.archlinux.org/title/Dm-crypt/Encrypting_an_entire_system)
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
- Binance
- [Bitbucket](https://bitbucket.org/account/settings/two-step-verification/manage)
- Bitfinex
- Coinbase
- eBay
- Electronic Arts
- Epic Games
- EVE Online
- [Facebook](https://www.facebook.com/security/2fac/settings/)
- [GitHub](https://github.com/settings/security)
- [GitLab](https://gitlab.com/-/profile/two_factor_auth)
- [Google](https://myaccount.google.com/signinoptions/two-step-verification)
- Heroku
- Instagram
- KeePassXC ([see this description](https://security.stackexchange.com/a/258414/))
- Kickstarter
- Microsoft
- Microsoft Azure Active Directory
  - [Firefox on Linux is not supported](https://learn.microsoft.com/en-us/azure/active-directory/authentication/fido2-compatibility),
    [as it does not yet support CTAP2](https://bugzilla.mozilla.org/show_bug.cgi?id=1530370)
  - Setup at [https://aka.ms/mfasetup](https://aka.ms/mfasetup)
- NiceHash
- [OVH](https://www.ovh.com/manager/#/dedicated/useraccount/security)
- ProtonMail
- Reddit
- TeamViewer
- Twitch
- Twitter

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
