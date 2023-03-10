#!/bin/bash
SONAR_SCANNER_VERSION="4.8.0.2856"

sudo yum install -q epel-release java-11-openjdk-devel yum-utils git unzip -y

sudo curl -fsSL https://pkg.jenkins.io/redhat-stable/jenkins.repo -o /etc/yum.repos.d/jenkins.repo
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
sudo service jenkins start
sudo systemctl enable jenkins

curl -fsSL "https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-$SONAR_SCANNER_VERSION-linux.zip" -o scanner.zip && sudo unzip scanner.zip -d /opt/
sudo mv "/opt/sonar-scanner-$SONAR_SCANNER_VERSION-linux" /opt/sonar-scanner
echo 'export PATH=$PATH:/opt/sonar-scanner/bin' | sudo tee -a /etc/profile
curl -sL https://rpm.nodesource.com/setup_10.x | sudo bash -
sudo yum install -q nodejs -y
