pipeline {
    agent any

    options {
        ansiColor('xterm')
    }

    environment {
        VAGRANT_CLOUD_TOKEN = credentials('vagrant-cloud')
        BASE_BOX_VERSION = "7.6.1"
        ANSIBLE_MAJOR_MINOR = "2.8"
        ANSIBLE_PATCH = "0"
    }

    stages {
        stage('Clean') {
            when { 
                expression { return fileExists("output-virtualbox-ovf") }
            }
            steps {
                sh 'rm -rf output-virtualbox-ovf'
            }
        }
        stage ('Download Base Box') {
            when { 
                expression { return !fileExists("$HOME/.vagrant.d/boxes/jumperfly-VAGRANTSLASH-centos-7/$BASE_BOX_VERSION/virtualbox/box.ovf") }
            }
            steps {
                sh "vagrant box add jumperfly/centos-7 --box-version $BASE_BOX_VERSION"
            }
        }
        stage('Build') {
            steps {
                sh 'packer build centos-7.json'
            }
        }
    }
}
