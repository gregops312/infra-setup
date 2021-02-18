# Ansible System Setup

[![pipeline status](https://github.com/gkman/infra-setup/workflows/.github/workflows/workflow.yml/badge.svg)](https://github.com/gkman/infra-setup/workflows/.github/workflows/workflow.yml/badge.svg)

## Prerequesties

```bash
# Target
sudo apt-get install -y openssh-server

# Host
scp ./bin/prepare-ansible.sh gkman@127.0.1.1:~/prepare-ansible.sh

# Target
./prepare-ansible.sh
```

## Running

* desktop

    ```bash
    ansible-playbook -i machines systems.yaml -k --limit desktop
    ```

* localhost

    ```bash
    ansible-playbook -i machines -c local  systems.yaml --limit localhost
    ```

* server

    ```bash
    ansible-playbook -i machines systems.yaml -k --limit server
    ```

## Dev

### Docker

```bash
# Runs setup, test, clean
make docker

# Setup docker container
make docker-setup

# Runs Ansible against Docker container
make docker-test

# Cleans up Docker container
make docker-cleam
```

```bash
ansible-playbook -i machines systems.yaml --limit docker --extra-vars "type=server"
ansible-playbook -i machines systems.yaml --limit docker --extra-vars "type=server laptop=true"
```

### Vagrant

```bash
# Create VM and run Ansible
export TYPE='server'; vagrant up

# Just run Ansible on previously built VM
export TYPE='server'; vagrant provision

ansible-playbook -i machines systems.yaml --limit virtualbox --extra-vars "type=pc"

# Destroy
vagrant destroy -f
```
