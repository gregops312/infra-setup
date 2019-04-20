  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.

Vagrant.configure("2") do |config|
  config.vm.box_check_update = true
  config.vm.box = "ubuntu/bionic64"

  config.vm.provider "virtualbox" do |v|
    v.name = "ubuntu"
    v.gui = true
    v.cpus = 2
    v.memory = "4096"
    v.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
  end

  config.vm.provision "shell", inline: "sudo apt-get update -y"
  config.vm.provision "shell", inline: "sudo apt-get install -y net-tools openssh-server python"
  config.vm.provision "shell", inline: "sudo apt-get install -y gnome-session gdm3"

  config.vm.provision "ansible" do |ansible|
    ansible.inventory_path = "machines"
    ansible.limit = "virtualbox"
    ansible.playbook = "systems.yaml"
  end

  config.vm.provision "shell", inline: "sudo reboot"
end
