#!/bin/bash
# LogTop
# This will take screanshot of top and also get ps aux info

load=5
mem=6091456
actual=$(uptime |awk {'print $10'} |cut -d "." -f 1)
if [ ! -d /root/infoload ];then
mkdir /root/infoload
fi
MEM=$(free -m  | grep Mem | awk '{print $3}')
if [ "$actual" -gt "$load" ]; then
TOP=$(top -b -n1 | head -n 40)
echo "$TOP" > /root/infoload/Informe-Load-${actual}.`date +%Y-%m-%d-h%H%M`
ps auxw > /root/infoload/Informe-PSAUX-LOAD-${actual}.`date +%Y-%m-%d-h%H%M`
fi

if [ "$MEM" -gt "$mem" ]; then
TOP=$(top -b -n1 | head -n 100)
echo "$TOP" > /root/infoload/Informe-MEMORY-${actual}.`date +%Y-%m-%d-h%H%M`
ps auxw > /root/infoload/Informe-PSAUX-LOAD-${actual}.`date +%Y-%m-%d-h%H%M`
fi
