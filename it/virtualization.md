---
layout: default
title: Virtualization
---

# Virtualization
With virtualization, you can run multiple virtual computers
and therefore multiple operating systems on a single physical device.

## Comparison of different software
- KVM/QEMU/virt-manager/libvirt/Proxmox
  - Good PCIe passthrough support, even for consumer GPUs
  - High-performance network and storage, but this requires installation of custom drivers
    during Windows installation for Windows clients
  - With virt-manager the learning curve is not too high
    - However, using ZFS is highly recommended for a server, and understanding it will take time.
  - TPM support
- Hyper-V
  - The latest Hyper-V Server is no longer available for free. 2019 is the last free version.
  - Does not support passing USB devices from the host
  - GPU passthrough is supported only for enterprise GPUs
  - TPM and TRIM support
  - Good integration with the Windows ecosystem (Active Directory etc.)
  - No support for ZFS and therefore no protection from data corruption
- VirtualBox
  - Cross-platform
  - Good for small testing environments
  - No PCIe passthrough (previous versions had a buggy implementation)
  - As of 2022, TPM and TRIM support are not yet implemented


## Proxmox
These instructions are a work in progress.

### Installation
The
[official ISO installer](https://pve.proxmox.com/wiki/Installation)
does not support encryption of the root partition.
If you want to see official encryption support, please vote on
[the issue](https://bugzilla.proxmox.com/show_bug.cgi?id=2714).

Proxmox does not support Secure Boot either
([Forum 1](https://forum.proxmox.com/threads/does-pve-host-support-secure-boot.99728/),
[Forum 2](https://forum.proxmox.com/threads/how-to-enable-secure-boot-on-pve-6.55831/),
[Reddit](https://www.reddit.com/r/homelab/comments/ddbgd9/does_proxmox_support_secure_boot/)).
This is because Proxmox uses a
[custom kernel](https://pve.proxmox.com/wiki/Proxmox_VE_Kernel),
which would have to be signed with the Microsoft keys,
as the official Debian (and Ubuntu) kernels are.

To use either of these features,
you need to first install Debian and then Proxmox on top of it.
In this case, install Debian with Secure Boot enabled,
as you can easily disable it later in the UEFI/BIOS settings,
but enabling Secure Boot for an installation that has been installed without it
can be more difficult.
Note that enabling Secure Boot also enables kernel lockdown,
which disables access to some features.

After a fresh installation you may want to install a few packages
``` bash
apt-get install console-setup git screen sudo
```

#### Mortar
[Mortar](https://github.com/noahbliss/mortar)
is a utility that combines the use of Secure Boot and TPM for full validation of both the kernel and the initramfs,
plus automatic decryption of the encrypted root volume.

First install Debian using the [official netinst ISO](https://www.debian.org/download).
To install Mortar, follow both the
[generic](https://github.com/noahbliss/mortar)
and
[Proxmox-specific](https://github.com/noahbliss/mortar/blob/master/docs/proxmox-install.md)
instructions.
Each of them contains info that is missing from the other.
Remember these
- Reset the TPM and enable both SHA1 and SHA256 banks before starting the operation,
  so you don't forget it and the TPM measurements stabilize.
- Remove "quiet" from `/etc/mortar/cmdline.conf`
- When running `mortar-compilesigninstall`, add the arguments only for the first run!
- After you have run `mortar-compilesigninstall`, the computer should boot directly with Mortar and without GRUB.
  You should not see the GRUB screen if the computer is booting with Mortar.
- At the first reboot after `mortar-compilesigninstall`,
  set Secure Boot to audit mode (or disable it) to allow Mortar to boot.
  - If you can't get Mortar to boot with the Secure Boot custom keys,
    it may be that your motherboard [does not support custom keys with Secure Boot](https://superuser.com/q/1181943).
    This problem is present at least in some HP EliteDesk systems.
- Do not disable the boot partition until you have installed all your hardware and Proxmox!

Once you have installed Mortar, you can install
[Proxmox on top of Debian](https://pve.proxmox.com/wiki/Install_Proxmox_VE_on_Debian_11_Bullseye).
However, please ensure that you're using instructions that correspond to your Debian version.


#### SSH unlock
An encrypted Linux installation can be decrypted remotely by installing an SSH server on the initramfs.
However, if your server has IPMI, using it is a simpler choice.
- [SSH unlock](https://herold.space/proxmox-zfs-full-disk-encryption-with-ssh-remote-unlock/)
- [Encrypted installation](https://medium.com/@pbengert/proxmox-failover-cluster-with-encrypted-root-and-zfs-encrypted-storage-with-auto-unlock-based-on-34e863514cbc)
- [Guide](https://xiu.io/posts/18-proxmox-zfs-fde/)
- [ZFS boot unlock](https://github.com/chungy/zfs-boottime-encryption)


### ZFS
ZFS is very powerful but has a steep learning curve.
Optimal values for its many settings are highly dependent on your workload,
and therefore you should google a lot before creating your ZFS pool.
The
[Arch Wiki article on ZFS](https://wiki.archlinux.org/title/ZFS) and
[OpenZFS documentation](https://openzfs.github.io/openzfs-docs)
are good sources to start with.

ZFS benefits a lot from having high amounts of RAM.
The computer should have at least 4 GB of RAM in total to use ZFS.
To use ZFS deduplication you need 1-5 GB of RAM per 1 TB of storage.
Enabling it is a permanent change that cannot be easily reverted.
For most use cases you should use compression instead.

ZFS compression is a highly useful feature.
Even though it's an extra step in the data pipeline,
modern CPUs are much faster than HDDs,
and therefore according to
[performance tests](https://www.reddit.com/r/zfs/comments/svnycx/a_simple_real_world_zfs_compression_speed_an/)
it can improve throughput.
Unless you have specific needs, you should use LZ4, which is the default.
If you have VM images, text files or other well-compressible data that doesn't need high performance, you can use ZSTD.

[Ars Technica guide](https://arstechnica.com/information-technology/2020/05/zfs-101-understanding-zfs-storage-and-performance/)

[ZFS supports encryption](https://wiki.archlinux.org/title/ZFS#Native_encryption).
However,
[multiple keys are not supported yet](https://github.com/openzfs/zfs/issues/6824).
If you encrypt the entire pool,
[you cannot disable encryption for individual datasets](https://www.reddit.com/r/zfs/comments/bnvdco/zol_080_encryption_dont_encrypt_the_pool_root/).
[Encrypted ZFS can be unlocked with a TPM](https://www.reddit.com/r/zfs/comments/ppo9rl/zfs_encryption_and_tpm/).
However, I recommend that you encrypt your root disk with other means and store the keys of your ZFS pools there.
Such data pools can be
[unlocked at boot time using systemd](https://wiki.archlinux.org/title/ZFS#Unlock/Mount_at_boot_time:_systemd).

Creating the encryption key
``` bash
mkdir /root/zfs
chmod 700 /root/zfs
dd if=/dev/random bs=32 count=1 of=/root/zfs/YOUR_KEY_FILE
chmod 600 /root/zfs/key
```

Creating the pool
``` bash
zpool create \
  -o ashift=12 \ # 4 KB sector size. Absolutely necessary. See the text below for details.
  # Automatic TRIM. This is absolutely necessary if the pool has SSDs or SMR HDDs.
  # Otherwise the performance will degrade over time.
  -o autotrim=on \
  -O encryption=on \
  # -O keyformat=passphrase \ # For external drives only!
  # -O keylocation=prompt \ # For external drives only!
  -O keyformat=raw \ # Use the key file as binary instead of ASCII. See the key creation instructions above.
  -O keylocation=file:///root/zfs/YOUR_KEY_FILE \
  -O xattr=sa \ # Store the extended filesystem attributes along with the data. Good for performance.
  -O dnodesize=auto \ # Set sufficient space for system attributes. Not compatible with having GRUB2 boot directly from this dataset.
  -O compression=on \ # Compression helps performance. lz4 is the default algorithm.
  -O relatime=on \ # Update access time only when it hasn't been updated for 24 hours.
  -m /mnt/NAME_OF_POOL \ # Mount point for the pool
  <NAME_OF_POOL> \
  [raidz(2|3)|mirror] \ # Pool/RAID type
  <NAMES_OF_DISKS> # e.g. /dev/sda etc.
```
"-o" = pool property, "-O" = filesystem property.
Getting ashift right is absolutely essential,
as it cannot be changed later except by completely destroying and recreating the entire pool.
The vast majority of modern HDDs have a sector size of 4 KB, which requires ashift=12 (or greater).
Some SSDs can have a sector size of 8 KB, for which ashift=13 would be optimal.
However, SSD firmware is designed to handle 4 KB writes, and therefore ashift=12 will probably give
practically equal performance.
Therefore, for simplicity I'm using ashift=12 everywhere.
However, some enterprise SSDs are an exception and will require ashift=13.

Creating the datasets
``` bash
# For files
zfs create <YOUR_POOL>/<YOUR_DATASET>
# For photos, movies and large backups
zfs create <YOUR_POOL>/<YOUR_DATASET> -o recordsize=1M
```
Optimal record size depends on the purpose of the dataset
It can be changed later, but it applies for new data only.
For databases, you should use a smaller record size, e.g. 8KB for PostgreSQL.
- [Tuning 1](https://jrs-s.net/2018/08/17/zfs-tuning-cheat-sheet/)
- [Tuning 2](https://klarasystems.com/articles/tuning-recordsize-in-openzfs/)


### Cache
In home use you probably don't need SLOG or L2ARC.
Get at least 128 GB RAM first.

L2ARC can be on a non-mirrored drive.
In general higher size is better, but you will need RAM for indexing the L2ARC.
``` bash
lvcreate -L500G -n zfs-cache target-vg
```

ZLOG should be on a mirrored drive that does not have a large integrated cache.
The size of a ZLOG can be small.
Intel Optane SSDs (16-32 GB) are good choices.
``` bash
lvcreate -L100G -n zfs-log target-vg
```


### Using ZFS for Proxmox VMs
Storing the boot disks of virtual machines directly on ZFS is based on ZVOLs, not ZFS datasets.
ZVOLs have a fixed volblocksize, whereas datasets have a variable record size,
where the setting (default 128 KB, max. 1 MB) is the maximum size.
For virtual machines you should set the volblocksize based on the smallest block size your workload is going to have,
as attempting to write a block smaller than volblocksize hurts performance.

Go to Proxmox -> Datacenter -> Storage -> Add.
Select your ZFS pool. You can use its name as the ID.
Enable
[thin provision](https://www.reddit.com/r/Proxmox/comments/n0cwb0/a_guide_to_thin_provisioning_with_proxmox/)
so that TRIM in the VMs will free up space on the host.
In the Proxmox GUI the volblocksize is simply called "Block Size",
and it's set globally for all ZVOLs created through Proxmox.
If you create ZVOLs manually, you can specify independent volblocksizes for them.
My VMs are going to be running PostgreSQL, and therefore the Proxmox default of 8 KB is good for my purposes.


### ACLs
Full compatibility with Windows clients requires NFS4 ACLs,
[which are not yet supported by ZFS on Linux](https://github.com/openzfs/zfs/issues/4966).
The other options are to
1) Use POSIX ACLs with ZFS, which causes translation issues between the filesystem and Windows clients.
2) Use acl_xattr, which stores the ACLs as xattr attributes.
  The ACL access control is therefore not enforced by the filesystem, and not used for local access.

If you need ACLs, you can enable them after creating the pool or dataset with:
``` bash
zfs set acltype=posixacl <nameofzpool>/<nameofdataset>
```

### Backups and snapshots
[zrepl](https://zrepl.github.io/)

### Creating a VM
System
- Machine: q35 (Necessary for PCIe passthrough)
- BIOS: OVMF (UEFI)
- EFI storage: same as for the VM root disk
- SCSI Controller: VirtIO SCSI single
- QEMU Agent: yes (for Linux)
- Add TPM: yes (if you're planning to use the TPM for e.g. SSH client)

Disks
- Bus/Device: [SCSI (virtio-scsi)](https://www.ovirt.org/develop/release-management/features/storage/virtio-scsi.html)
  - VirtIO Block may be faster in some scenarios,
    but it's legacy and should therefore not be used for new installations.
- Discard: yes

CPU
- Cores: If you have many VMs, it's a good idea to set this to 1/2 of your total core count.
  This way a single VM can use many of CPU cores if needed, but can't block the entire CPU.

Network:
- Model: VirtIO (paravirtualized)

When installing the OS, there's little need for LVM, as snapshots can be handled at the Proxmox level.
Therefore I have chosen to install my Ubuntu VMs without LVM.

### Samba
ZFS has integrated SMB sharing, which uses Samba in the background, but it's rather rudimentary.
For better control over Samba settings you should run Samba separately,
and preferably in an LXC container for isolation.

To mount a host directory to an LXC container, run:
``` bash
pct set XXX -mpY /host_dir,mp=/container_dir
```
where XXX is the container number, and Y is the number of the mount point, starting from 0.

In the Samba settings, set these:
```
vfs objects = acl_xattr
inherit acls = yes
map acl inherit = yes
# Only required for Samba < 4.9.0
# store dos attributes = yes
```


#### Shadow Copy with ZFS snapshots
This is possible, but I haven't tried it myself, since I'm using primarily Linux clients.
- [Instructions](https://forum.openmediavault.org/index.php?thread/43915-install-zfs-snapshot-and-enable-samba-shadow-copy-previous-versions-for-windows/)
- [Instructions 2](https://medium.com/@Dylan.Wang/how-to-use-zfs-zfs-auto-snapshot-package-samba-to-support-windows-shadow-copy-on-ubuntu-18-04-15001c9580fc)


### pfSense
[Official instructions](https://docs.netgate.com/pfsense/en/latest/recipes/virtualize-proxmox-ve.html)

### Docker in LXC
Running Docker in LXC can be very handy, but it's not officially supported and may result in errors.
- If you have any issues, ensure that the LXC features `keyctl=1,nesting=1` enabled.

Using OpenZFS < 2.2 results in errors of the form `overlayfs: upper fs does not support RENAME_WHITEOUT`.
[This will be fixed in OpenZFS 2.2](https://github.com/openzfs/zfs/issues/8648#issuecomment-1452448356)

Errors of the form `failed to register layer: unlinkat ... invalid argument` are caused by running Docker in LXC.
- [StackOverflow](https://stackoverflow.com/a/75270574)
- [Reddit](https://www.reddit.com/r/nginxproxymanager/comments/11n21lw/unable_to_pull_npm_docker_image_on_proxmox_ubuntu/)
- [Proxmox forums](https://forum.proxmox.com/threads/docker-failed-to-register-layer-applylayer-exit-status-1-stdout-stderr-unlinkat-var-log-apt-invalid-argument.119954/)

Increasing the UID and GID mapping ranges for the LXC container would probably fix the problem,
but the container cannot start if those are increased.

Default
```
lxc.idmap: u 0 100000 65536
lxc.idmap: g 0 100000 65536
```
Modified (does not work)
```
lxc.idmap: u 0 100000 1000000
lxc.idmap: g 0 100000 1000000
```

Workaround: [change from overlayfs2 to fuse-overlayfs](https://webdock.io/en/docs/how-guides/docker-guides/how-change-the-docker-storage-driver)
- You may also have to enable FUSE for the container in the LXC settings.


### Nvidia GPU Passthrough for Docker in LXC
- On the host
  - Remove previous versions of the Nvidia driver: `apt purge "^cuda.*$" "^libnvidia.*$" "^nvidia.*$"`
  - [Enable the contrib and non-free repositories](https://wiki.debian.org/NvidiaGraphicsDrivers)
  - [Enable the CUDA repository](https://developer.nvidia.com/cuda-downloads)
  - Install the drivers
    - If you have a [GPU supported by the open kernel module](https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus):
      `apt-get install nvidia-kernel-open-dkms cuda-drivers nvidia-smi`
    - If not, leave the `nvidia-kernel-open-dkms` out: `apt-get install cuda-drivers nvidia-smi`
    - Be careful when installing! Attempting to install `firmware-misc-nonfree` may conflict with Proxmox!
  - Reboot
  - Test that the driver works using `nvidia-smi`. Take note of the driver version,
    as you will have to install exactly the same driver version inside the LXC container.
  - If `nvidia-smi` gives the error
    `NVIDIA-SMI has failed because it couldn't communicate with the NVIDIA driver. Make sure that the latest NVIDIA driver is installed and running.`,
    and if you have had some different Nvidia packages installed,
    please purge all Nvidia packages as instructed above, and start again.
    If this does not help, please see [this thread](https://forum.proxmox.com/threads/unable-to-load-nvidia-drivers-not-blacklisted.79034/).
    For me, purging and reinstalling all the packages was sufficient, but your experience may be different.
- If you are using LXC directly on top of e.g. Ubuntu instead of Proxmox, follow the
  [Ubuntu instructions](https://ubuntu.com/tutorials/gpu-data-processing-inside-lxd)
  based on `nvidia.runtime=true`. If you're using Proxmox, continue following these instructions instead.
- Setup the LXC container
  - Setup the LXC container as usually
  - Stop the container
  - On the host, edit `/etc/pve/lxc/<container_number>.conf` as instructed [here](https://jocke.no/2022/02/23/plex-gpu-transcoding-in-docker-on-lxc-on-proxmox/)
    - For me the numbers were 195, 503 and 511
    - Link also the `/dev/dri` and `/dev/fb0` as instructed
      [here](https://forum.proxmox.com/threads/gpu-passthrough-to-lxc-container.114106/)
  - Start the container
  - Install the same version of the Nvidia drivers as on the host, but without the kernel module, e.g.
    `apt-get install nvidia-headless-no-dkms-560 nvidia-utils-560 libnvidia-encode-560 libnvidia-decode-560`
    - Use exactly the same driver version as on the host.
    - The LXC container shares its kernel with the host, which already has the DKMS kernel module.
    - If you don't install the encoding and decoding libraries, FFmpeg will crash when attempting to transcode.
  - Test that the driver works using `nvidia-smi` in the container. You may have to reboot the container first.
- Once the driver works, lock the package versions so that automatic upgrades won't cause a version mismatch.
  Locking merely `nvidia-kernel-open-dkms` and `cuda-drivers` is not sufficient,
  as `apt` may still update their dependencies.
  Therefore, you also have to lock the dependencies that have the same version number as those packages.
  - On the host:
    `apt-mark hold firmware-nvidia-gsp libegl-nvidia0 libgl1-nvidia-glvnd-glx libgles-nvidia1 libgles-nvidia2 libglx-nvidia0 libnvidia-allocator1 libnvidia-cfg1 libnvidia-egl-xcb1 libnvidia-eglcore libnvidia-encode1 libnvidia-fbc1 libnvidia-glcore libnvidia-glvkspirv apt-mark hold firmware-nvidia-gsp libegl-nvidia0 libgl1-nvidia-glvnd-glx libgles-nvidia1 libgles-nvidia2 libglx-nvidia0 libnvidia-allocator1 libnvidia-cfg1 libnvidia-egl-xcb1 libnvidia-eglcore libnvidia-encode1 libnvidia-fbc1 libnvidia-glcore libnvidia-glvkspirv libnvidia-gpucomp libnvidia-ml1 libnvidia-nvvm4 libnvidia-opticalflow1 libnvidia-pkcs11 libnvidia-ptxjitcompiler1 libnvidia-rtcore libnvidia-vksc-core nvidia-alternative nvidia-cuda-mps nvidia-driver nvidia-driver-bin nvidia-driver-libs nvidia-egl-common nvidia-egl-icd nvidia-kernel-open-dkms nvidia-kernel-support nvidia-modprobe nvidia-opencl-common nvidia-opencl-icd nvidia-persistenced nvidia-settings nvidia-smi nvidia-suspend-common nvidia-vdpau-driver nvidia-vulkan-common nvidia-vulkan-icd nvidia-xconfig xserver-xorg-video-nvidia`
    - Note that if you are not using the open kernel module, you have to replace `nvidia-kernel-open-dkms` with `nvidia-kernel-dkms`.
  - On the container:
    `apt-mark hold libnvidia-cfg1-560 libnvidia-compute-560 libnvidia-decode-560 libnvidia-encode-560 nvidia-compute-utils-560 nvidia-firmware-560-560.28.03 nvidia-headless-no-dkms-560 nvidia-kernel-common-560 nvidia-kernel-source-560 nvidia-utils-560`
- Setup Docker
  - Install Docker
  - Install [NVIDIA container runtime](https://gitlab.com/nvidia/container-toolkit/container-toolkit/-/tree/main/cmd/nvidia-container-runtime)
  - Test that the GPU is visible in the container:
    ```sudo docker run --gpus all nvidia/cuda:12.2.2-base-ubuntu22.04 nvidia-smi``` (change the version tag to the latest available)
  - If you get an error about cgroups, follow
    [these instructions](https://www.reddit.com/r/Proxmox/comments/s0ud5y/comment/jl4lef2/).
- Follow the instructions for your Docker container, e.g.
  [Jellyfin](https://jellyfin.org/docs/general/administration/hardware-acceleration/nvidia/).
  - If nvidia-smi works in the container but transcoding crashes, check the FFmpeg logs in the Jellyfin dashboard.
    You may be missing some libraries in the LXC container,
    such as the `libnvidia-encode` and `libnvidia-decode` mentioned above.
