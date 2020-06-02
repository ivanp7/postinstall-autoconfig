#!/bin/sh

SCRIPT_DIR=$(realpath `dirname $0`)
. $(realpath $SCRIPT_DIR/..)/functions.sh

####################################################################

print_message "#### Enabling Intel IOMMU ####"

####################################################################

check_root

####################################################################

grep -q '^GRUB_CMDLINE_LINUX_DEFAULT=[^#]*iommu' /etc/default/grub || {
    sed -i "/^GRUB_CMDLINE_LINUX_DEFAULT=/ s@\"@\"intel_iommu=on iommu=pt @" /etc/default/grub
    grub-mkconfig -o /boot/grub/grub.cfg
}

####################################################################

finish

