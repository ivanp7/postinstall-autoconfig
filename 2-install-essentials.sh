#!/bin/bash

SCRIPT_DIR=$(realpath `dirname $0`)
source $SCRIPT_DIR/functions.sh

####################################################################

print_message "#### Installing terminal essentials ####"

####################################################################

initialize

####################################################################

install_official_packages base-devel
install_official_packages vim powerline powerline-fonts ranger w3m screen tmux
install_official_packages neofetch htop ncdu pkgfile
sudo pkgfile --update
install_official_packages openssh sshfs gnu-netcat wol rsync ethtool
install_official_packages p7zip atool
install_official_packages extundelete dosfstools ntfsprogs inotify-tools
install_official_packages jq
install_official_packages at cronie
sudo systemctl enable atd cronie
sudo systemctl start atd cronie
install_official_packages beep libcaca fbv

####################################################################

install_official_packages octave sbcl
cp $SCRIPT_DIR/aux/.octaverc ./
ln -sf $(realpath .octaverc) $HOME/

####################################################################

print_message "Installing vim-config..."
git clone $GIT_URL_PREFIX/vim-config.git
sh vim-config/install.sh
sudo sh vim-config/install.sh

print_message "Installing dotfiles..."
git clone $GIT_URL_PREFIX/dotfiles.git
sh dotfiles/install.sh
sudo sh dotfiles/install.sh

####################################################################

print_message "Installing yay..."
cd /tmp
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg --noconfirm -si
cd /home/shared

####################################################################

print_message "Installing bash-completion..."
install_official_packages bash-completion
sudo mkdir -p /usr/share/bash_completion.d
sudo ln -s /usr/share/bash_completion.d /etc/

print_message "Installing tmux-bash-completion..."
install_packages tmux-bash-completion

####################################################################

print_message "Installing tty-clock, when, todotxt, kpcli..."
install_packages tty-clock when todotxt kpcli perl-capture-tiny perl-clipboard

####################################################################

print_message "Configuring system..."
sudo sed -i "s/#NAutoVTs=6/NAutoVTs=12/" /etc/systemd/logind.conf

print_message "Setting grub wallpaper..."
sudo cp $SCRIPT_DIR/aux/archlinux.png /boot/grub/
sudo sed -i 's@^#GRUB_BACKGROUND=.*$@GRUB_BACKGROUND="/boot/grub/archlinux.png"' /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg

####################################################################

finish

