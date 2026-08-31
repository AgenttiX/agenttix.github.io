# Cryptography
See [this site](https://www.keylength.com/)
for the key length recommendations of various organizations.


## RSA
- Use key sizes of at least 2048 bits, and 4096 bits for CAs or other security-critical use cases.
- Note that many hardware devices, such as TPMs, cannot store keys longer than 2048 bits.
- With TLS and OpenVPN, the key sizes affect the performance of only the negotiation handshake at the start of the connection
  and during renegotiation, which for OpenVPN happens once per hour.


## Diffie-Hellman parameters
- At least 2048 bits.
  [1024 bit Diffie-Hellman can be cracked by nation states.](https://weakdh.org/)
- Generate your own parameters whenever possible.


## Elliptic Curve Diffie-Hellman (ECDH)
- See [this list](https://safecurves.cr.yp.to/) for safe curves,
  and [this list](https://en.wikipedia.org/wiki/Comparison_of_TLS_implementations#Supported_elliptic_curves)
  for compatibility with TLS implementations.
- The NIST curves
  [may contain NSA backdoors](https://security.stackexchange.com/a/256108)
  and are
  [difficult to implement without vulnerabilities for side-channel attacks](https://safecurves.cr.yp.to/).
- [Curve25519](https://en.wikipedia.org/wiki/Curve25519)
  (used in the X25519 Diffie-Hellmann key exchange)
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


## Hashing
- [MS-CHAPv2](https://en.wikipedia.org/wiki/MS-CHAP)
  - Based on NTLMv1 (not NTLMv2!) and is therefore broken and should not be used.
    Can be cracked in less than a day on modern hardware.
    However, its use is often necessary in e.g. Wi-Fi authentication for compatibility reasons.
    If using MS-CHAPv2 for e.g. Wi-Fi authentication, you must have proper certificate configuration!
    Otherwise, your clients are effectively broadcasting their passwords.
- [NTLMv1](https://en.wikipedia.org/wiki/NTLM#NTLMv1)
  - Totally broken and should not be used.
    Based on MD4 and DES.
    Susceptible to offline cracking, replay attacks and hash reuse.
- [NTLMv2](https://en.wikipedia.org/wiki/NTLM#NTLMv2)
  - Vulnerable and should not be used.
    Replaces the DES in NTLMv1 with HMAC-MD5 and includes timestamps, which helps with replay attacks and hash reuse.
    However, the algorithm is still weak for offline cracking.
- [SHA-1](https://en.wikipedia.org/wiki/SHA-1)
  - [Broken and should not be used](https://en.wikipedia.org/wiki/SHA-1#Attacks).
- [SHA-256](https://en.wikipedia.org/wiki/SHA-2)
  - [Good enough](https://security.stackexchange.com/a/165568),
- SHA-512
  - Theoretically more secure than SHA-256, but not worth it for online systems due to the longer hashes.
  - [Windows 7 and 8 require an update to enable SHA512 for TLS 1.2](https://support.microsoft.com/en-us/topic/sha512-is-disabled-in-windows-when-you-use-tls-1-2-5863e74e-e5b6-cc3b-759b-ece8da875825)
