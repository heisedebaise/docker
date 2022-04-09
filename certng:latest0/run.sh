#!/bin/bash

/usr/sbin/crond -i

nginx -g 'daemon off;'