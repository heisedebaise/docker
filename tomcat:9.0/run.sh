#!/bin/bash

for file in `find /data/config -name '*.sh'`
do
    chmod +x $file
    sh $file
done

cd CATALINA_HOME
bin/startup.sh &

today=`date +%Y%m%d`
while [[ true ]]
do
    if [ today != `date +%Y%m%d` ];then
        cp /data/logs/catalina.out /data/logs/catalina-$today.out
        today=`date +%Y%m%d`
        echo > /data/logs/catalina.out
        find /data/logs/ -mtime +7 -exec rm -rf {} \;
    fi
    sleep 1s
done