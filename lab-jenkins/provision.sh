#!/bin/bash
sudo yum install -q epel-release java-11-openjdk-devel yum-utils git -y

sudo curl -fsSL https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key

sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

sudo yum install -q docker-ce docker-ce-cli containerd.io jenkins -y

sudo systemctl start docker
sudo systemctl enable docker

sudo curl -fsSL "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/

systemctl daemon-reload
systemctl restart docker

usermod -aG docker jenkins
sudo service start jenkins
