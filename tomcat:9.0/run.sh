#!/bin/bash

for file in `find /data/config -name '*.sh'`
do
    chmod +x $file
    sh $file
done

CATALINA_HOME/bin/startup.sh &

while [[ true ]]
do
    if [ `date +%H%M%S` eq '000000' ];then
        sh /data/bin/timer.sh
    fi
    sleep 1s
done