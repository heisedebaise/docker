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
    && echo 'mysql' > /var/backup/schemas

COPY mariadb.sh /
COPY timer.sh /var/backup/

RUN chmod +x /mariadb.sh \
    && chmod +x /var/backup/timer.sh \
    && echo '0 * * * * /var/backup/timer.sh' > /var/spool/cron/root

VOLUME ["/etc/my.cnf.d", "/var/lib/mysql", "/var/log/mariadb", "/var/backup"]

EXPOSE 3306

ENTRYPOINT ["/mariadb.sh"]
