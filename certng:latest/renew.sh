#!/bin/bash

if [ `grep '8.8.8.8' /etc/resolv.conf | wc -l` -eq 0 ]; then
    echo 'nameserver 8.8.8.8' >> /etc/resolv.conf
    echo 'nameserver 4.4.4.4' >> /etc/resolv.conf
fi

certbot renew --nginx >> /var/log/certbot

nginx -s reload