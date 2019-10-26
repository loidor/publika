#!/bin/bash

apt-get update

apt-get upgrade -y

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

# edit autostart
# remove ctrl-alt-backspace, mintwelcome, mintupdate
# add libkiclient and demapper

mv autostart /home/public/.config/

# edit screensaver and power management (sleep/hibernation, power button)
# TESTING
mv user /home/public/.config/dconf/user

#### add printer
# lpadmin, test this out

# install chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i google-chrome-stable_current_amd64.deb

### Run Chrome
echo "STARTA CHROME NU OCH STÄNG DET SEDAN."
read -p "TRYCK ENTER NÄR DET ÄR KLART." CHROMEVOID
