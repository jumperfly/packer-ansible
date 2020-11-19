#!/bin/bash
vagrant destroy
if [[ -d "$HOME/.vagrant.d/boxes/file:-VAGRANTSLASH--VAGRANTSLASH-output-vagrant-VAGRANTSLASH-package.box" ]]; then
  vagrant box remove file://output-vagrant/package.box
fi
vagrant up
