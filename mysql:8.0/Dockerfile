FROM centos:base

RUN dnf install -y crontabs https://repo.mysql.com/mysql80-community-release-el8-1.noarch.rpm \
    && dnf install -y mysql-server \
    && echo 'max_connections = 1024' >> /etc/my.cnf.d/mysql-server.cnf \
    && echo 'max_heap_table_size = 1g' >> /etc/my.cnf.d/mysql-server.cnf \
    && echo 'tmp_table_size = 1g' >> /etc/my.cnf.d/mysql-server.cnf \
    && echo 'innodb_buffer_pool_size = 1g' >> /etc/my.cnf.d/mysql-server.cnf \
    && sed -i '/\[client\]/a\default-character-set=utf8mb4' /etc/my.cnf.d/client.cnf \
    && mkdir -p /var/mysql/backup \
    && echo 'information_schema' > /var/mysql/backup/schemas \
    && echo 'mysql' >> /var/mysql/backup/schemas \
    && echo 'performance_schema' >> /var/mysql/backup/schemas \
    && echo 'sys' >> /var/mysql/backup/schemas

COPY run.sh /var/mysql/
COPY timer.sh /var/mysql/backup/

RUN chmod +x /var/mysql/run.sh \
    && chmod +x /var/mysql/backup/timer.sh \
    && echo '0 * * * * /var/mysql/backup/timer.sh' > /var/spool/cron/root

EXPOSE 3306

ENTRYPOINT ["/var/mysql/run.sh"]