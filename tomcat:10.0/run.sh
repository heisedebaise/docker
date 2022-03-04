#!/bin/sh

cd /tomcat
sh bin/startup.sh &

today=`date +%Y%m%d`
while [[ true ]]
do
    if [ $today != `date +%Y%m%d` ];then
        cp /tomcat/logs/catalina.out /tomcat/logs/catalina-$today.out
        today=`date +%Y%m%d`
        echo > /tomcat/logs/catalina.out
        find /tomcat/logs/ -mtime +7 -exec rm -rf {} \;
    fi
    sleep 1s
done