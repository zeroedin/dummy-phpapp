#!/bin/bash

# Put the vhost file in place and link
vhost=/etc/apache2/sites-available/dummy.conf
link=/etc/apache2/sites-enabled/dummy.conf
if [ ! -f $vhost ]; then
  sudo cp $VAGRANT_PROVISION_DIR/files/vhost.conf $vhost
fi
if [ -h $link]; then
  echo "symlink already exists"
else
  sudo ln -s $vhost $link
fi

# Restart Apache
sudo service apache2 restart

cd $WEB_ROOT

# Install composer components
echo "Installing Composer compenents in $WEB_ROOT"
composer install

# Application log permissions
cd $WEB_ROOT
sudo chmod 777 -R logs
