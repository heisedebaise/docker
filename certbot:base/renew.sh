#!/bin/bash

function sync () {
    for file in /etc/letsencrypt/live/*
    do
        if [ -d $file ]; then
            name=${file:22}
            mkdir -p /certbot/cert/$name
            cat $file/fullchain.pem > /certbot/cert/$name/fullchain.pem
            cat $file/privkey.pem > /certbot/cert/$name/privkey.pem
        fi
    done
}

while [ true ]
do
    sleep 1s
    live=`ls /certbot/cert/ | wc -l`
    live=`expr $live + 1`
    if [ `ls /etc/letsencrypt/live/ | wc -l` -gt $live ]; then
        sync
    fi

    if [ `date "+%H:%M:%S"` = 00:00:00 ]; then
        find /certbot/ -maxdepth 1 -type f ! -name "*.sh" -mtime +30 | xargs rm -rf
        today=`date "+%Y-%m-%d"`
        certbot-2 renew >> /certbot/$today
        sync
    fi
done