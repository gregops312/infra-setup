# Ansible System Setup

[![pipeline status](https://github.com/gkman/infra-setup/workflows/.github/workflows/workflow.yml/badge.svg)](https://github.com/gkman/infra-setup/workflows/.github/workflows/workflow.yml/badge.svg)

## Prerequesties

```bash
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt

# Target
sudo apt-get install -y openssh-server

# Host
scp ./bin/prepare-ansible.sh gkman@127.0.1.1:~/prepare-ansible.sh

# Target
./prepare-ansible.sh
```

## Running

```bash
# desktop
ansible-playbook -i machines systems.yaml -k --limit desktop
# localhost
ansible-playbook -i machines -c local  systems.yaml --limit localhost
# server
ansible-playbook -i machines systems.yaml -k --limit server
```

## Dev

### Docker

```bash
# Runs setup, test, clean
make docker type=server
# Setup docker container
make docker-setup
# Runs Ansible against Docker container
make docker-test type=server
# Clean
make docker-clean

ansible-playbook -i machines systems.yaml --limit docker --extra-vars "type=server laptop=true"
```

### Vagrant

```bash
# Create VM and run Ansible
make vagrant-up type=server
# Just run Ansible on previously built VM
make vagrant-provision type=server
# Clean
vagrant-clean

ansible-playbook -i machines systems.yaml --limit virtualbox --extra-vars "type=pc"
```
