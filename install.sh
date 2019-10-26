#!/bin/bash

# update, upgrade
apt update && apt upgrade -y

# autologin, run restore on logout
cp lightdm.conf /etc/lightdm/lightdm.conf

# install packages for libkiclient
apt install libqt5webkit5 libqt5script5

# install software
cp backup /usr/local/bin/backup
chmod +x /usr/local/bin/backup

cp restore /usr/local/bin/restore
chmod +x /usr/local/bin/restore

cp demapper /usr/local/bin/demapper
chmod +x /usr/local/bin/demapper

cp libkiclient /usr/local/bin/libkiclient
chmod +x /usr/local/bin/libkiclient

# edit autostart
# remove ctrl-alt-backspace, mintwelcome, mintupdate
# add libkiclient and demapper

cp autostart/* /home/libki/.config/autostart/

# edit screensaver and power management (sleep/hibernation, power button)
# TESTING
cp user /home/public/.config/dconf/user

#### add printer
# lpadmin, test this out

# install chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i google-chrome-stable_current_amd64.deb

# change start page

cp Preferences /home/public/.config/google-chrome/Default/Preferences

# change keyring password to empty

rm /home/public/.local/share/keyrings/*
google-chrome

# edit quick start, remove terminal, firefox

rm /home/public/.cinnamon -rf
cp .cinnamon /home/public/.cinnamon -r

# edit writer, make docx default

cp libreoffice /home/public/.config/libreoffice -r

# edit menu and delete logout/shutdown

cp applet.js /usr/share/cinnamon/applets/menu@cinnamon.org/applet.js

# add desktop icons
cp Skrivbord/* /home/public/Skrivbord/

# install rbash
apt install rbash
chsh -s /bin/rbash public

# Copy and edit Libki.ini

cp Libki.ini /home/public/.config/Libki.ini
nano /home/public/.config/Libki.ini

# chown everything

chown public:public /home/public -R

backup

exit 0
