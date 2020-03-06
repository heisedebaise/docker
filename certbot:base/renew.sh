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
    if [ `ls /etc/letsencrypt/live/ | wc -l` != `ls /certbot/cert/ | wc -l` ]; then
        sync
    fi
done