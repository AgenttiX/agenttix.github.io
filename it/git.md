---
layout: default
title: Git
---

# Git
Git is a version control system that allows multiple people to work on the same files simultaneously.
It's one of the essential tools for software development,
and it can also be used for writing documents, managing configuration files, and more.
Git itself is a distributed command-line tool that does not have a central server,
but it's most commonly used with a repository hosting service that provides a web interface and additional features.
[GitHub](https://github.com/),
[GitLab](https://gitlab.com/) and
[Bitbucket](https://bitbucket.org/)
are among the most widely used Git repository hosting services.


## GitHub setup
- [Create an account on GitHub](https://github.com/signup) if you don't have one already.
  - GitHub prefers a one-account policy, so if you already have an account, you should use that.
  - The username you choose should be associated with you only, and not your organization.
- If you are part of an organization,
  inform the admin of your GitHub username so that they can add you to the organization.
- Configure your account settings
  - [Fill in your public profile details](https://github.com/settings/profile)
    - If you have an ORCID iD, connect it to your account.
  - [Set a successor for your account](https://github.com/settings/admin)
    if you have a trusted person who also has a GitHub account.
    If you are using GitHub only for work, then this should be a coworker.
  - [Add your other email addresses to the account](https://github.com/settings/emails)
    - This is important so that the commits you make on other computers are correctly associated with your account.
  - [Enable two-factor authentication (2FA)](https://github.com/settings/security)
    - If you have a FIDO2 security key such as a YubiKey, you should configure it as a passkey.
    - If you are using Windows, you should configure Windows Hello as a passkey.
    - If you are using Android, you should configure your phone's biometric authentication as a passkey.
    - If you configured any of the passkeys above, you should select passkeys as your preferred 2FA method.
  - If you are part of an organization,
    you can now accept the invitation your admin sent to your email to join the organization.
  - Create an SSH key with the instructions on [the SSH page](./ssh) and add it on the
    [SSH and GPG keys settings page](https://github.com/settings/keys)
  - Enable these [code security settings](https://github.com/settings/security_analysis)
    - Push protection for yourself
    - Private vulnerability reporting
    - Dependency graph
    - Dependabot alerts
    - Dependabot security updates
  - If you are a student or a teacher, apply for [GitHub Education](https://github.com/education)
    - This will give you access to GitHub Pro, which includes more CI/CD runner minutes.
