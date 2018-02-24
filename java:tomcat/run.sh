#!/bin/bash

crond restart

if [ -n "ls /data/config/*.sh" ];
then
   for file in /data/config/*.sh
   do
       chmod +x $file
       sh $file
   done
fi

bin/catalina.sh run >> /data/logs/catalina.out