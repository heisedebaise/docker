#!/bin/bash

certbot renew --nginx >> /var/log/certbot

nginx -s reload