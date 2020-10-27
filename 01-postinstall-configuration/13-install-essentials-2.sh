#!/bin/sh

ROOT_DIR="$(realpath "$(dirname "$0")")/.."
. "$ROOT_DIR/.functions.sh"

####################################################################

print_message "#### Installing essentials from AUR ####"

####################################################################

check_user

####################################################################

print_message "#### Installing file manager ####"

install_packages lf

print_message "#### Installing archives management tools ####"

install_packages archivemount

print_message "#### Installing editor functionality extension tools ####"

install_packages nvimpager-git xxd-standalone

print_message "#### Install patched Terminus font ####"

uninstall_packages terminus-font
install_packages terminus-font-ll2-td1-dv1-ij1

print_message "#### Installing Roswell ####"

install_packages roswell

print_message "#### Install Roswell applications ####"

ros install ivanp7/remote-control
ros install ivanp7/directory-editing-script-generator

print_message "#### Installing Lisp development, programming and debugging tools ####"

install_packages quicklisp

####################################################################

finish

