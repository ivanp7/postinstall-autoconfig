#!/bin/sh

ROOT_DIR="$(realpath "$(dirname "$0")")/.."
. "$ROOT_DIR/.functions.sh"

####################################################################

print_message "#### Enabling TLS ttunnel service ####"

####################################################################

check_root

####################################################################

install_and_enable_service tls-tunnel log

####################################################################

finish

