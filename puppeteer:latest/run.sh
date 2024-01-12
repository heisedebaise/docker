#!/bin/sh

logs=/puppeteer/logs
cd /puppeteer/service
nohup yarn dev > $logs/out 2>&1 &

today=`date +%Y%m%d`
while [[ true ]]
do
    if [ $today != `date +%Y%m%d` ];then
        cp $logs/out $logs/out-$today
        today=`date +%Y%m%d`
        echo > $logs/out
        find $logs/ -mtime +7 -exec rm -rf {} \;
    fi
    sleep 1s
done