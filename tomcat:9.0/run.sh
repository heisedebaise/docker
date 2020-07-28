#!/bin/bash

for file in `find /data/config -name '*.sh'`
do
    chmod +x $file
    sh $file
done

cd CATALINA_HOME
bin/startup.sh &

while [[ true ]]
do
    if [ `date +%H%M%S` eq '000000' ];then
        cp /data/logs/catalina.out /data/logs/catalina-`date +%Y%m%d`.out
        echo > /data/logs/catalina.out

        find /data/logs/ -mtime +7 -exec rm  {} \;
    fi
    sleep 1s
done