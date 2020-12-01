#!/bin/bash

echo 'nameserver 8.8.8.8' >> /etc/resolv.conf
echo 'nameserver 4.4.4.4' >> /etc/resolv.conf

certbot renew --nginx >> /var/log/certbot

nginx -s reload