#!/bin/bash
a=22
b=cherry
echo value of a is : $a
echo value of b is : $b

DATE_COMMAND=$(date +%F)
LOGGEDIN_USERS=$(who | wc -l)

#### No Datatypes in bash scriptng. Everything is a string by default.

# rm -rf  /data/${DIR}  
# rm -rf /data/

DATE=2022-09-05

echo "Good Morning, Today's date is $DATE_COMMAND"
# This is how we can fetch the system data
echo "Number of logged in users are: $LOGGEDIN_USERS"

echo "Number of logged in users are: LOGGEDIN_USERS=$(who | wc -l)

