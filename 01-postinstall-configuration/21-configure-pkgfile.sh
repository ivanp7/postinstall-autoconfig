#!/bin/sh

ROOT_DIR="$(realpath "$(dirname "$0")")/.."
. "$ROOT_DIR/.functions.sh"

####################################################################

print_message "#### Configuring pkgfile ####"

####################################################################

check_root

####################################################################

add_cronjob '@daily /usr/bin/pkgfile --update'
pkgfile --update

####################################################################

finish

