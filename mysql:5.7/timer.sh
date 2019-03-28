#!/bin/bash

if [ ! -f "/var/mysql/backup/schemas" ]; then
    exit 0
fi

cd /var/mysql/backup
cat schemas | while read line
do
    mysqldump -h127.0.0.1 -uroot -proot $line >> $line.sql
done

tar -czf `date +%Y%m%d%H`.tar.gz *.sql
rm -f *.sql

find . -name "*.tar.gz" -mtime +7 -exec rm  {} \;