#!/bin/bash

apt-get update

apt-get upgrade -y

mkdir /tmp/setup

cd /tmp/setup

wget https://github.com/loidor/publika/raw/master/setup.zip

unzip setup.zip

# autologin, run restore on logout
mv lightdm.conf /etc/lightdm/lightdm.conf

# install packages for libkiclient
apt-get install libqt5webkit5 libqt5script5 -y

# install software
mv backup /usr/local/bin/backup
chmod +x /usr/local/bin/backup

mv restore /usr/local/bin/restore
chmod +x /usr/local/bin/restore

mv demapper /usr/local/bin/demapper
chmod +x /usr/local/bin/demapper

mv libkiclient /usr/local/bin/libkiclient
chmod +x /usr/local/bin/libkiclient

