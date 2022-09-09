#!/bin/bash

set -e   # ensure your script will stop if any of the instruction fails

source components/common.sh
# source is a command to import a file and run it locally

echo -n " installing nginx: "
yum install nginx -y

systemctl enable nginx

echo -n "Starting nginx: "
systemctl start nginx

echo -n "Downloading the Code"
curl -s -L -o /tmp/frontend.zip "https://github.com/stans-robot-project/frontend/archive/main.zip"

cd /usr/share/nginx/html
rm -rf *
unzip /tmp/frontend.zip
mv frontend-main/* .
mv static/* .
rm -rf frontend-main README.md
mv localhost.conf /etc/nginx/default.d/roboshop.conf

echo -n "Starting ngnix: "
systemctl restart nginx
stat $?

