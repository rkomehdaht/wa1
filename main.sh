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
sudo git config --global user.name "${name}" 
sudo git config --global user.email "${email}"

#Starting web-server
sudo systemctl start nginx

#Cloning forked repository
sudo mkdir /var/www/material-design-template
sudo git clone https://github.com/${nick}/material-design-template /var/www/material-design-template

#Setting up configuration of web-server
sudo rm /etc/nginx/sites-available/default
echo "server {
    listen       80;
    root /var/www/material-design-template/www;
}" | sudo tee /etc/nginx/sites-available/default

#Restarting web-server

sudo systemctl restart nginx 

#Setting up of regular pull from repo
echo -e "Now execute 'crontab -e' and paste this:\n '*/1 * * * * cd /var/www/material-design-template && git pull origin master\nControl+C to exit"
}

    else
    echo "waiting for the keypress"
        fi
done
