---
layout: default
title: Linux
---

# Linux

## Distros

- [Ubuntu](https://ubuntu.com/)
  ([download](https://releases.ubuntu.com/))
- [Kubuntu](https://kubuntu.org/)
  ([download](https://cdimage.ubuntu.com/kubuntu/releases/))
- [Lubuntu](https://lubuntu.me/)
  ([download](https://cdimage.ubuntu.com/lubuntu/releases/))


### Utilities

- [Clonezilla](https://clonezilla.org/)
  ([download](https://clonezilla.org/downloads.php))


## Installing Linux
- Download the ISO file
  - Prefer BitTorrent downloads, as they are faster than direct HTTP downloads,
    and they also check that the file has not been corrupted during the download.
    (There is nothing wrong or illegal about BitTorrent itself, it's all about what you download.)
- Update BIOS/UEFI and firmware before the installation as much as you practically can.
  - This is especially important with old computers, as important features such as proper UEFI support may be added as a
    UEFI/BIOS update.
- Prepare the USB drive
  - If you have an old computer,
    [do not use a drive that is larger than 137 GB](https://www.ventoy.net/en/doc_legacy_limit.html).
  - Check that the drive is good using [f3](https://fight-flash-fraud.readthedocs.io/en/latest/).
  - Enable Secure Boot from the UEFI settings, especially if you're dual-booting Windows.
  - If you are installing a single Linux distribution, use
    [Rufus](https://rufus.ie/)
    to create the installation media.
    - Set the partitioning to GPT/UEFI (non-CSM) unless you have a very old computer that does not have UEFI.
- Boot the computer from the USB drive
- Install the OS
- Configure SSH
  - Add authorized keys to `~/.ssh/authorized_keys`
  - [Set up banner / MOTD](https://github.com/AgenttiX/linux-scripts/tree/master/security/banner)
  - Disable password login
    - Set `PasswordAuthentication no` in `/etc/ssh/sshd_config`
- Configure UFW firewall
  - Note that Proxmox hosts have their own firewall system in the web GUI
  - `sudo ufw allow ssh`
  - `sudo ufw allow <YOUR_SERIVCES>`
  - `sudo ufw enable`
- [Configure SNMP](https://github.com/AgenttiX/linux-scripts/tree/master/librenms)
  if using e.g. LibreNMS


### Encrypted dual boot
- Install Windows as usual, but don't yet install software, as it will fill the drive, which will slow down the later steps.
  - If your computer supports Secure Boot, you should enable it before installing Windows, as it may be difficult to enable it later.
- Disable BitLocker (aka. device encryption) if it's enabled. Reboot and ensure that it's disabled.
- Disable fast startup.
  - If you don't, both your Windows and Linux installation may become corrupted when you boot to Windows after resizing its partition,
    as Windows will not realize that the partition size has changed, and will write outside the partition.
- Boot from the Linux installation media and select to try the OS before installation (e.g. "Try Ubuntu")
  so that you can access disk partitioning tools before the installation.
- Open a partitioning tool (e.g. GParted or KDE Partition Manager)
  - Shrink the Windows C: partition to make space for Linux.
    - I prefer to give about half of the disk to Linux.
    - Do not move the Windows partition unless you absolutely want to, as
      [resizing Windows partitions requires special tricks from the software](https://superuser.com/a/1370431).
      If you do, be careful which tools you use. GParted and KDE Partition Manager should be fine.
  - Create a new EFI partition of 4 GB.
    - Ubuntu requires at last 300 MB for the EFI partition, but Windows may create a partition of only 100 MB by default.
      System firmware updates can also use space on the EFI partition, and if it's too small, the updates will fail.
    - Windows refuses to resize the EFI partition, and the libparted library used by GParted and KDE Partition manager
      cannot resize FAT32 partitions that are smaller than 256 MB ([Bugzilla](https://bugzilla.gnome.org/show_bug.cgi?id=649324)).
    - Follow the [Arch Wiki instructions](https://wiki.archlinux.org/title/EFI_system_partition#Replace_the_partition_with_a_larger_one).
    - If you want, you can also move the Windows partition.
  - Create a 4 GB ext4 boot partition for Linux right after the Windows partition.
    - The boot partition should be at least 1 GB to ensure that kernel updates don't fill it up.
  - Create an unformatted partition using all the free space on the disk.
  - The disk should now have several Windows partitions, then the boot partition, and then the unformatted partition.
- Now you can format the disk with LUKS
``` bash
sudo su
# Create a LUKS container for the partition. Replace X with the number of the unformatted partition.
cryptsetup -v luksFormat /dev/nvme0n1pX
# Open the LUKS container.
# You can replace crypto-pv with a name of your choice, but I prefer to use crypto-pv on all my devices for simplicity.
cryptsetup open /dev/nvme0n1pX crypto-pv
# Create an LVM physical volume (PV) in the LUKS container
pvcreate /dev/mapper/crypto-pv
# Create an LVM volume group on the PV.
vgcreate crypto-vg /dev/mapper/crypto-pv
# Create a swap partition on the LVM.
# Take a note of the UUID given by the command, as you will need it later.
# Change the size to be at least slightly higher than your RAM size, so that the swap partition can be used for hibernation.
# The example value of 18 GB presumes that you have 16 GB of RAM.
lvcreate -n crypto-swap -L 18G crypto-vg
# Create the root partition using the rest of the available space on the LVM.
lvcreate -n crypto-root -l 100%FREE crypto-vg
# Configure the swap partition.
mkswap /dev/crypto-vg/crypto-swap
# Create a filesystem on the root partition.
mkfs.ext4 /dev/crypto-vg/crypto-root
```
- Run the Linux installer. Select the following partitions to be used
  - Root partition: mount point /
  - Boot partition: mount point /boot
  - EFI system partition: mount point /boot/efi
  - In the case of Ubuntu or Kubuntu prior to 20.04, format the partitions in the installer to avoid
    [this bug](https://askubuntu.com/q/698727/).
  - Ubuntu 20.04 and later use the Calamares installer, in which LVM and LUKS support is buggy,
    as the installer will try to close LVM and LUKS volumes before starting the installation.
    To work around this, before continuing the installation from the partition selection screen,
    open a terminal and run `while true; do vgchange -ay; done` to force the LVM volumes to stay open during the installation.
  - You may also have not to select to format the partitions during the installation.
- **Do not reboot the computer after the installation!**
  Instead, you have to tell the just-installed Linux that it's on an encrypted disk.
  On old Ubuntu installers, the new root partition should now be mounted at `/target`.
  On the new Calamaers installer, the new root partition will be mounted at `/var/tmp/calamares-root-SOME_STRING`.
  This folder will be referred to as `/target` in the following commands.
  If it's not mounted, you can use a partition manager of your choice to mount it.

``` bash
# Become root if you're not already.
sudo su

mount --bind /dev /target/dev
mount --bind /run /target/run

chroot /target
# If you get an error that these are already mounted or that systemd still uses the old version, it's OK.
mount --types=sysfs sys /sys
mount --types=proc proc /proc

# This is important to ensure that the soon-to-be-created initramfs will go to the new boot partition.
mount /boot

# Copy the UUID shown by this command to the clipboard. X is the number of the LUKS partition.
cryptsetup luksDump /dev/nvme0n1pX
nano /etc/crypttab
# If you don't see a line with the UUID you just copied, add this line to the file.
# If the disk is an SSD, add the discard option to enable TRIM support,
# which is necessary for proper operation of the SSD.
crypto-pv UUID=PARTITION_UUID_HERE none luks,discard

# Add the swap partition to the fstab
nano /etc/fstab
# If you don't see a line with the UUID of the swap partition (which was given by the lvcreate command earlier),
# add this line to the file.
UUID=SWAP_PARTITION_UUID_HERE none swap sw 0 0

# Enable the configuration
update-initramfs -u
```
Now you can reboot to the new Linux installation.
Once you have booted to the Linux installation, run this command to set the clock to local time,
as Windows expects.
``` bash
timedatectl set-local-rtc 1 --adjust-system-clock
```
If hibernation does not work out of the box, you can enable it with these commands.
``` bash
# Get the UUID of the swap partition
sudo blkid | grep swap
# Edit the GRUB config
sudo nano /etc/default/grub
# Change the GRUB_CMDLINE_LINUX_DEFAULT line to include the resume parameter.
# You may also want to remove the "quiet splash" to show the boot messages instead of the boot logo."
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash resume=UUID=YUOR_SWAP_PARTITION_UUID"
```
Now you can test hibernation with `sudo systemctl hibernate`.
If you get the error ["Call to Hibernate failed: Sleep verb 'hibernate' is not configured or configuration is not supported by kernel"](https://askubuntu.com/a/1125038),
then you may need to disable Secure Boot to get the hibernation working.

Now you have a functioning and encrypted dual boot setup.
Enjoy!


## Terminal

### zsh
[Oh My Zsh](https://ohmyz.sh/)


### Useful commands and utilities
TODO


## Fixes for bugs I've encountered
### [Plasmashell using lots of CPU](https://www.reddit.com/r/kde/comments/tagio0/comment/icw4lft/)
``` bash
mv ~/.local/share/kactivitymanagerd ~/.local/share/kactivitymanagerd_old
```


## Misc tips
### Creating new users
``` bash
adduser user_name
```
The command `useradd` is a low-level utility, and should not be used interactively.

### Giving group access to a user
``` bash
usermod -a -G group_name user_name
```
Giving root access
``` bash
usermod -a -G sudo user_name
```


### Mounting SMB shares
[Official Ubuntu instructions](https://ubuntu.com/server/docs/how-to-mount-cifs-shares-permanently#mount-unprotected-guest-network-folders)
``` bash
apt install cifs-utils
mkdir /mnt/SHARE_NAME
nano /etc/fstab
```
Add this line if you want to save the password:
```
//SERVER_IP_OR_DNS/SHARE_NAME /mnt/SHARE_NAME cifs credentials=/root/smb/SHARE_NAME,uid=LOCAL_USER,vers=3.11,seal,noexec,noauto 0 0
```
Also create the credentials file with:
```
username=YOUR_USERNAME
password=YOUR_PASSWORD
domain=YOUR_DOMAIN (if you're using a domain account)
```
Or add this line if you want the password to be asked every time:
```
//SERVER_IP_OR_DNS/SHARE_NAME /mnt/SHARE_NAME cifs user=SERVER_USER,uid=LOCAL_USER,vers=3.11,seal,noexec,noauto 0 0
```
Then run:
``` bash
mount /mnt/SHARE_NAME
```
