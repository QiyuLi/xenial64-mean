#!/bin/bash

# This shell is running on vagrant
# Requires: Ubuntu Trusty64 with 1G memory and 2 cpu cores

echo ''
echo '=========================================='
echo '====                                  ===='
echo '====                                  ===='
echo '====        Installing MongoDB        ===='
echo '====                                  ===='
echo '====                                  ===='
echo '=========================================='
# Install MongoDB
if [ -z "$(command -v mongo)" ]; then
  echo 'Install MongoDB now...'
  # MongoDB 3.4
  sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0x0C49F3730359A14518585931BC711F9BA15703C6
  #echo "deb http://repo.mongodb.org/apt/ubuntu "$(lsb_release -sc)"/mongodb-org/3.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.4.list
  echo "deb http://repo.mongodb.org/apt/ubuntu "$(lsb_release -sc)"/mongodb-org/testing multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.4.list
  sudo apt-get update
  sudo apt-get -y install mongodb-org
  # Comment out MongoDB access restriction (only allow access from 127.0.0.1)
  sudo sed -e '/bind_ip/ s/^#*/#/' -i /etc/mongod.conf
  sudo sed -e '/bindIp/ s/^#*/#/' -i /etc/mongod.conf
else
  echo 'MongoDB already installed.'
fi
