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

However, Mosh does not work properly for SSH connections that are proxied through another SSH server.
This is because Mosh opens a direct UDP connection between the client and the server,
and SSH proxying forwards only the SSH TCP connection through the proxy server.
It may be possible to work around this with extensive firewall port forwarding, though.


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


## SSH agent forwarding
Quite often one has to connect to other servers from the server that one has logged into with SSH.
Perhaps the most common example is using `git pull` for a private repository.
This requires that the remote machine has access to the SSH keys.
Storing the SSH keys on the remote machine makes them vulnerable for theft,
and it's also quite inconvenient to have to set up the SSH keys on every server.
To avoid having to store the SSH keys on the server,
you can use SSH agent forwarding to forward the SSH agent
and therefore your keys from the local machine to the server.
For further information, please see
[my SSH agent configuration script](https://github.com/AgenttiX/linux-scripts/blob/master/ssh/setup_agent.sh).


## SSH ControlMaster
SSH ControlMaster enables you to reuse existing SSH connections,
which can speed up subsequent SSH connections to the same server significantly.
Please see
[my SSH ControlMaster configuration](https://github.com/AgenttiX/linux-scripts/blob/master/ssh/config.d/general.conf)
for further details.


## SSH connection testing
You can use the
[sshping](https://github.com/spook/sshping)
utility for testing the performance, latency and stability of SSH connections.


## Debugging SSH agent
On Linux, several programs have their own SSH agents that may override the default SSH agent.
This may cause issues with specific types of keys such as TPM and FIDO2 backed keys.

If the command `echo $SSH_AUTH_SOCK` outputs `/run/user/1000/gcr/ssh`, it means that the GNOME Keyring has overridden the default SSH agent.
You can disable it with these commands:
``` bash
systemctl --user disable --now gcr-ssh-agent.socket gcr-ssh-agent.service
systemctl --user mask gcr-ssh-agent.socket gcr-ssh-agent.service
```
Then reboot, and your SSH agent should work again.
