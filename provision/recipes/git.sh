#!/bin/bash


echo "Installing Git"
sudo apt-get update
sudo apt-get install -y -qq \
  git

# Add the SSH key for bitbucket.org to known_hosts
sudo sh -c 'ssh-keyscan -t rsa bitbucket.org >> /root/.ssh/known_hosts'
