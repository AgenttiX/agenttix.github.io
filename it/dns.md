---
layout: default
title: DNS
---

# DNS
DNS is the system that translates human-readable domain names (e.g. `google.com`) into IP addresses (e.g. `216.58.209.174`).
DNS is a critical piece of internet infrastructure and must be configured correctly to be secure.


## Security testing tools
### For clients
- [Verisign DNSSEC debugger](https://dnssec-debugger.verisignlabs.com/)
- [wander.science DNSSEC resolver test](https://wander.science/projects/dns/dnssec-resolver-test/)


### For domains
- [internet.nl email security test](https://internet.nl/test-mail/)
- [Microsoft DNSSEC and DANE test](https://testconnectivity.microsoft.com/tests/O365DaneValidation/input)


## Lists of DNS providers
| Name                                                            | Location    | .fi  | DNSSEC                                                                                | ACME                                                  | DynDNS | CAA                                                                      | DANE/TLSA                                        |
|-----------------------------------------------------------------|-------------|------|---------------------------------------------------------------------------------------|-------------------------------------------------------|--------|--------------------------------------------------------------------------|--------------------------------------------------|
| [BunnyDNS](https://bunny.net/dns/)                              | Slovenia    | No   | [Yes](https://docs.bunny.net/api-reference/core/dns-zone/enable-dnssec-on-a-dns-zone) | No                                                    | ?      | [Yes](https://docs.bunny.net/api-reference/core/dns-zone/add-dns-record) | ?                                                |
| **[ClouDNS](https://www.cloudns.net/domain-names/)**            | Bulgaria    | Yes  | Yes                                                                                   | [Yes](https://pypi.org/project/certbot-dns-cloudns/)  | Yes    | Yes                                                                      | [Yes](https://www.cloudns.net/wiki/article/342/) |
| [DNScale](https://www.dnscale.eu/)                              | Estonia     | No   | Yes                                                                                   | No                                                    | ?      | Yes                                                                      | Yes                                              |
| [deSEC](https://desec.io/)                                      | Germany     | No   | Yes                                                                                   | [Yes](https://pypi.org/project/certbot-dns-desec/)    | Yes    | Yes                                                                      | Yes                                              |
| [EuroDNS](https://european-alternatives.eu/product/eurodns-dns) | Luxembourg  | Yes  | Yes                                                                                   | [Yes](https://pypi.org/project/certbot-dns-eurodns/)  | ?      | Yes                                                                      | ?                                                |
| [Nanelo](https://nanelo.com/)                                   | Germany     | No   | Yes                                                                                   | ?                                                     | ?      | Yes                                                                      | ?                                                |
| **[OVH](https://www.ovhcloud.com/)**                            | France      | Yes  | [Yes](https://www.ovhcloud.com/en/domains/dnssec/)                                    | [Yes](https://pypi.org/project/certbot-dns-ovh/)      | Yes    | Yes                                                                      | Yes                                              |
| [RCodeZero](https://www.rcodezero.at/)                          | Austria     | No   | Yes                                                                                   | [Yes](https://pypi.org/project/certbot-dns-rcode0/)   | No     | Yes                                                                      | Yes                                              |
| [Scaleway DNS](https://www.scaleway.com/)                       | France      | No   | Yes                                                                                   | [Yes](https://pypi.org/project/certbot-dns-scaleway/) | Yes    | Yes                                                                      | Yes                                              |

Explanations of the columns:
- .fi = Whether the provider is also a domain registrar for .fi domains
- ACME = Let's Encrypt ACME dns-01 validation

- [List of European DNS providers](https://european-alternatives.eu/category/managed-dns-providers)
- [List of European domain name registrars](https://european-alternatives.eu/category/domain-name-registrar)


## [Domain Name System Security Extensions (DNSSEC)](https://en.wikipedia.org/wiki/Domain_Name_System_Security_Extensions)
By default, DNS records are transmitted without encryption and signing.
This makes it possible for an attacker to intercept and modify them in transit,
which is known as a man-in-the-middle attack.
DNSSEC fixes this by cryptographically signing the DNS records.

To enable DNSSEC for client devices, configure a DNS resolver that supports DNSSEC validation.
One such resolver is Cloudflare's
[1.1.1.1](https://one.one.one.one/).

To enable DNSSEC for your domain, contact your domain registrar.
If your registrar does not support DNSSEC,
I recommend transferring the domain to a registrar that does.

- [Traficom instructions](https://www.traficom.fi/fi/viestinta/fi-verkkotunnukset/fi-verkkotunnuksen-hakijalle-ja-kayttajalle/nimipalvelun)
- [Traficom list of registrars supporting DNSSEC](https://traficom.fi/fi/viestinta/fi-verkkotunnukset/etsi-verkkotunnusvalittaja)


## [DNS over HTTPS (DoH)](https://en.wikipedia.org/wiki/DNS_over_HTTPS)
DNS over HTTPS (DoH) is a protocol for performing DNS resolution over HTTPS.
This prevents eavesdropping and manipulation of DNS data between the DNS server and client.
However, it does not verify the authenticity of the DNS data,
so it should be used together with DNSSEC for maximum security.
Please also note that the DNS provider will still be able to see all the DNS queries.


## [DNS over TLS (DoT)](https://en.wikipedia.org/wiki/DNS_over_TLS)
DNS over TLS (DoT) is a protocol similar to DoH,
but it uses bare TLS instead of HTTPS for encrypting the DNS traffic.


## [Certificate Authority Authorization (CAA)](https://en.wikipedia.org/wiki/DNS_Certification_Authority_Authorization)
CAA is used to restrict, which certificate authorities are allowed to issue certificates for your domain.

[Let's Encrypt instructions](https://letsencrypt.org/docs/caa/)
```
# Any validation method
example.org CAA 0 issue "letsencrypt.org"
# HTTP validation only
example.org CAA 0 issue "letsencrypt.org;validationmethods=http-01"
# DNS validation only
example.org CAA 0 issue "letsencrypt.org;validationmethods=dns-01"
```

## [DomainKeys Identified Mail (DKIM)](https://en.wikipedia.org/wiki/DomainKeys_Identified_Mail)
- [Microsoft 365 instructions](https://learn.microsoft.com/en-us/defender-office-365/email-authentication-dkim-configure)
  - You can create the DKIM keys in the Microsoft Defender portal.
    Then copy-paste the two generated CNAME records to your DNS configuration.


## [Sender Policy Framework (SPF)](https://en.wikipedia.org/wiki/Sender_Policy_Framework)
- [Microsoft 365 instructions](https://learn.microsoft.com/en-us/defender-office-365/email-authentication-spf-configure)
  - SPF configuration is a mandatory part of the Microsoft 365 enrollment process.


## [Domain-based Message Authentication, Reporting and Conformance (DMARC)](https://en.wikipedia.org/wiki/DMARC)
- Requires SPF and DKIM to be configured first.
- [Microsoft 365 instructions](https://learn.microsoft.com/en-us/defender-office-365/email-authentication-dmarc-configure)
- TXT record
  - Hostname: _dmarc
  - TXT value: `v=DMARC1; p=reject; rua=mailto:<REPORT_EMAIL_ADDRESS>; ruf=mailto:<REPORT_EMAIL_ADDRESS>`


## [MTA-STS](https://learn.microsoft.com/en-us/purview/enhancing-mail-flow-with-mta-sts)


## [DNS-based Authentication of Named Entities (DANE)](https://en.wikipedia.org/wiki/DNS-based_Authentication_of_Named_Entities)
DANE is used to authenticate certificates and keys using DNSSEC.
Therefore, DNSSEC is a prerequisite for DANE.
The primary use of DANE is authenticating TLS certificates using DNSSEC instead of a CA.
This is done by TLSA DNS records.

### HTTPS
As of 2026,
[DANE is not supported by major web browsers such as Chrome and Firefox](https://en.wikipedia.org/wiki/DNS-based_Authentication_of_Named_Entities#Support).
This is due to several reasons.
First of all, DNSSEC adoption has been quite slow.
Also, web browsers currently rely on their DNS-over-HTTPS (DoH) providers or system DNS resolver for DNS resolution and DNSSEC validation.
In order to properly support DANE securely, web browsers would need to implement their own DNS resolver with DNSSEC validation.
This would require them to manage their own trust anchors for DNSSEC validation,
which would be parallel to their existing CA trust store.
This adds both technical and administrative complexity,
as the browsers would need to decide on how to handle possible conflicts between the DNSSEC trust anchors and the CA trust store.
(What if a certificate is valid according to the CA trust store but invalid according to DNSSEC, or vice versa? Which one to trust in such a case?)
Together, these issues have made web browsers hesitant to implement DANE support,
at least until DNSSEC adoption becomes more widespread.


### SMTP
The TLSA record can be used to enforce TLS for incoming email.
- Microsoft 365
  - [Official instructions](https://learn.microsoft.com/en-us/purview/how-smtp-dane-works)
  - [Brandaris instructions](https://www.brandaris.it/en/knowledge-hub/articles/how-to-set-up-inbound-smtp-dane-and-dnssec-for-microsoft-365/)
  - [van Surksum instructions](https://www.vansurksum.com/2025/01/23/from-spf-to-dane-securing-microsoft-365-email-communications/)
- As of 2026, SMTP DANE is not supported for `onmicrosoft.com` domains.


### PGP
DANE can also be used to publish PGP keys in DNS.
- [kernel.org instructions](https://www.kernel.org/doc/html/v4.19/process/maintainer-pgp-guide.html#configure-auto-key-retrieval-using-wkd-and-dane)
- [Quick instructions](https://yolo.engineer/posts/dane-opengpgkey/)
Please note that RSA keys can be quite large, and size of DNS records should be kept as small as possible.
Therefore, it's highly recommended to use some other algorithm than RSA to create the PGP key.
A good option is to use Ed25519 + Curve25519.


## [SSHFP](https://en.wikipedia.org/wiki/SSHFP_record)
SSHFP is a DNS record used to publish a SSH host key in DNS.
It's for SSH what DANE is for TLS and PGP.
Similarly as DANE, SSHFP relies on DNSSEC for verifying the authenticity of the published key.
You can enable SSHFP verification in your SSH client by adding the following lines to your `~/.ssh/config` file:
```
Host SERVER_NAME
    HostName SERVER_FQDN
    VerifyHostKeyDNS yes
```
As with DANE PGP, using Ed25519 keys is highly recommended over RSA keys to reduce the size of the DNS records.
For the hash algorithm, use SHA-256 (value 2) over SHA-1 (value 1), since [SHA-1 is broken and should not be used](https://en.wikipedia.org/wiki/SHA-1#Attacks).
