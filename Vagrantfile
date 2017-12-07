# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|

  config.vm.define :development, primary: true do |config|
    config.vm.synced_folder ".", "/srv/dummy-phpapp", nfs: false

    config.vm.box      = 'ubuntu/xenial64'
    config.vm.hostname = 'web01.dummy.dev'

    config.vm.network :private_network, ip: '192.168.66.10'

    # Forward Apache
    config.vm.network :forwarded_port, guest: 80, host: 8888
    config.vm.network :forwarded_port, guest: 8080, host: 8080

    config.vm.provision :shell, inline: '/bin/bash /srv/dummy-phpapp/provision/install.sh', keep_color: true, privileged: false

    config.vm.provider "virtualbox" do |v|
      v.memory = 1024
    end
  end
end
