#!/bin/bash

TIME_ZONE=$"2"

DATE=$(date +%Y-%m-%d\ %H:%M:%S\ %Z -d "+$TIME_ZONE hour")
CPU=$(top -bn1 | grep load | awk '{printf "%.2f%%\n", $(NF-2)}')
RAM_USED=$(free -m | awk 'NR==2{printf "%.2f%%\n", $3*100/$2}')

echo "======================== GENERAL STATS ========================"
echo "Current date: $DATE"
echo "CPU load: $CPU"
echo "RAM used: $RAM_USED"
echo "==============================================================="
echo "========================= NET SCANNING ========================"
nmap 127.0.0.1
echo "==============================================================="




