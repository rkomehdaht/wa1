#! /usr/bin/env bash

#Gathering needed informstion
echo "Enter your name"
read name
echo "Enter your email"
read email
echo "Enter your github nickname"
read nick

#Interactive fork of repository
echo -e "Fork this repo and press any key:\nhttps://github.com/joashp/material-design-template"
while [ true ] ; do
    read -t 3 -n 1
        if [ $? = 0 ] ; then
        {

# Installing Git and nginx
echo "Installing Git and nginx"
sudo apt-get update
sudo apt-get install -y git nginx

#First setting up of Git
git config --global user.name "${name}" 
git config --global user.email "${email}"

#Starting web-server
sudo systemctl start nginx

#Cloning forked repository
mkdir /var/www/material-design-template
git clone https://github.com/${nick}/material-design-template /var/www/material-design-template

#Setting up configuration of web-server
sudo rm /etc/nginx/sites-available/default
echo "server {
    listen       80;
    root /var/www/material-design-template/www;
    server_name  _;

    location /  {
     try_files $uri $uri/ =404;
    }
}" | sudo tee /etc/nginx/sites-available/default

#Setting up of regular pull from repo
echo -e "Now execute 'crontab -e' and paste this:\n '*/1 * * * * su -s /bin/sh www-data -c 'cd /var/www/material-design-template && git pull'\nControl+C to exit"
}

    else
    echo "waiting for the keypress"
        fi
done
