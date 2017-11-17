FROM centos:base

RUN yum install -y mariadb-server \
    && mysql_install_db --user=root \
    && sed -i '/\[mysqld\]/a\long_query_time = 1' /etc/my.cnf.d/server.cnf \
    && sed -i '/\[mysqld\]/a\log-slow-queries = /var/log/mariadb/slow-queries.log' /etc/my.cnf.d/server.cnf \
    && sed -i '/\[mysqld\]/a\innodb_buffer_pool_size = 2g' /etc/my.cnf.d/server.cnf \
    && sed -i '/\[mysqld\]/a\tmp_table_size = 1g' /etc/my.cnf.d/server.cnf \
    && sed -i '/\[mysqld\]/a\max_heap_table_size = 1g' /etc/my.cnf.d/server.cnf \
    && sed -i '/\[mysqld\]/a\max_connections = 1024' /etc/my.cnf.d/server.cnf \
    && sed -i '/\[mysqld\]/a\thread_concurrency = 8' /etc/my.cnf.d/server.cnf \
    && sed -i '/\[mysqld\]/a\character-set-client-handshake = FALSE' /etc/my.cnf.d/server.cnf \
    && sed -i '/\[mysqld\]/a\collation-server = utf8mb4_unicode_ci' /etc/my.cnf.d/server.cnf \
    && sed -i '/\[mysqld\]/a\character-set-server = utf8mb4' /etc/my.cnf.d/server.cnf \
    && sed -i '/\[mysql\]/a\default-character-set = utf8mb4' /etc/my.cnf.d/mysql-clients.cnf \
    && sed -i '/\[client\]/a\default-character-set = utf8mb4' /etc/my.cnf.d/client.cnf \
    && mkdir -p /var/backup \
    && echo 'mysql' > /var/backup/schemas \
    && echo '#!/bin/bash' > /var/backup/run.sh \
    && echo '' >> /var/backup/run.sh \
    && echo 'if [ ! -f "/var/backup/schemas" ]; then' >> /var/backup/run.sh \
    && echo '    exit 0' >> /var/backup/run.sh \
    && echo 'fi' >> /var/backup/run.sh \
    && echo '' >> /var/backup/run.sh \
    && echo 'cd /var/backup' >> /var/backup/run.sh \
    && echo 'cat schemas | while read line' >> /var/backup/run.sh \
    && echo 'do' >> /var/backup/run.sh \
    && echo '    mysqldump -h127.0.0.1 -uroot -proot $line >> $line.sql' >> /var/backup/run.sh \
    && echo 'done' >> /var/backup/run.sh \
    && echo '' >> /var/backup/run.sh \
    && echo 'tar -czf `date +%Y%m%d%H`.tar.gz *.sql' >> /var/backup/run.sh \
    && echo 'rm -f *.sql' >> /var/backup/run.sh \
    && echo '' >> /var/backup/run.sh \
    && echo 'find . -name "*.tar.gz" -mtime +30 -exec rm  {} \;' >> /var/backup/run.sh \
    && chmod +x /var/backup/run.sh \
    && echo "0 * * * * /var/backup/run.sh" > /var/spool/cron/root \
    && echo '#!/bin/bash' > /mariadb.sh \
    && echo '' >> /mariadb.sh \
    && echo 'crond restart' >> /mariadb.sh \
    && echo 'mysqld_safe --user=root' >> /mariadb.sh \
    && chmod +x /mariadb.sh

VOLUME ["/etc/my.cnf.d", "/var/lib/mysql", "/var/log/mariadb", "/var/backup"]

EXPOSE 3306

ENTRYPOINT ["/mariadb.sh"]
