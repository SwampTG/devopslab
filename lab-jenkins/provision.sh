#!/bin/bash
sudo yum install -q epel-release -y
sudo yum install -q java-11-openjdk -y

sudo yum install -q  jenkins -y
sudo yum install -q -y yum-utils

sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -q docker-ce docker-ce-cli containerd.io -y

sudo systemctl start docker
sudo systemctl enable docker

sudo curl -fsSL "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/

sudo service start jenkins
