#!/bin/sh

ROOT_DIR="$(realpath "$(dirname "$0")")/.."
. "$ROOT_DIR/.functions.sh"

####################################################################

print_message "#### Installing tabbed ####"

####################################################################

check_user

####################################################################

clone_git_repo_and_cd tabbed-ivanp7 $GIT_URL_PREFIX/tabbed-ivanp7.git

HARDCODED_FONT="xos4 Terminus:size=12"
[ -n "$DEFAULT_FONT" ] && sed -i "s/$HARDCODED_FONT/$DEFAULT_FONT/" config.h

makepkg --noconfirm -si

####################################################################

finish

