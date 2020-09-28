#!/bin/bash

create() {
  cd ./bin && docker build . -t my-ubuntu:latest
  docker run --rm -it --name ubuntu -d my-ubuntu:latest
}

destroy() {
  docker kill ubuntu
}

echo "1) Create and Run"
echo "2) Stop and Destroy"
echo "Please enter selection: "

read choice

case $choice in
1)
  create
  ;;
2)
  destroy
  ;;
*)
  echo "Your choice could not be parsed!"
  ;;
esac
