#!/bin/bash

# adding repository and installing nginx		
sudo apt update -y
sudo apt install nginx -y
#starting nginx service and firewall
sudo systemctl enable nginx
sudo systemctl start nginx

cat <<EOT > vproapp
upstream vproapp {

 server app01:8080;

}

server {

  listen 80;

location / {

  proxy_pass http://vproapp;

}

}

EOT

sudo mv vproapp /etc/nginx/sites-available/vproapp
sudo rm -rf /etc/nginx/sites-enabled/default
sudo ln -s /etc/nginx/sites-available/vproapp /etc/nginx/sites-enabled/vproapp


sudo systemctl restart nginx
