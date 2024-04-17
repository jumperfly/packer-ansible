packer {
  required_plugins {
    vagrant = {
      version = "1.1.2"
      source  = "github.com/hashicorp/vagrant"
    }
  }
}

variables {
  box_version             = ""
  box_version_description = ""
}

locals {
  box_tag            = "jumperfly/ansible"
  base_image_version = "20240417.160750"

  now = timestamp()
  box_version = coalesce(
    # Use box_version from variable if set
    var.box_version,
    # Otherwise default to 0.<date>.<time>
    formatdate("0.YYYYMMDD.hhmmss", local.now)
  )
}

source "vagrant" "ansible" {
  source_path  = "jumperfly/archlinux"
  box_version  = local.base_image_version
  provider     = "libvirt"
  communicator = "ssh"
}

build {
  sources = ["sources.vagrant.ansible"]

  provisioner "shell" {
    script          = "provision.sh"
    execute_command = "sudo sh -c '{{ .Vars }} {{ .Path }}'"
  }

  #post-processors {
  #  post-processor "vagrant-cloud" {
  #    box_tag             = local.box_tag
  #    version             = local.box_version
  #    version_description = var.box_version_description
  #  }
  #}
}
