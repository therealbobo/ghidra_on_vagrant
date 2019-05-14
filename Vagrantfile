# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"

  config.vm.box_check_update = true
  config.vm.synced_folder ".", "/ghidra", owner: "vagrant", group: "vagrant"
  config.ssh.forward_agent = true
  config.ssh.forward_x11 = true

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  config.vm.provider "virtualbox" do |vb|
    #vb.gui = true
  
    # Customize the amount of memory on the VM:
    vb.memory = "4096"
  end
  config.vm.provision "shell", inline: <<-SHELL
    apt-get update
    apt-get install -y wget xauth openjdk-11-jdk unzip 
    apt-get upgrade -y
    echo PATH='$PATH':/home/vagrant/.bin >> /home/vagrant/.bashrc
    echo PATH='$PATH':/usr/lib/jvm/java-11-openjdk-amd64 >> /home/vagrant/.bashrc

  SHELL
  config.vm.provision "shell", inline: <<-SHELL, privileged: false
    cd /ghidra
    ./last_ghidra.sh
  SHELL
end
