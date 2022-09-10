#!/bin/bash
set -e 
source components/common.sh
# source is a command to import a file and run it locally

COMPONENT=mongodb

echo -n "Configuring the MongoDB Repo:"
curl -s -o /etc/yum.repos.d/${COMPONENT}.repo https://raw.githubusercontent.com/stans-robot-project/${COMPONENT}/main/mongo.repo
stat $?

echo -n "Installing ${COMPONENT}:"
yum install -y mongodb-org >> /tmp/${COMPONENT}.log
stat $? 

# yum install -y mongodb-org
# systemctl enable mongod
# systemctl start mongod
