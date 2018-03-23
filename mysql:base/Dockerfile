FROM centos:base

RUN yum install -y crontabs https://repo.mysql.com//mysql57-community-release-el7-11.noarch.rpm \
    && yum install -y mysql-community-server \
    && mysqld --initialize-insecure --user=root \
    && sed -i 's/\/var\/log\/mysqld.log/\/var\/log\/mysql\/mysqld.log/g' /etc/my.cnf \
    && echo '' >> /etc/my.cnf \
    && echo '!includedir /etc/my.cnf.d' >> /etc/my.cnf \
    && mkdir /var/backup \
    && echo 'information_schema' > /var/backup/schemas \
    && echo 'mysql' >> /var/backup/schemas \
    && echo 'performance_schema' >> /var/backup/schemas \
    && echo 'sys' >> /var/backup/schemas

COPY *.cnf /etc/my.cnf.d/
COPY mysql.sh /var/
COPY timer.sh /var/backup/

RUN chmod +x /var/mysql.sh \
    && chmod +x /var/backup/timer.sh \
    && echo '0 * * * * /var/backup/timer.sh' > /var/spool/cron/root

VOLUME ["/etc/my.cnf.d", "/var/lib/mysql", "/var/backup", "/var/log/mysql"]

EXPOSE 3306

ENTRYPOINT ["/var/mysql.sh"]