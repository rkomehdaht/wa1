# LAB: Simple automatic deployment

____

For first config and setup cron job: clone this repo and execute main.sh

Index page before updating

![alt text](https://github.com/rkomehdaht/wa1/blob/main/images/Picture%201.png)

Index page after changing of title (Playtika LAB):
  
![alt text](https://github.com/rkomehdaht/wa1/blob/main/images/Picture%202.png)

Cron log
 
![alt text](https://github.com/rkomehdaht/wa1/blob/main/images/Picture%203.png)

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
 
![alt text](https://github.com/rkomehdaht/wa1/blob/main/images/Picture%204.png)

Don’t forget to open a port:)

![alt text](https://github.com/rkomehdaht/wa1/blob/main/images/Picture%205.png)

Run Webhook:

```
/usr/bin/webhook -hooks webhook.yaml -verbose
```

![alt text](https://github.com/rkomehdaht/wa1/blob/main/images/Picture%206.png)

____

## Websocket

Test WS server on Node

![alt text](https://github.com/rkomehdaht/wa1/blob/main/images/Picture%207.png)

Run with:

```
node server.js
```

____

Nginx config

![alt text](https://github.com/rkomehdaht/wa1/blob/main/images/Picture%208.png)

Checking ws

![alt text](https://github.com/rkomehdaht/wa1/blob/main/images/Picture%209.png)

____

##Git

![alt text](https://github.com/rkomehdaht/wa1/blob/main/images/Picture%2010.png)

![alt text](https://github.com/rkomehdaht/wa1/blob/main/images/Picture%2011.png)

```
git rebase -i --rebase-merge
```

![alt text](https://github.com/rkomehdaht/wa1/blob/main/images/Picture%2012.png)

![alt text](https://github.com/rkomehdaht/wa1/blob/main/images/Picture%2013.png)






