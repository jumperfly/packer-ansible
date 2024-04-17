# Ansible Packer

Builds an Ansible image on top of Arch Linux

Supported providers:
  - libvirt

## Building Locally

Requires
  - packer 1.10.2+
  - vagrant 2.4.1+
  - libvirt

Run `packer init .` before the first build.

Run `packer build -except vagrant-cloud .`

The resulting vagrant box is saved to `output-ansible`

## Running Locally

Run the supplied script: `./local-run.sh`.

This essentially wraps `vagrant up` while ensuring the latest built box is imported.

It will attempt to cleanup previously imported libvirt arch images provided they are stored in the default /var/lib/libvirt/images
