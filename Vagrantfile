# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANT_API_VERSION = "2"

# When using Vagrant >= 2.0.3 remove the line below to prevent
# errors like "Message: RuntimeError: can't modify frozen String"
# See e.g. https://github.com/p4lang/tutorials/issues/131
#Vagrant::DEFAULT_SERVER_URL.replace('https://vagrantcloud.com')

Vagrant.configure(VAGRANT_API_VERSION) do |config|
  # General Vagrant VM configuration
  config.ssh.insert_key = false
  config.vm.synced_folder ".", "/vagrant", disabled: true
  config.vm.provider :virtualbox do |v|
    # Uncomment this when Vagrant/VirtualBox complains that
    # the hostname is too long
    # See e.g. https://github.com/hashicorp/vagrant/issues/9524
    #v.name = "galaxyvm"
    v.memory = 8192
    v.cpus = 4
    v.linked_clone = true
  end
  # Centaurus production VM
  # Adding swapfile: see https://www.digitalocean.com/community/tutorials/how-to-add-swap-space-on-ubuntu-22-04
  config.vm.define "centaurus" do |centaurus|
    centaurus.vm.box = "ubuntu/focal64"
    centaurus.vm.hostname = "centaurus"
    centaurus.vm.network :private_network, ip: "192.168.60.2"
    centaurus.vm.provision "shell", inline: <<-SHELL
    mkdir -p /mnt/rvmi
    mkdir -p /mnt/bmh01-rvmi/bcf-galaxy
    chmod ugo+rwX /mnt/rvmi/
    chmod ugo+rwX /mnt/bmh01-rvmi/bcf-galaxy/
    fallocate -l 2G /swapfile
    chmod 600 /swapfile
    mkswap /swapfile
    swapon /swapfile
    cp /etc/fstab /etc/fstab.bak
    echo '/swapfile none swap sw 0 0' | tee -a /etc/fstab
  SHELL
  end
  # Centaurus development VM
  config.vm.define "centaurus_dev" do |centaurus_dev|
    centaurus_dev.vm.box = "ubuntu/focal64"
    centaurus_dev.vm.hostname = "centaurus-devel"
    centaurus_dev.vm.network :private_network, ip: "192.168.60.3"
    centaurus_dev.vm.provision "shell", inline: <<-SHELL
    mkdir -p /mnt/rvmi
    mkdir -p /mnt/bmh01-rvmi/bcf-galaxy
    chmod ugo+rwX /mnt/rvmi/
    chmod ugo+rwX /mnt/bmh01-rvmi/bcf-galaxy/
  SHELL
  end
  # Palfinder VM
  config.vm.define "palfinder" do |palfinder|
    palfinder.vm.box = "ubuntu/focal64"
    palfinder.vm.hostname = "palfinder"
    palfinder.vm.network :private_network, ip: "192.168.60.4"
    palfinder.vm.provision "shell", inline: <<-SHELL
    mkdir -p /mnt/rvmi
    chmod ugo+rwX /mnt/rvmi/
  SHELL
  end
  # CSF compute cluster VM
  config.vm.define "csf" do |csf|
    csf.vm.box = "bento/rockylinux-9"
    csf.vm.hostname = "csf"
    csf.vm.network :private_network, ip: "192.168.60.8"
    csf.vm.provision "shell", inline: <<-SHELL
    mkdir -p /mnt/rvmi
    chmod ugo+rwX /mnt/rvmi/
  SHELL
  end
end
