#!/bin/bash

cp /data/logs/catalina.out /data/logs/catalina-`date +%Y%m%d`.out
echo > /data/logs/catalina.out

find /data/logs/ -mtime +7 -exec rm  {} \;
