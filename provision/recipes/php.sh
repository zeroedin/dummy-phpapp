#!/bin/bash

echo "Installing PHP"
sudo apt-get update
# Install PHP packages
sudo apt-get -qq install -y \
  libapache2-mod-php7.0 \
  php7.0 \
  php7.0-cgi \
  php7.0-cli \
  php7.0-dev \
  php-pear

# Install apache module
echo 'Enable Mod PHP'
sudo a2enmod php7.0

# Restart Apache
sudo service apache2 restart
