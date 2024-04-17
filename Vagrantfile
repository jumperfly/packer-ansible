# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.ssh.insert_key = false
  config.vm.box = "jumperfly-local/ansible"
  config.vm.box_url = "file://output-ansible/package.box"
  config.vm.synced_folder '.', '/vagrant', disabled: true
  config.vm.provision "shell", inline: "ansible --version"
end
