#!/bin/bash

echo "Installing Apache"

# Install packages
sudo apt-get update
sudo apt-get -qq install -y \
  apache2


# Remove the default apache2 vhost from sites-enabled
if [ -f /etc/apache2/sites-enabled/000-default.conf ]; then
  sudo rm /etc/apache2/sites-enabled/000-default.conf
fi

# Remove all modules
if [ -d /etc/apache2/mods-enabled/ ]; then
  # Remove all loaded modules
  sudo rm -rf /etc/apache2/mods-enabled/*
fi

# Uncomment <Directory /srv/ /> apache configuration block
sudo sed -i "170,175 s/# *//" /etc/apache2/apache2.conf

# Install perfered apache modules
source $VAGRANT_PROVISION_DIR/recipes/apache/modules.sh

# Restart Apache
sudo service apache2 restart
