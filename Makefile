default: lint

PHONY: docker
docker: docker-setup docker-test docker-clean

##
## Docker lifecycle
##
PHONY: docker-clean
docker-clean:
	docker kill infra-test

PHONY: docker-setup
docker-setup:
	docker build . -t infra-test:latest && \
	docker run --rm -it --name infra-test -d infra-test:latest

PHONY: docker-test
docker-test:
	ansible-playbook -i machines systems.yaml --limit docker --extra-vars "type=server"

##
## Lint
##
PHONY: lint
lint:
	ansible-lint --force-color
