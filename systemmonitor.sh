#!/bin/bash

TIME_ZONE=$"2"

DATE=$(date +%Y-%m-%d\ %H:%M:%S\ %Z -d "+$TIME_ZONE hour")
CPU=$(top -bn1 | grep load | awk '{printf "%.2f%%\n", $(NF-2)}')
RAM_USED=$(free -m | awk 'NR==2{printf "%.2f%%\n", $3*100/$2}')

echo -e "============ GENERAL STATS ==========="
echo "Current date: $DATE"
echo "CPU load: $CPU"
echo "RAM used: $RAM_USED"
echo -e "======================================\n"

echo -e "============== \033[31mRUST\033[0m APP =============="
TIME_RUST=$(time ./HelloWorld/rust/rusty_app/src/main)
echo "Result: $TIME_RUST"
echo "======================================"

echo -e "============= \033[34mPYTHON\033[0m APP ============="
TIME_PYTHON=$(time python3 ./HelloWorld/python/main.py)
echo "Result: $TIME_PYTHON"
echo "======================================"

echo -e "============== \033[36mLUA\033[0m APP ==============="
TIME_LUA=$(time lua5.3 ./HelloWorld/lua/main.lua)
echo "Result: $TIME_LUA"
echo "======================================"

echo -e "============== \033[35mWEB\033[0m APP ==============="
cd ~/SystemManagement/HelloWorld/js
npx http-server -p 3010 

else 
    echo "Command unknown"
fi

