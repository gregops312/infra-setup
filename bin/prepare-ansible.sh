sudo apt-get install -y xclip

echo -n '%sudo  ALL=(ALL:ALL) NOPASSWD:ALL' | xclip -sel clip

sudo visudo

# sudo mv nopass /etc/sudoers.d/

sudo apt-get install -y \
    net-tools \
    openssh-server \
    python

ifconfig
