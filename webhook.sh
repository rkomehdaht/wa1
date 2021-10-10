#! /usr/bin/env bash

cd /var/www/material-design-template

echo "Pulling from Master" 

sudo git pull origin master && echo "Pulled successfully from master"

echo "Restarting server..."

sudo systemctl restart nginx && echo "Server restarted Successfully"
