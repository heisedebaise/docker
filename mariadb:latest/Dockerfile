FROM centos:base

RUN yum install -y crontabs mariadb-server \
    && mysql_install_db --user=root \
    && mkdir -p /var/backup \
    && echo 'mysql' > /var/backup/schemas

COPY *.cnf /etc/my.cnf.d/
COPY mariadb.sh /
COPY timer.sh /var/backup/

RUN chmod +x /mariadb.sh \
    && chmod +x /var/backup/timer.sh \
    && echo '0 * * * * /var/backup/timer.sh' > /var/spool/cron/root

VOLUME ["/etc/my.cnf.d", "/var/lib/mysql", "/var/log/mariadb", "/var/backup"]

EXPOSE 3306

ENTRYPOINT ["/mariadb.sh"]
