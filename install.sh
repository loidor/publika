#!/bin/bash

apt-get update

apt-get upgrade -y

mkdir /tmp/setup

cd /tmp/setup

wget https://github.com/loidor/publika/raw/master/setup.zip

unzip setup.zip
