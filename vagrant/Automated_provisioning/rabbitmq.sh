#!/bin/bash
sudo yum update -y
sudo yum -y install epel-release
sudo yum install rabbitmq-server -y

sudo systemctl start rabbitmq-server
sudo systemctl enable rabbitmq-server

sudo sh -c 'echo "[{rabbit, [{loopback_users, []}]}]." > /etc/rabbitmq/rabbitmq.config'
sudo rabbitmqctl add_user test test
sudo rabbitmqctl set_user_tags test administrator
sudo systemctl restart rabbitmq-server

sudo firewall-cmd --zone=public --add-port=5672/tcp --permanent
sudo firewall-cmd --reload
