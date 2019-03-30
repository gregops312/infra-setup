# Ansible System Setup

## Additional stuff

* Install `go` lang

## Prerequesties

```bash
# Target
sudo apt-get install -y openssh-server

# Host
scp ./bin/prepare-ansible.sh gkman@127.0.1.1:~/prepare-ansible.sh

# Target
./prepare-ansible.sh
```

## Desktop/Server

```bash
ansible-playbook -i machines systems.yml -k --limit desktop

ansible-playbook -i machines systems.yml -k --limit laptop
```

## localhost

```bash
ansible-playbook -i machines -c local  systems.yml --limit localhost
```

## Dev

### Docker

#### Setup

```bash
cd bin
./docker.sh
# Select 1
cd ../
```

```bash
ansible-playbook -i machines systems.yml --limit docker_desktop
ansible-playbook -i machines systems.yml --limit docker_server
```

### Virtualbox

```bash
scp -P 2222 ./bin/prepare-ansible.sh vmtest@127.0.1.1:~/prepare-ansible.sh

export ANSIBLE_HOST_KEY_CHECKING=False
ansible-playbook -i machines systems.yml -k --limit virtualbox
unset ANSIBLE_HOST_KEY_CHECKING
```
