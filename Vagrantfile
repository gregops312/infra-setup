  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.

Vagrant.configure("2") do |config|
  config.vm.box_check_update = true
  config.vm.box = "ubuntu/bionic64"

  config.vm.provision "ansible" do |ansible|
    ansible.inventory_path = "machines"
    ansible.limit = "virtualbox"
    ansible.playbook = "systems.yml"
  end

  config.vm.provider "virtualbox" do |v|
    v.name = "ubuntu"
    v.gui = true
    v.cpus = 2
    v.memory = "4096"
    # v.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
  end


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


  config.vm.provision "shell", inline: "sudo apt-get update -y"
  config.vm.provision "shell", inline: "sudo apt-get update -y && sudo apt-get install -y net-tools openssh-server python"
  config.vm.provision "shell", inline: "sudo apt-get install -y net-tools openssh-server python" # xfce4

  # config.vm.provision "shell", inline: "sudo startxfce4&"

  # config.vm.provision "shell", inline: "sudo add-apt-repository ppa:gnome3-team/gnome3"
  # config.vm.provision "shell", inline: "sudo apt-get update -y && sudo apt-get install -y gnome-shell ubuntu-gnome-desktop"

  config.vm.provision "shell", inline: "sudo apt-get install -y gnome-session gdm3"
end
