#!/usr/bin/env bash

vagrant destroy
if [[ -d "$HOME/.vagrant.d/boxes/jumperfly-local-VAGRANTSLASH-ansible/0" ]]; then
  vagrant box remove jumperfly-local/ansible
  for img in /var/lib/libvirt/images/jumperfly-local-VAGRANTSLASH-ansible_*.img; do
    virsh vol-delete $img
  done
fi
vagrant up
