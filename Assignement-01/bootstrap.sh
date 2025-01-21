#!/bin/bash
sudo apt-get update
sudo apt-get install -y nginx
sudo echo "Deployed via Terraform" >  /var/www/html/index.html
sudo systemctl restart nginx
