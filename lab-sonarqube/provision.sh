#!/bin/bash
SONAR_VERSION="9.7.1.62043"
SONAR_SCANNER_VERSION="4.8.0.2856"

groupadd sonar
useradd sonar -g sonar
yum install java-11-openjdk-devel unzip -y
curl -fsSL "https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-$SONAR_VERSION.zip" --output /opt/sonarqube.zip && unzip /opt/sonarqube.zip -d /opt

mv "/opt/sonarqube-$SONAR_VERSION" /opt/sonarqube
chown -R sonar:sonar /opt/sonarqube
touch /etc/systemd/system/sonar.service
echo > /etc/systemd/system/sonar.service
cat << EOM >> /etc/systemd/system/sonar.service
[Unit]
Description=Sonar service
After=syslog.target network.target

[Service]
Type=forking
ExecStart=/opt/sonarqube/bin/linux-x86-64/sonar.sh start
ExecStop=/opt/sonarqube/bin/linux-x86-64/sonar.sh stop
User=sonar
Group=sonar
Restart=always

[Install]
WantedBy=multi-user.target
EOM

service sonar start

# Install Solar Scanner

curl -fsSL "https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-$SONAR_SCANNER_VERSION-linux.zip" -o scanner.zip && unzip scanner.zip -d /opt/
mv "/opt/sonar-scanner-$SONAR_SCANNER_VERSION-linux" /opt/sonar-scanner
chown -R sonar:sonar /opt/sonar-scanner
echo 'export PATH=$PATH:/opt/sonar-scanner/bin' | sudo tee -a /etc/profile
curl -sL https://rpm.nodesource.com/setup_10.x | sudo bash -
sudo yum install nodejs -y
