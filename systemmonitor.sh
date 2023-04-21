#!/bin/bash

echo "Enter value of yout timezone (UTC + ?h, just number of an hour)":
read input

DATE=$(date +%Y-%m-%d\ %H:%M:%S\ %Z -d "+$input hour")
CPU=$(top -bn1 | grep load | awk '{printf "%.2f%%\n", $(NF-2)}')
RAM_USED=$(free -m | awk 'NR==2{printf "%.2f%%\n", $3*100/$2}')

echo "Current date: $DATE"
echo "CPU load: $CPU"
echo "RAM used: $RAM_USED"

echo "============== RUST APP =============="
TIME_RUST=$(time ./HelloWorld/rust/rusty_app/src/main)
echo "Result: $TIME_RUST"
echo -e "======================================\n"

echo "============= PYTHON APP ============="
TIME_PYTHON=$(time python ./HelloWorld/python/main.py)
echo "Result: $TIME_PYTHON"
echo -e "======================================\n"

echo "============== LUA APP ==============="
TIME_LUA=$(time lua5.3 ./HelloWorld/lua/main.lua)
echo "Result: $TIME_LUA"
echo -e "======================================\n"
