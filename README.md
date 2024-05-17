README.md

# _What is this project all about?_
This is everything you need to successfully use PCI/PCIe Passthrough for your 3dfx card on a modern Linux distribution with a compatible motherboard. This is a simple toolset to get it up and running. This project also includes a pre-configured qcow2 disk image with all drivers pre-installed so you don't have to type a single character into a command line or terminal.

# _What works?_
* Most titles that support Glide, OpenGL & MiniGL
* Voodoo 2 pass-through

# _What doesn't work?_
* 2D/3D 3dfx cards are NOT working at this stage

## _Prerequisites_

* Modern motherboard that has a PCI slot.
* A compatible PCI 3dfx 3D Accelerator
* Linux distro that you can install virt-manager on (Ubuntu, Fedora, Manjaro, Arch etc)
* CPU that supports VT-d/IOMMU and/or PCI/PCIe pass-through
* Motherboard that allows VT-d/IOMMU to be enabled

## _Required Packages for Installation_
### Debian/Ubuntu

#### Install KVM, QEMU and virt-manager
``$ sudo apt update``

``$ sudo apt install qemu libvirt-daemon-system libvirt-clients bridge-utils virt-manager ovmf``

#### Enable QEMU/KVM
``$ sudo systemctl enable libvirtd``

``$ sudo systemctl start libvirtd``

#### Add users to libvirt Group
``$ sudo useradd -g $USER libvirt``

``$ sudo useradd -g $USER libvirt-kvm``

### Fedora/Redhat
#### Install KVM, QEMU and virt-manager
``$ sudo dnf install -y libvirt-devel virt-top libguestfs-tools guestfs-tools``

#### Enable QEMU/KVM
``$ sudo systemctl enable libvirtd``

``$ sudo systemctl start libvirtd``

### Arch/Manjaro

#### Install KVM, QEMU and virt-manager
``$ sudo pacman -S virt-manager qemu vde2 ebtables dnsmasq bridge-utils openbsd-netcat``

#### Enable QEMU/KVM
``$ sudo systemctl enable libvirtd.service``

``$ sudo systemctl start libvirtd.service``

## _Known/Possibly Compatible Motherboards_
### Intel Boards
* Gigabyte B660M D3H DDR4
* Gigabyte B760M D3H DDR4
* ASRock B760M-HDVP
* ASRock H610M-HDVP/D5 R2.0
* Asus PRO H610M-CT D4-CSM
* MSI PRO H610M-C EX
* Asus PRO H610M-C D4-CSM
* Asus Pro H610M-C-CSM
* Gigabyte H610M HD3P (rev. 1.0)
* ASRock B660M-HDVP/D5
* Asus Pro H610M-CT2 D4-CSM
* Gigabyte H610M HD3P (rev. 2.0)
* Gigabyte B560M

### AMD Boards
* ECS B450AM4-M
* Biostar B550GTA
* Asus Pro B550M-C/CSM
* MSI B350 TOMAHAWK ARCTIC
* MSI B350 TOMAHAWK
* Asus PRIME B350-PLUS
* MSI B350 PC MATE
* MSI B350 GAMING PLUS
* Gigabyte GA-AB350M-D3H
* Biostar B350GT5
* Biostar X470GTA

(this list will be expanded)

## _Known Working Motherboards_
* Gigabyte B660M D3H DDR4

(this list will be expanded)


## _PCI 3dfx cards confirmed working_
* Creative Labs 3D Blaster Voodoo2 12MB

## _TODO_
* Install script based on your Linux distro
* Additional performance tweaks

(this list will be expanded)

I am currently testing other PCI Video cards and 3D accelerators too. I will keep this updated with my findings.

If you find any other motherboards or cards please reach out to us so we can add them to this list.

This should also work with any other motherboard that will allow you to use PCIe to PCI converters/risers.

The XML configuration files for virt-manager will be released over the next few days.