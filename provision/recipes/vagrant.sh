#!/bin/bash

# Copy files into appropriate places with permissions
cp $VAGRANT_PROVISION_DIR/files/id_rsa /home/ubuntu/.ssh/id_rsa
chmod 0600 /home/ubuntu/.ssh/id_rsa

cp $VAGRANT_PROVISION_DIR/files/id_rsa.pub /home/ubuntu/.ssh/id_rsa.pub
chmod 0644 /home/ubuntu/.ssh/id_rsa.pub

cp $VAGRANT_PROVISION_DIR/files/bash_profile.sh /home/ubuntu/.bash_profile
chmod 0644 /home/ubuntu/.bash_profile

# Edit hosts file to recognize dummy.lvh.me
echo '127.0.0.1  dummy.lvh.me' | sudo tee -a /etc/hosts
