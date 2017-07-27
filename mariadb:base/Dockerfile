from centos:base

RUN yum install -y mariadb-server \
    && mysql_install_db \
    && sed -i '/\[mysqld\]/a\max_heap_table_size = 1073741824' /etc/my.cnf.d/server.cnf \
    && sed -i '/\[mysqld\]/a\collation-server = utf8mb4_unicode_ci' /etc/my.cnf.d/server.cnf \
    && sed -i '/\[mysqld\]/a\character-set-server = utf8mb4' /etc/my.cnf.d/server.cnf \
    && sed -i '/\[mysqld\]/a\character-set-client-handshake = FALSE' /etc/my.cnf.d/server.cnf \
    && sed -i '/\[mysql\]/a\default-character-set = utf8mb4' /etc/my.cnf.d/mysql-clients.cnf \
    && sed -i '/\[client\]/a\default-character-set = utf8mb4' /etc/my.cnf.d/client.cnf

VOLUME ["/var/lib/mysql","/var/log/mariadb"]

EXPOSE 3306

ENTRYPOINT mysqld_safe
