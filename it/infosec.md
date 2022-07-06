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

## Securing an Active Directory domain
- Keep your domain controllers up to date
- Use strong passphrases
- Don't run any other services on the domain controllers.
Instead, create additional virtual machines if your licensing permits it.
- Don't use domain admin credentials on other machines.
Instead, create additional admin accounts with only the necessary privileges.
- Disable old protocols (SMBv1, SMBv2 etc.) and enforce encryption and signing with group policies where possible.
- See the official
[best practices](https://docs.microsoft.com/en-us/windows-server/identity/ad-ds/manage/component-updates/executive-summary#summary-of-best-practices-for-securing-active-directory-domain-services)
by Microsoft.

## Hardware security keys
Services that support YubiKey/WebAuthn
- Facebook
- GitHub
- GitLab
- Google
- Heroku
- Microsoft
- OVH

Services that will support YubiKey/WebAuthn in the future
- [Self-developed Django applications](https://github.com/jazzband/django-two-factor-auth/pull/408)
