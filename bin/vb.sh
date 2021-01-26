#!/bin/bash

VM='Ubuntu'

create() {
  echo 'Create VM'
  VBoxManage createvm --name $VM --ostype "Ubuntu_64" --register
  echo

  echo 'Configure Ram'
  VBoxManage modifyvm $VM --memory 4096
  echo

  echo 'Configure Vram'
  VBoxManage modifyvm $VM --vram 16
  echo

  echo 'Create IDE'
  VBoxManage storagectl $VM \
    --name "IDE" \
    --add ide \
    --controller PIIX4
  echo

  echo 'Attach DVD to IDE'
  VBoxManage storageattach $VM \
    --storagectl "IDE" \
    --port 0 \
    --device 0 \
    --type dvddrive \
    --medium "/home/gkman/os-images/ubuntu.iso"
  echo

  echo 'Create HDD'
  VBoxManage createmedium \
    --filename $VM.vdi \
    --size 40000 \
    --format VDI
  echo

  echo 'Create Sata drive'
  VBoxManage storagectl $VM \
    --name "SATA" \
    --add sata \
    --controller IntelAHCI \
    --portcount 1
  echo

  echo 'Attach HDD to Sata drive'
  VBoxManage storageattach $VM \
    --storagectl "SATA" \
    --port 0 \
    --device 0 \
    --type hdd \
    --medium $VM.vdi
  echo

  echo 'Network setup'
  VBoxManage modifyvm $VM \
    --natpf1 "SSH,tcp,127.0.1.1,2222,10.0.2.15,22"
  echo

  echo 'Bidirectional clipboard'
  VBoxManage modifyvm $VM --clipboard bidirectional
  echo
}

destroy() {
  vboxmanage unregistervm $VM --delete
}

run() {
  VBoxManage startvm $VM --type gui
}

stop() {
  VBoxManage controlvm $VM poweroff
}

echo "1) Create VM"
echo "2) Destroy VM"
echo "3) Run VM"
echo "4) Stop VM"
echo "Please enter selection: "

read choice

case $choice in
1)
  create
  ;;
2)
  destroy
  ;;
3)
  run
  ;;
4)
  stop
  ;;
*)
  echo "Your choice could not be parsed!"
  ;;
esac
