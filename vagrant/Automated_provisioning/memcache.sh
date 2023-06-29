#!/bin/bash
sudo yum update -y
sudo yum -y install epel-release
sudo yum install memcached -y
sudo memcached -p 11211 -U 11111 -u memcached -d

sudo firewall-cmd --zone=public --add-port=11211/tcp --permanent
sudo firewall-cmd --zone=public --add-port=11111/udp --permanent
sudo firewall-cmd --reload
