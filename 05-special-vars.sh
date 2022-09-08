#!/bin/bash

#  Here are the special variables 

#  $0          : This will gives the name of the script you're running 
#  $1 to $9    :You can pass a maximum of 9 variables from the command line when you're running the script 
#  $*          : Prints you all the supplied variables in the script 
#  $@          : Prints you all the supplied variables in the script 
#  $#          : Prints you the number of variables
#  $$          : Process ID of the script that you're running 
#  $?          : Gives you the exit code of the previous command  

echo -e "script name that you're running is : \e[32m $0 \e[0m"
