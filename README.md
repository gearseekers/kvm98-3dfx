README.md

# _What is this project all about?_
This is everything you need to successfully use PCI/PCIe Passthrough to a Windows 98 virtual machine for your 3dfx card on a modern Linux distribution. This is a simple toolset to get it up and running. This project also includes a pre-configured qcow2 disk image with all drivers pre-installed so you don't have to type a single character into a command line or terminal. There will be a little bit of copy & pasting though :P

# _What works?_
* Most titles that support Glide, OpenGL & MiniGL
* Voodoo 2 pass-through

# _What doesn't work?_
* 2D/3D 3dfx cards are NOT working at this stage. (Voodoo3 etc)
* No AGP cards. We have no plans for AGP either.
* This doesn't work in WSL (Windows Subsystem for Linux). I have tested it and will try to come up with a solution.

## _Prerequisites_

* Modern motherboard that has a PCI slot.
* A compatible PCI 3dfx 3D Accelerator
* Linux distro that you can install virt-manager on (Ubuntu, Fedora, Manjaro, Arch etc)
* CPU that supports VT-d/IOMMU and/or PCI/PCIe pass-through
* Motherboard that allows VT-d/IOMMU to be enabled

## _NEW INSTALLER IS HERE!_

* Ubuntu, Debian, Arch and Manjaro should be working
* I am having some issues with Fedora for now. Working on a fix for 0.21

## _How to install_

* Clone this repo
* chmod +x install.sh
* Download the archive or let the installer download the archive.
* Installer will detect your distro, install all packages required and start the VM

## _What's not working_
* Fedora/CentOS
* A few other little bugs but I am ironing them out.

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

## _Installation_

Download a release from Github and follow the instructions for that release. Currently the steps are:

* Clone/Download kvm98-3dfx.zip from the repo and extract it to an accessible directory.
* Clone/Download kvm98-3dfx.xml from the repo.
* * I found a quirk with libvirtd & QEMU on Ubuntu you will need to run the following from the cloned directory if not already present

`sudo cat qemuconf >> /etc/libvirt/qemu.conf`
* Create Blank VM in virt-manager.
* In virt-manager preferences enable XML editing.
* Edit in a text editor kvm98-3dfx.xml and change the UUID to be anything different (change a single digit)
* Change the location of kvm98-3dfx.img to match your current filesystem
* (Optional) Change the location of data.iso to match your current filesystem
* Copy & Paste text XML into the Settings/Overview page in virt-manager for the Blank VM.
* Click OK/Apply.
* Close the current VM window and a new VM called "kvm98-3dfx" would have been created.
* Double check the PCI Device by either changing the Hardware ID or by removing the pre-installed device and adding your own in virt-manager
* Power up the VM (scandisk may run but everything will be fine)
* Play GAMES!
