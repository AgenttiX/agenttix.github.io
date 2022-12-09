---
layout: default
title: Active Directory
---
# Active Directory
Active Directory is *the* way to manage an organisation that has multiple computers.

## Samba Active Directory
Samba Active Directory is the free and open source implementation of
Microsoft Active Directory.
It is suitable for both small and large environments,
but requires significantly more configuration and tweaking than
Microsoft Active Directory.
On the other hand, you don't have to pay exorbitant sums of money for the Windows Server licenses.
You can both
[set up a new domain](https://wiki.samba.org/index.php/Setting_up_Samba_as_an_Active_Directory_Domain_Controller)
or
[add Samba domain controllers to an existing domain](https://wiki.samba.org/index.php/Joining_a_Samba_DC_to_an_Existing_Active_Directory).

Before setting up a Samba domain, think carefully which
[identity mapping](https://wiki.samba.org/index.php/Identity_Mapping_Back_Ends)
and
[DNS](https://wiki.samba.org/index.php/The_Samba_AD_DNS_Back_Ends)
back ends to use.
The `ad` identity mapping backed is a pain to manage when creating new users and groups,
but it might be necessary in your environment.

## Securing an Active Directory domain
- Keep your domain controllers up to date
- Use strong passphrases
- Don't run any other services on the domain controllers.
Instead, create additional virtual machines if your licensing permits it.
- Don't use domain admin credentials on other machines.
Instead, create additional admin accounts with only the necessary privileges.
- Harden the server and client settings with group policies.
- See the official
[best practices](https://docs.microsoft.com/en-us/windows-server/identity/ad-ds/manage/component-updates/executive-summary#summary-of-best-practices-for-securing-active-directory-domain-services)
by Microsoft.

### Group policies
Before you start configuring individual policies,
set up the latest policy templates on your domain controller SYSVOL
according to the
[Microsoft instructions for Managing policy templates](https://docs.microsoft.com/en-us/troubleshoot/windows-client/group-policy/create-and-manage-central-store).

Policies for additional software can be downloaded here:
- [Chrome](https://support.google.com/chrome/a/answer/187202)
- [Edge](https://docs.microsoft.com/en-us/deployedge/configure-microsoft-edge)
- [Firefox](https://support.mozilla.org/en-US/kb/customizing-firefox-using-group-policy-windows)
- [Group Policy Administrative Templates Catalog](https://admx.help/)
- [Samba](https://wiki.samba.org/index.php/Group_Policy#Installing_Samba_ADMX_Templates) (by running samba-tool on a DC or a domain member)

Windows hardening
- [Account lockout](https://docs.microsoft.com/en-us/windows/security/threat-protection/security-policy-settings/account-lockout-duration)
- [BitLocker](https://docs.microsoft.com/en-us/windows/security/information-protection/bitlocker/bitlocker-group-policy-settings)
- Disable AutoPlay
- Disable Microsoft spyware
  - Advertising ID
  - Consumer experiences
  - Set diagnostic data to required only
  - Block consumer Microsoft account authentication
  - Disable improvement of inking and typing recognition
- Network connectivity
  - Disable old protocols (SMBv1, SMBv2 etc.)
  - Force encryption and signing
- [Windows Defender](https://docs.microsoft.com/en-us/microsoft-365/security/defender-endpoint/use-group-policy-microsoft-defender-antivirus)
- [Windows hardware security](https://docs.microsoft.com/en-us/windows/security/hardware)


### Password hardening
Windows password security is fundamentally broken to maintain backwards compatibility.
[The legacy LM hash used to store the password is based on 64-bit DES,
and the "newer" NTLM hash is based on unsalted MD4](https://docs.microsoft.com/en-us/windows-server/security/kerberos/passwords-technical-overview).
[The NT and NTLM hashes are so weak](https://support.microsoft.com/en-us/topic/security-guidance-for-ntlmv1-and-lm-network-authentication-da2168b6-4a31-0088-fb03-f081acde6e73),
because before January 2000,
the US law was interpreted to prevent the export of stronger cryptography.
(Big thanks to the PGP developers for
[appealing this](https://en.wikipedia.org/wiki/Pretty_Good_Privacy#Criminal_investigation)!)

LM hashes are disabled by default on Windows Vista and newer,
and you can disable them on Windows XP with a
[group policy](https://docs.microsoft.com/en-us/troubleshoot/windows-server/windows-security/prevent-windows-store-lm-hash-password).
Setting this group policy also for newer devices is a good idea to reduce the risk of an attacker enabling
the LM hashes.

NTLM authentication should be restricted to the latest NTLMv2 version with a
[group policy](https://docs.microsoft.com/en-us/windows/security/threat-protection/security-policy-settings/network-security-lan-manager-authentication-level).

[Windows 10 encrypts the MD4-based NTLM hash with AES](https://security.stackexchange.com/a/158174/),
but since AES is symmetric encryption,
the original hash can be extracted with tools such as
[Mimikatz](https://github.com/gentilkiwi/mimikatz).
To mitigate against this, enable Credential Guard with a
[group policy](https://docs.microsoft.com/en-us/windows/security/identity-protection/credential-guard/credential-guard-manage).
However, Credential Guard does not protect the password from being stolen with a keylogger
or a malicious
[Security Support Provider](https://docs.microsoft.com/en-us/windows/win32/rpc/security-support-providers-ssps-)
(SSP) when you log in.

All Windows passwords should contain both lower and uppercase characters and numbers and be at least 10 characters long,
preferably significantly longer.
Otherwise the NTLM hash can be trivially cracked with an
[easily available rainbow table](https://project-rainbowcrack.com)
using free software such as
[Ophcrack](https://ophcrack.sourceforge.io/).
You should enforce this with a
[group policy](https://docs.microsoft.com/en-us/windows/security/threat-protection/security-policy-settings/password-policy).


## Active Directory Certificate Services
Active Directory Certificate Services (AD CS) is the platform
for setting up a public key infrastructure for a Windows domain.

- [Microsoft instructions](https://docs.microsoft.com/en-us/windows-server/networking/core-network-guide/cncg/server-certs/install-the-certification-authority)
- [Certification Authority Guidance](https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2012-R2-and-2012/hh831574(v=ws.11)?redirectedfrom=MSDN#crypto)
- [3rd party instructions](https://mjcb.io/blog/2020/03/09/certificate-authority-windows-server-2019/)
- Decide a name for the CA
  - The default format is Company-ServerName-CA, e.g. MyCompany-AD-CA
  - Please see the [CA naming rules](https://social.technet.microsoft.com/wiki/contents/articles/16160.considerations-for-certification-authority-ca-names.aspx)
- If you have enough Windows Server licenses, set up a separate virtual machine (VM) for the certificate authority (CA)
  - Once the CA is configured, the VM can no longer be renamed, promoted to a domain controller (DC) or demoted.
    Therefore, if you have to use the CA machine as a domain controller,
    you should promote it to a domain controller before setting up the CA.
  - If possible, Keep the CA offline and stored in a physically secure location.
- Use the default settings for the CA root key
  - Cryptographic provider
    - If you have a hardware security module (HSM), use it,
      but ensure that you create at least two copies of the root key.
      Preferably one should be in a secure safe, and the ones connected to running servers should be on
      hardware security modules (HSM).
    - If you don't have a hardware security module,
      use `RSA#Microsoft Software Key Storage Provider` as the cryptographic provider when creating the key.
      This is the Microsoft recommendation.
      A TPM-based key store would be more secure, but cannot be backed up, and if the CA server is compromised,
      the attacker can issue arbitrary certificates anyway.
  - Key length: 4096
    - The default is 2048
    - [Do not use a shorter key than 2048, as they are insecure and many systems will refuse to work with them!
](https://dirteam.com/sander/2015/07/09/ad-fs-certificates-best-practices-part-2-key-length/)
    - [A quantum computer with 20 million qubits should be able to crack 2048-bit RSA in 8 hours](https://www.technologyreview.com/2019/05/30/65724/how-a-quantum-computer-could-break-2048-bit-rsa-encryption-in-8-hours/)
  - Hash algorithm: SHA256
    - Supported from Windows XP SP3 and Windows Server 2003 SP2 ->
    - [Windows 7 and 8 require a hotfix to enable SHA512 for TLS 1.2](https://support.microsoft.com/en-us/topic/sha512-is-disabled-in-windows-when-you-use-tls-1-2-5863e74e-e5b6-cc3b-759b-ece8da875825)
- Have a look at [keylength.com](https://www.keylength.com/) when deciding your settings
- Recommendations to use the defaults
  - [Cloud Infrastructure Services](https://cloudinfrastructureservices.co.uk/active-directory-certificate-services-best-practices/) (2019->)
  - [social.technet.microsoft.com](https://social.technet.microsoft.com/Forums/office/en-US/c462dec2-210b-4878-a832-42a95ff2cc61/sha512-and-4096-compatibility?forum=winserversecurity) (2015)
  - [Zindagi Technologies](https://zindagitech.com/how-should-we-implement-active-directory-certificate-services/) (2021)
- Recommendations to configure for higher security
  - [Techgenix](https://techgenix.com/microsoft-pki-quick-guide-part2-design/)
  - [social.technet.microsoft.com](https://social.technet.microsoft.com/Forums/windowsserver/en-US/daeea1a0-bf18-4ec1-b38d-b75a73ee5e08/are-there-any-major-compatibility-issues-with-using-gt-2048-bit-ca-keys?forum=winserversecurity)
  - [social.technet.microsoft.com](https://social.technet.microsoft.com/Forums/lync/en-US/0f98e960-849e-490f-90e9-d8f177285ad5/sha1-or-sha256-and-2048-or-4096-when-setting-up-a-new-root-and-sub-ca?forum=winserversecurity)

## Windows Server IKEv2 VPN
This setup is rather complex, and it's easy to make mistakes that affect its security negatively.
For smaller environments, consider using OpenVPN instead.
The primary benefits of Windows Server -based IKEv2 are that the clients are configured automatically,
and that the user certificates can't be extracted from the clients if they are stored on a TPM.
- First set up Active Directory Certificate Services with the instructions above
- To prevent extraction of keys from the clients, they should have TPM 2.0 with support for key attestation
- [Microsoft instructions](https://docs.microsoft.com/en-us/windows-server/remote/remote-access/vpn/always-on-vpn/deploy/always-on-vpn-deploy-deployment)
- It's highly recommended to run the DC, CA, NPS and RAS/VPN on different servers,
  and this is what the Microsoft instructions implicitly assume.
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
- If you have your CA on the same server as the RAS/VPN
  and you get any certificate errors when attempting to connect to the VPN,
  you may have to go to Certificates (Local Computer) -> Personal -> Certificates -> your root certificate -> Properties -> General
  and set `Certificate purposes: Enable only the following purposes`
  and remove `IP security IKE intermediate`, and possibly `Server Authentication` and `User Authentication` as well.
- In the Network Policy Server settings use the certificates of the NPS, not the RAS/VPN server.
- Create a VPN configuration on the client
  - Set Networking -> IPv4 -> Properties -> Advanced -> Disable `Use default gateway on remote network`
- The default settings use broken cryptography.
  [At least in 2018](https://directaccess.richardhicks.com/2018/12/10/always-on-vpn-ikev2-security-configuration/)
  the encryption has been based on 3DES, SHA-1 and the 1024-bit Diffie-Hellman group 2.
  None of these are secure.
  - Run [my script](https://github.com/AgenttiX/windows-scripts/blob/master/VPN/Harden-VPN.ps1)
    both on the client and the server to harden the VPN connection.
- Test that the connection works.
- Run [another script](https://github.com/AgenttiX/windows-scripts/blob/master/VPN/Create-VPNProfile.ps1)
  to create a configuration profile from the VPN connection on the client.
- Deploy the profile using a configuration management tool such as Puppet or Intune,
  or deploy it as a scheduled task with a group policy. If configuring with a scheduled task, note the following:
  - General: select "Run with highest privileges" so that the script runs in the security context of the user
    but has the permissions to configure the VPN.
    However, this requires that the users have local admin privileges, which is a security risk.
    Therefore, using a configuration management tool or deploying the VPN configuration manually is highly recommended.
  - Trigger the task to run at the log on of "%LogonDomain%\%LogonUser%".
  - Don't use the "Display a message" feature for debugging. It's deprecated and will prevent the task from executing.
  - Check the other tabs and ensure that the settings are correct.
- If you get a policy mismatch error, follow
  [these instructions](https://directaccess.richardhicks.com/2019/09/02/always-on-vpn-ikev2-policy-mismatch-error/).
- If you get the
  [error 8007042a](https://serverfault.com/a/1042893)
  when starting Routing and Remote Access, go to
  NPS -> Accounting -> Log File Properties -> Change Log File Properties and disable "If logging fails, discard connection requests."
