pipeline {
    agent { label 'vbox' }

    options {
        ansiColor('xterm')
    }

    environment {
        VAGRANT_CLOUD_TOKEN = credentials('vagrant-cloud')
        ANSIBLE_MAJOR_MINOR = "2.9"
        ANSIBLE_PATCH = "2"
    }

    stages {
        stage('Clean') {
            steps {
                sh 'rm -rf output-*'
            }
        }
        stage('Build') {
            steps {
                sh 'packer build centos-7.json'
            }
        }
    }
}
