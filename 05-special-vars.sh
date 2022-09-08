#!/bin/bash

#  Here are the special variables 

#  $0          : This will gives the name of the script you're running 
#  $1 to $9    :You can pass a maximum of 9 variables from the command line when you're running the script 
#  $*          : Prints you all the supplied variables in the script 
#  $@          : Prints you all the supplied variables in the script 
#  $#          : Prints you the number of variables
#  $$          : Process ID of the script that you're running 
#  $?          : Gives you the exit code of the previous command  

echo -e "script name that you're running is : \e[31m $0 \e[0m"

a=5
b=$1
c=$2
d=$3
echo value of a is :$a
echo value of b is :$b
echo value of c is :$c
echo value of d is :$d

# sh scriptname.sh 10 20 300
# sh scriptname.sh  $1  $2  $3