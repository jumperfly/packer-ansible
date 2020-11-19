#!/bin/bash
packer build -except vagrant-cloud -var skip_shrink=1 packer.json
