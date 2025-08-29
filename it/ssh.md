---
layout: default
title: SSH
---

# SSH
SSH is among the easiest and most secure ways to access remote systems.

## Autossh
To automatically reconnect SSH sessions, you can use [autossh](https://www.harding.motd.ca/autossh/).
However, Mosh is a better option, if you can use it instead.


## Mosh
SSH is based on TCP, and therefore changing one's network connection will break existing SSH connections.
This can be fixed by using [Mosh](https://mosh.org/) instead, as it's based on UDP.


## SSH authentication with a FIDO2 hardware security token
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


## SSH authentication with TPM
If you want to use SSH without having to touch a physical security key,
you can store the SSH keys on a TPM instead.


### Windows
On Windows you can use the TPM for SSH with the SSH client included in Git.
You can install Git with my installer script or with the command below.
The parameter `/GitAndUnixToolsOnPath` enables the SSH client included in Git for the terminal.
The parameter `/WindowsTerminalProfile` is optional and configures the Git bash terminal
to be used with the Windows Terminal app.
``` bash
choco upgrade git.install -y --force --params "/GitAndUnixToolsOnPath /WindowsTerminalProfile"
```
Now you can create the SSH key with:
``` bash
ssh-keygen -t ed25519-sk
```
If your device does not support the ed25519 algorithm, you can create an ECDSA key with:
``` bash
ssh-keygen -t ecdsa-sk
```


### Linux
On Linux you can set up SSH keys on a TPM with the commands below.
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
TPM2_PKCS11_LOG_LEVEL=0 ssh-keygen -D /usr/lib/x86_64-linux-gnu/pkcs11/libtpm2_pkcs11.so
# If the command above does not work, try this instead:
TPM2_PKCS11_LOG_LEVEL=0 ssh-keygen -D /usr/lib/x86_64-linux-gnu/libtpm2_pkcs11.so.1

# Load the stored key into the SSH agent
ssh-add -s /usr/lib/x86_64-linux-gnu/pkcs11/libtpm2_pkcs11.so
# If the command above does not work, try this instead:
ssh-add -s /usr/lib/x86_64-linux-gnu/libtpm2_pkcs11.so.1
```

Use RSA instead of ECDSA, since ECDSA is difficult to implement without side-channel vulnerabilities.
[Such vulnerabilities have already been found in TPMs](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-25082).
ED25519 is in the TPM specification and
[support for it has been requested for tpm2-pkcs11](https://github.com/tpm2-software/tpm2-pkcs11/issues/785),
but TPM manufacturers will first have to implement the algorithm in their devices.
As of 2023, no TPM manufacturer has yet done so.
