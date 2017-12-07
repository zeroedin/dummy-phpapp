#!/bin/bash

# Install NodeJS && NPM
sudo apt-get update
# If you are using Ubuntu Precise or Debian Wheezy, you might want to read about running Node.js >= 4.x on older distros.
# https://github.com/nodesource/distributions/blob/master/OLDER_DISTROS.md
curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -

sudo apt-get install -y \
  nodejs
