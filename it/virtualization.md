# Virtualization
With virtualization, you can run multiple virtual computers
and therefore multiple operating systems on a single physical device.

## Comparison of different software
- KVM/QEMU/virt-manager/libvirt/Proxmox
  - Good PCIe passthrough support, even for consumer GPUs
  - High-performance network and storage, but this requires installation of custom drivers
    during Windows installation for Windows clients
  - With virt-manager the learning curve is not too high
  - TPM support
- Hyper-V
  - The latest Hyper-V Server is no longer available for free. 2019 is the last free version.
  - Does not support passing USB devices from the host
  - GPU passthrough is supported only for enterprise GPUs
  - TPM and TRIM support
  - Good integration with the Windows ecosystem (Active Directory etc.)
- VirtualBox
  - Cross-platform
  - Good for small testing environments
  - No PCIe passthrough (previous versions had a buggy implementation)
  - As of 2022, TPM and TRIM support are not yet implemented
