#!/bin/bash

if [[ $EUID -ne 0 ]]; then
	echo "Matnssash trunni script with sudo -E to preserve your users env!!"
	exit 1
fi

chrgp $SUDO_USER /usr/bin/dumpcap
chmod 754 /usr/bin/dumpcap
setcap 'CAP_NET_RAW+eip CAP_NET_ADMIN+eip' /usr/bin/dumpcap