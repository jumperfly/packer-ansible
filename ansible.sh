#!/bin/bash

# Install Ansible
yum -y install python3 python-virtualenv
virtualenv -p python3 /opt/ansible
source /opt/ansible/bin/activate
pip install --upgrade pip
pip install ansible==$ANSIBLE_VERSION
ln -s /opt/ansible/bin/ansible* /usr/bin/

# Use vagrant insecure key for vagrant user
curl https://raw.githubusercontent.com/hashicorp/vagrant/v2.2.4/keys/vagrant -o /home/vagrant/.ssh/id_rsa
chown vagrant:vagrant /home/vagrant/.ssh/id_rsa
chmod 600 /home/vagrant/.ssh/id_rsa

# Shrink disk
if [[ -z "$PACKER_SKIP_SHRINK_DISK" ]]; then
  dd if=/dev/zero of=/boot/ZERO bs=1M || echo "ignoring expected dd error"
  rm /boot/ZERO
  dd if=/dev/zero of=/ZERO bs=1M  || echo "ignoring expected dd error"
  rm /ZERO
  sync
fi
