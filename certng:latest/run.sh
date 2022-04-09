#!/bin/sh

nginx -g 'daemon off;' &

if [ `grep '8.8.8.8' /etc/resolv.conf | wc -l` -eq 0 ]; then
    echo 'nameserver 8.8.8.8' >> /etc/resolv.conf
    echo 'nameserver 4.4.4.4' >> /etc/resolv.conf
fi


today=`date +%Y%m%d`
while [[ true ]]
do
    if [ $today != `date +%Y%m%d` ];then
        today=`date +%Y%m%d`
        certbot renew --nginx >> /var/log/certbot/$today
        nginx -s reload
    fi
    sleep 1s
done
