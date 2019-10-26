#!/bin/bash

mkdir /tmp/setup

cd /tmp/setup

wget https://github.com/loidor/publika/raw/master/setup.zip

unzip setup.zip

# update, upgrade
apt update && apt upgrade -y

# autologin, run restore on logout
mv lightdm.conf /etc/lightdm/lightdm.conf

# install packages for libkiclient
apt install libqt5webkit5 libqt5script5

# install software
mv backup /usr/local/bin/backup
chmod +x /usr/local/bin/backup

mv restore /usr/local/bin/restore
chmod +x /usr/local/bin/restore

mv demapper /usr/local/bin/demapper
chmod +x /usr/local/bin/demapper

mv libkiclient /usr/local/bin/libkiclient
chmod +x /usr/local/bin/libkiclient

# edit autostart
# remove ctrl-alt-backspace, mintwelcome, mintupdate
# add libkiclient and demapper

mv autostart/ /home/libki/.config/autostart/

# edit screensaver and power management (sleep/hibernation, power button)
# TESTING
mv user /home/public/.config/dconf/user

#### add printer
# lpadmin, test this out

# install chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i google-chrome-stable_current_amd64.deb

# change start page

mv Preferences /home/public/.config/google-chrome/Default/Preferences

# change keyring password to empty

rm /home/public/.local/share/keyrings/*
google-chrome

# edit quick start, remove terminal, firefox

rm /home/public/.cinnamon -rf
mv .cinnamon /home/public/.cinnamon

# edit writer, make docx default

mv libreoffice /home/public/.config/libreoffice

# edit menu and delete logout/shutdown

mv applet.js /usr/share/cinnamon/applets/menu@cinnamon.org/applet.js

# add desktop icons
mv Skrivbord/ /home/public/Skrivbord/

# install rbash
apt install rbash
chsh -s /bin/rbash public

# Copy and edit Libki.ini

mv Libki.ini /home/public/.config/Libki.ini
nano /home/public/.config/Libki.ini

# chown everything

chown public:public /home/public -R

backup

exit 0
