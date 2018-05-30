#!/bin/bash

if [ ! -d '/var/lib/mysql/mysql' ]; then
    mysqld --initialize-insecure --user=root
fi

crond restart

mysqld --user=root
