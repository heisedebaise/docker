FROM centos:base

RUN yum install -y mariadb-server \
    && mysql_install_db --user=root \
    && sed -i '/\[mysqld\]/a\max_heap_table_size = 1073741824' /etc/my.cnf.d/server.cnf \
    && sed -i '/\[mysqld\]/a\collation-server = utf8mb4_unicode_ci' /etc/my.cnf.d/server.cnf \
    && sed -i '/\[mysqld\]/a\character-set-server = utf8mb4' /etc/my.cnf.d/server.cnf \
    && sed -i '/\[mysqld\]/a\character-set-client-handshake = FALSE' /etc/my.cnf.d/server.cnf \
    && sed -i '/\[mysql\]/a\default-character-set = utf8mb4' /etc/my.cnf.d/mysql-clients.cnf \
    && sed -i '/\[client\]/a\default-character-set = utf8mb4' /etc/my.cnf.d/client.cnf \
    && echo '#!/bin/bash' > /backup.sh \
    && echo '' >> /backup.sh \
    && echo 'if [ ! -f "/backup/schemas" ]; then' >> /backup.sh \
    && echo '    exit 0' >> /backup.sh \
    && echo 'fi' >> /backup.sh \
    && echo '' >> /backup.sh \
    && echo 'cd /backup' >> /backup.sh \
    && echo 'cat schemas | while read line' >> /backup.sh \
    && echo 'do' >> /backup.sh \
    && echo '    mysqldump -h127.0.0.1 -uroot -proot $line >> $line.sql' >> /backup.sh \
    && echo 'done' >> /backup.sh \
    && echo '' >> /backup.sh \
    && echo 'tar -czf `date +%Y%m%d%H`.tar.gz *.sql' >> /backup.sh \
    && echo 'rm -f *.sql' >> /backup.sh \
    && echo '' >> /backup.sh \
    && echo 'find . -name "*.tar.gz" -mtime +30 -exec rm  {} \;' >> /backup.sh \
    && chmod +x /backup.sh \
    && echo "0 * * * * /backup.sh" > /var/spool/cron/root \
    && echo '#!/bin/bash' > /mariadb.sh \
    && echo '' >> /mariadb.sh \
    && echo 'crond restart' >> /mariadb.sh \
    && echo 'mysqld_safe --user=root' >> /mariadb.sh \
    && chmod +x /mariadb.sh


VOLUME ["/var/lib/mysql", "/var/log/mariadb", "/backup"]

EXPOSE 3306

ENTRYPOINT ["/mariadb.sh"]
