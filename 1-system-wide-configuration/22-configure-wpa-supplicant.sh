#!/bin/sh

SCRIPT_DIR=$(realpath `dirname $0`)
. $(realpath $SCRIPT_DIR/..)/functions.sh

####################################################################

print_message "#### Installing WPA supplicant ####"

####################################################################

check_root

####################################################################

install -Dm 644 $(aux_dir)/wpa_supplicant.conf /etc/wpa_supplicant/
sed -i '/^Exec=/ s@$@ -f /var/log/wpa_supplicant.log@' /usr/share/dbus-1/system-services/fi.w1.wpa_supplicant1.service

####################################################################

finish
