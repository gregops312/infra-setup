sudo apt-get install -y xclip

echo -n '%sudo  ALL=(ALL:ALL) NOPASSWD:ALL' >> nopass
sudo mv nopass /etc/sudoers.d
sudo chown root:root /etx/sudoers.d/nopass


sudo apt-get install -y \
    net-tools \
    openssh-server \
    python

ifconfig
