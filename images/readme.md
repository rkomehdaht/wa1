# LAB: Simple automatic deployment

____

For first config and setup cron job: clone this repo and execute main.sh

Index page before updating

![alt text](https://github.com/rkomehdaht/wa1/blob/main/images/Picture%201.png?raw=true)

Index page after changing of title (Playtika LAB):
  
![alt text](https://github.com/rkomehdaht/wa1/blob/main/images/Picture%202.png?raw=true)

Cron log
 
![alt text](https://github.com/rkomehdaht/wa1/blob/main/images/Picture%203.png?raw=true)

____

## WEBHOOKS

First, install Webhooks

```
sudo apt-get install webhook
```

Creating webhook.yaml with these content:

```
- id: redeploy-webhook
  execute-command: "/usr/bin/bash /home/komehdaht/wa1/webhook.sh"
  command-working-directory: "/home/komehdaht/wa1"
```

Redeploy script:

```
#! /usr/bin/env bash

cd /var/www/material-design-template

echo "Pulling from Master" 

git pull origin master && echo "Pulled successfully from master"

echo "Restarting server..."

sudo systemctl restart nginx && echo "Server restarted Successfully"
```
____
Make script executable:

```
chmod u+x webhook.sh
```
____
Setting Github Webhooks:
 
![alt text](https://github.com/rkomehdaht/wa1/blob/main/images/Picture%204.png?raw=true)

Don’t forget to open a port:)

![alt text](https://github.com/rkomehdaht/wa1/blob/main/images/Picture%205.png?raw=true)

Run Webhook:

```
/usr/bin/webhook -hooks webhook.yaml -verbose
```

![alt text](https://github.com/rkomehdaht/wa1/blob/main/images/Picture%206.png?raw=true)

____

## Websocket

Test WS server on Node

![alt text](https://github.com/rkomehdaht/wa1/blob/main/images/Picture%207.png?raw=true)

Run with:

```
node server.js
```

____

Nginx config

![alt text](https://github.com/rkomehdaht/wa1/blob/main/images/Picture%208.png?raw=true)

Checking ws

![alt text](https://github.com/rkomehdaht/wa1/blob/main/images/Picture%209.png?raw=true)

____

##Git

![alt text](https://github.com/rkomehdaht/wa1/blob/main/images/Picture%2010.png?raw=true)

![alt text]https://github.com/rkomehdaht/wa1/blob/main/images/Picture%2011.png?raw=true)

```
git rebase -i --rebase-merge
```

![alt text](https://github.com/rkomehdaht/wa1/blob/main/images/Picture%2012.png?raw=true)

![alt text](https://github.com/rkomehdaht/wa1/blob/main/images/Picture%2013.png?raw=true)






