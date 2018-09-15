#!/bin/bash
#Just that, try fix something, sometimes work, sometimes not..
# Run at your own risk

find . -type f -exec grep -qi "charset=windows-1252" {} \; -print |while read line
do
vim -c ":write ++enc=iso-8859-1" $line -c q
echo "$line" >> /root/fixed.log
done
