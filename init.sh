#!/usr/bin/env bash

test -f /etc/redhat-release || { echo "Red Hat–based system required. /etc/redhat-release not found."; exit 1; }
[ "$(id -u)" -ne 0 ] && { echo "This script must be run as root (e.g., sudo $0)."; exit 1; }

dnf -y update
dnf -y install git make tar

reponame="YS0"
rm -rf /tmp/${reponame}
git clone https://github.com/YumaYX/${reponame}.git /tmp/${reponame}
cd /tmp/${reponame} && time make all

