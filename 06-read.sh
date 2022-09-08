#!/bin/bash
read -p "Enter your name:"  name 
read -p "Today's date is:"  date
echo "Entered name is $name"
echo "Entered date is $(date +%F)"