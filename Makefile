TYPE=$(type)

default: lint

##
## Docker lifecycle
##
PHONY: docker
docker: docker-setup docker-test docker-clean

PHONY: docker-clean
docker-clean:
	docker kill infra-test

PHONY: docker-setup
docker-setup:
	docker build . -t infra-test:latest && \
	docker run --rm -it --name infra-test -d infra-test:latest

PHONY: docker-test
docker-test:
	ansible-playbook -i machines systems.yaml --limit docker --extra-vars "type=$(TYPE)"

##
## Lint
##
PHONY: lint
lint:
	ansible-lint --force-color

##
## Vagrant
##
PHONY: vagrant
vagrant: vagrant-up vagrant-clean

PHONY: vagrant-clean
vagrant-clean:
	vagrant destroy -f

PHONY: vagrant-provision
vagrant-provision:
	export TYPE='$(TYPE)'; vagrant provision

PHONY: vagrant-up
vagrant-up:
	TYPE='$(TYPE)'; vagrant up
