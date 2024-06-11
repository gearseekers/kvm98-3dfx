#!/bin/sh

clear
cat ./inc/logo.k98
echo ""
echo ""
echo '\033[1m This installer will detect your Linux distro and do all of the heavy lifting!\033[0m'
echo '\033[1m You will need approximately 4GB of free disk space.\033[0m'
echo '\033[1m Make sure you read the README.md file or the wiki for help.\033[0m'
echo '\033[1m Your sudo password is required (do not run as root!)\033[0m'
echo ""
printf ' Do you want to install kvm98-3dfx? (y/n): '
old_stty_cfg=$(stty -g)
stty raw -echo ; answer=$(head -c 1) ; stty $old_stty_cfg
if [ "$answer" != "${answer#[Yy]}" ];then
    echo Yes
else
    echo ""
    echo " Seeya next time mate!"
    echo ""
    break;
    exit
fi

. /etc/os-release

case $ID in
  ubuntu) echo " You're running Ubuntu!"
                sudo sh ./packages/ubuntu.packages
                     sh ./packages/ubuntu.install
                     sh ./inc/launch.vm
    ;;

  debian) echo " You're running Debian!"
                sudo sh ./packages/ubuntu.packages
                     sh ./packages/ubuntu.install
                     sh ./inc/launch.vm
    ;;

  arch) echo "You're running Arch Linux....btw!"
                sudo sh ./packages/arch.packages
                     sh ./packages/arch.install
                     sh ./inc/launch.vm
    ;;

  manjaro) echo "You're running Manjaro Linux....of course!"
                sudo sh ./packages/arch.packages
                     sh ./packages/arch.install
                     sh ./inc/launch.vm
    ;;

  centos) echo "You're running CentOS!"
                sudo sh ./packages/fedora.packages
                     sh ./packages/fedora.install
                     sh ./inc/launch.vm
    ;;

  fedora) echo "You're running CentOS!"
                sudo sh ./packages/fedora.packages
                     sh ./packages/fedora.install
                     sh ./inc/launch.vm
    ;;

  *) echo " This is an unknown distro. Check out our Github we might add support for your distro soon."
      ;;

esac

