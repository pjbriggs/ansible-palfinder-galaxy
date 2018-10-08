# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANT_API_VERSION = "2"

# If using Vagrant < 2 then need to update the default
# location for downloading boxes
# See https://stackoverflow.com/a/48844332/579925
Vagrant::DEFAULT_SERVER_URL.replace('https://vagrantcloud.com')

Vagrant.configure(VAGRANT_API_VERSION) do |config|
  # General Vagrant VM configuration
  config.ssh.insert_key = false
  config.vm.synced_folder ".", "/vagrant", disabled: true
  config.vm.provider :virtualbox do |v|
    v.memory = 4096
    v.cpus = 4
    v.linked_clone = true
  end
  # Palfinder VM
  config.vm.define "palfinder" do |palfinder|
    palfinder.vm.box = "ringo/scientific-linux-6.5"
    palfinder.vm.hostname = "palfinder"
    palfinder.vm.network :private_network, ip: "192.168.60.4"
    palfinder.vm.provision "shell", inline: <<-SHELL
    service iptables stop
    mkdir -p /mnt/rvmi
    chmod ugo+rwX /mnt/rvmi/
  SHELL
  end
  # Cetus Teaching VM
  config.vm.define "cetus" do |cetus|
    cetus.vm.box = "ringo/scientific-linux-7.1"
    cetus.vm.hostname = "cetus"
    cetus.vm.network :private_network, ip: "192.168.60.5"
    cetus.vm.provision "shell", inline: <<-SHELL
    service firewalld stop
    mkdir -p /mnt/rvmi
    mkdir -p /mnt/bmh01-rvmi/bcf-galaxy/
    chmod ugo+rwX /mnt/rvmi/ /mnt/bmh01-rvmi/bcf-galaxy/
  SHELL
  end
end
