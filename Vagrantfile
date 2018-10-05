# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANT_API_VERSION = "2"

Vagrant.configure(VAGRANT_API_VERSION) do |config|
  # General Vagrant VM configuration
  config.vm.box = "ringo/scientific-linux-6.5"
  config.ssh.insert_key = false
  config.vm.synced_folder ".", "/vagrant", disabled: true
  config.vm.provider :virtualbox do |v|
    v.memory = 4096
    v.cpus = 4
    v.linked_clone = true
  end
  # Palfinder VM
  config.vm.define "palfinder" do |palfinder|
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
    cetus.vm.hostname = "cetus"
    cetus.vm.network :private_network, ip: "192.168.60.5"
    cetus.vm.provision "shell", inline: <<-SHELL
    service iptables stop
    mkdir -p /mnt/rvmi
    chmod ugo+rwX /mnt/rvmi/
  SHELL
  end
end
