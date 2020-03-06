#!/bin/bash

while [ true ]
do
    sleep 1s
    if [ `ls /etc/letsencrypt/live/ | wc -l` != `ls /certbot/certs/ | wc -l` ] then;
        cp -rf /etc/letsencrypt/live/* /certbot/certs/
    fi
done