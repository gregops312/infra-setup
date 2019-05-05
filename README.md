# Ansible System Setup

[![pipeline status](https://gitlab.com/gkman/infrastructure-configuration/badges/master/pipeline.svg)](https://gitlab.com/gkman/infrastructure-configuration/commits/master)

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
./docker.sh
# Select 1
```

```bash
ansible-playbook -i machines systems.yaml --limit docker
```

### Vagrant

```bash
# Create
vagrant up

# Destroy
vagrant destroy -f
```
