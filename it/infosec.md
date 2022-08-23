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

### Active Directory Certificate Services
- [Microsoft instructions](https://docs.microsoft.com/en-us/windows-server/networking/core-network-guide/cncg/server-certs/install-the-certification-authority)
- [Certification Authority Guidance](https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2012-R2-and-2012/hh831574(v=ws.11)?redirectedfrom=MSDN#crypto)
- Decide a name for the CA
  - The default format is Company-ServerName-CA, e.g. MyCompany-CA01-CA
  - Please see the [CA naming rules](https://social.technet.microsoft.com/wiki/contents/articles/16160.considerations-for-certification-authority-ca-names.aspx)
- If you have enough Windows Server licenses, set up a separate virtual machine (VM) for the certificate authority (CA)
  - Once the CA is configured, the VM can no longer be renamed, promoted to a domain controller (DC) or demoted
- Use the default settings for the CA root key
  - Cryptographic provider: RSA#Microsoft Software Key Storage Provider
    - This is the Microsoft recommendation.
      A TPM-based key store would be more secure, but if the CA server is compromised, the attacker can issue arbitrary certificates anyway.
  - Key length: 4096
    - The default is 2048
    - [Do not use a shorter key than 2048, as they are insecure and many systems will refuse to work with them!
](https://dirteam.com/sander/2015/07/09/ad-fs-certificates-best-practices-part-2-key-length/)
    - [A quantum computer with 20 million qubits should be able to crack 2048-bit RSA in 8 hours](https://www.technologyreview.com/2019/05/30/65724/how-a-quantum-computer-could-break-2048-bit-rsa-encryption-in-8-hours/)
  - Hash algorithm: SHA256
    - Supported from Windows XP SP3 and Windows Server 2003 SP2 ->
  - [Windows 7 and 8 require a hotfix to enable SHA512 for TLS 1.2](https://support.microsoft.com/en-us/topic/sha512-is-disabled-in-windows-when-you-use-tls-1-2-5863e74e-e5b6-cc3b-759b-ece8da875825)
- Have a look at [keylength.com](https://www.keylength.com/) when deciding your settings
- Recommendations for the defaults
  - [Cloud Infrastructure Services](https://cloudinfrastructureservices.co.uk/active-directory-certificate-services-best-practices/) (2019->)
  - [social.technet.microsoft.com](https://social.technet.microsoft.com/Forums/office/en-US/c462dec2-210b-4878-a832-42a95ff2cc61/sha512-and-4096-compatibility?forum=winserversecurity) (2015)
  - [Zindagi Technologies](https://zindagitech.com/how-should-we-implement-active-directory-certificate-services/) (2021)
- Recommendations for higher security
  - [Techgenix](https://techgenix.com/microsoft-pki-quick-guide-part2-design/)
  - [social.technet.microsoft.com](https://social.technet.microsoft.com/Forums/windowsserver/en-US/daeea1a0-bf18-4ec1-b38d-b75a73ee5e08/are-there-any-major-compatibility-issues-with-using-gt-2048-bit-ca-keys?forum=winserversecurity)
  - [social.technet.microsoft.com](https://social.technet.microsoft.com/Forums/lync/en-US/0f98e960-849e-490f-90e9-d8f177285ad5/sha1-or-sha256-and-2048-or-4096-when-setting-up-a-new-root-and-sub-ca?forum=winserversecurity)

TODO [Instructions](https://mjcb.io/blog/2020/03/09/certificate-authority-windows-server-2019/)

### Windows Server IKEv2 VPN
- First set up Active Directory Certificate Services with the instructions above
- The VPN clients should have TPM 2.0 enabled
- [Configure the VPN](https://docs.microsoft.com/en-us/windows-server/remote/remote-access/vpn/always-on-vpn/deploy/always-on-vpn-deploy-deployment)
- Settings for the VPN User Authentication template
  - Cryptography
    - Provider Category: Key Storage Provider
    - Algorithm name: RSA
    - Minimum key size: 2048 (You can't set a longer one, or the Microsoft Platform Crypto Provider will disappear from the provider list.)
    - "Requests must use one of the following providers"
    - Providers: Microsoft Platform Crypto Provider (this is the TPM-backed provider)
    - Request hash: SHA256
  - Security
    - Authenticated users (or at least the CA server) should have read permissions.
      Otherwise you will get the error [0x80094800](https://www.pkisolutions.com/the-requested-template-is-not-supported-by-this-ca-error-0x80094800/)
  - Key Attestation
    - Key Attestation: Required
    - Perform attestation based on: user credentials
- The Microsoft documentation tends to implicitly assume that the CA, NPS and RAS/VPN are on different servers.
- It's recommended to run the CA, NPS and RAS/VPN on different servers,
  and this is what the Microsoft instructions implicitly assume.
  If you get any certificate errors when attempting to connect to the VPN,
  you may have to go to Certificates (Local Computer) -> Personal -> Certificates -> your root certificate -> Properties -> General
  and set `Certificate purposes: Enable only the following purposes`
  and remove `IP security IKE intermediate`, and possibly `Server Authentication` and `User Authentication` as well.
- In the Network Policy Server settings use the certificates of the NPS, not the RAS/VPN server.
- On the client
  - Networking -> IPv4 -> Properties -> Advanced -> Disable `Use default gateway on remote network`

TODO check
- [Security hardening](https://directaccess.richardhicks.com/2018/12/10/always-on-vpn-ikev2-security-configuration/)
- [Policy mismatch](https://directaccess.richardhicks.com/2019/09/02/always-on-vpn-ikev2-policy-mismatch-error/)

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
