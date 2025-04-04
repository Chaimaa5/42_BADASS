#!/bin/bash

if [[ $EUID -ne 0 ]]; then
	echo "Matnssash trunni script with sudo -E to preserve your users env!!"
	exit 1
fi
#-----------------------------------------------------------------------------#
#Docker Installation
apt update
apt-get install vim wget curl git-all apt-transport-https ca-certificates gnupg gnupg2 software-properties-common gpg xterm busybox-static libpcap-dev -y
apt-get update
apt-get install docker.io -y
groupadd docker
usermod -aG docker $SUDO_USER
newgroup docker
#Adding Docker Compose
curl -L "https://github.com/docker/compose/releases/download/v2.34.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
#-----------------------------------------------------------------------------#
#GNS3 & WireShark Installation
apt-add-repository --component non-free --yes
apt-get install python3 python3-pip pipx python3-pyqt5.qtsvg python3-pyqt5.qtwebsockets qemu-kvm qemu-utils libvirt-clients libvirt-daemon-system virtinst dynamips -y
pipx install gns3-server
pipx install gns3-gui
pipx inject gns3-gui gns3-server PyQt5
pipx ensurepath
apt-get install wireshark -y
usermod -aG wireshark $SUDO_USER
newgroup wireshark
git clone https://github.com/GNS3/ubridge.git
./ubridge/make
./ubridge/make install
#-----------------------------------------------------------------------------#
#VSCode Installation (because why not ?)
# wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
# install -D -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/packages.microsoft.gpg
# sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
# apt update
# apt install code
# rm -f ./packages.microsoft.gpg
# -----------------------------------------------------------------------------#


