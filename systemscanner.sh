#!/bin/bash

echo -e "Actions to perform:\n1) Inspect logs\n2) BATS tests"
read -p "Enter number: " CHOICE_1

if [ "$CHOICE_1" -eq 1 ]; then
    echo -e "Actions to perform:\n1) Nginx error logs inspection\n2) ?"
    read -p "Enter number: " CHOICE_2
    if [ "$CHOICE_2" -eq 1 ]; then 
        echo "=================== NGINX ERROR INSPECTOR ====================="
        sudo tail -n 5 /var/log/nginx/error.log.1
        sudo tail -n 5 /var/log/nginx/error.log
        echo "==============================================================="
    else 
        echo "Command unknown"
    fi
elif [ "$CHOICE_1" -eq 2 ]; then
    bats -t containertests.bats  
else 
    echo "Command unknown"
fi