#!/bin/bash
set -e 

source components/common.sh
# source is a command to import a file and run it locally

COMPONENT=mongodb

echo -n "Configuring the MongoDB Repo:"
curl -s -o /etc/yum.repos.d/{COMPONENT}.repo https://raw.githubusercontent.com/stans-robot-project/${COMPONENT}/main/mongo.repo
stat $?

echo -n "Installing ${COMPONENT}:"
yum install -y mongodb-org >> /tmp/${COMPONENT}.log
stat $? 

echo -n "Updating the ${COMPONENT} config:"
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf 
stat $? 

echo -n "Start the ${COMPONENT} service"
systemctl enable mongod >> /tmp/${COMPONENT}.log
systemctl start mongod  
stat $? 

echo -n "Downloading the schema:"
curl -s -L -o /tmp/mongodb.zip "https://github.com/stans-robot-project/${COMPONENT}/archive/main.zip"
stat $?

echo -n "Extracting the ${COMPONENT} Schema:"
cd /tmp && unzip -o ${COMPONENT}.zip >> /tmp/${COMPONENT}.log
stat $?

echo -n "Injecting the ${COMPONENT} schema: "
cd mongodb-main
mongo < catalogue.js >> /tmp/${COMPONENT}.log
mongo < users.js  >> /tmp/${COMPONENT}.log
stat $? 
echo -n -e "\e[32m \n ****** ${COMPONENT} Cofiguration Completed ********* \n \e[0m"

#echo -n -e "\e[31m"\n ****** $COMPONENT Cofiguration Completed ********* \n"\e[0m"
# curl -s -L -o /tmp/mongodb.zip "https://github.com/stans-robot-project/mongodb/archive/main.zip"
# cd /tmp
# unzip mongodb.zip
# cd mongodb-main
# mongo < catalogue.js
# mongo < users.js