#!/bin/bash
set -e

WEB_ROOT=/srv/dummy-phpapp
ENV_FILE="$WEB_ROOT/.env"
VAGRANT_PROVISION_DIR=$WEB_ROOT/provision

# Set local timezone
sudo timedatectl set-timezone America/New_York

# Update apt catalog and upgrade installed packages
sudo apt-get update
# Upgrade packages with noninteractive shell
# https://askubuntu.com/questions/146921/how-do-i-apt-get-y-dist-upgrade-without-a-grub-config-prompt
sudo DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" upgrade

# Install base system packages
sudo apt-get -qq install -y \
  build-essential \
  ntp \
  unzip

# Vagrant specific
source $VAGRANT_PROVISION_DIR/recipes/vagrant.sh

# Install Git
source $VAGRANT_PROVISION_DIR/recipes/git.sh

# Install Apache
source $VAGRANT_PROVISION_DIR/recipes/apache.sh

# Install PHP
source $VAGRANT_PROVISION_DIR/recipes/php.sh

# Install PHP
source $VAGRANT_PROVISION_DIR/recipes/composer.sh

# Install NodeJS
source $VAGRANT_PROVISION_DIR/recipes/nodejs.sh

# Install App components
source $VAGRANT_PROVISION_DIR/recipes/app.sh

# Finish
echo "Finish Provisioning"
exit 0
