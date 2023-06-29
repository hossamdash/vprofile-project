#!/bin/bash
sudo apt update
sudo apt upgrade -y
sudo apt install openjdk-8-jdk maven -y
sudo apt install tomcat8 git -y

sudo systemctl enable tomcat8
sudo systemctl start tomcat8

git clone -b local-setup https://github.com/devopshydclub/vprofile-project.git
cd vprofile-project || exit
mvn install
sudo rm -rf /var/lib/tomcat8/webapps/ROOT*
sudo cp target/vprofile-v2.war /var/lib/tomcat8/webapps/ROOT.war
sudo systemctl restart tomcat8