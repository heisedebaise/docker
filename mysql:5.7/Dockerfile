FROM centos:base

RUN yum install -y crontabs https://repo.mysql.com//mysql57-community-release-el7-10.noarch.rpm \
    && yum install -y mysql-community-server \
    && sed -i 's,/var/log/mysqld.log,/var/log/mysql/mysqld.log,g' /etc/my.cnf \
    && echo '' >> /etc/my.cnf \
    && echo '!includedir /etc/my.cnf.d' >> /etc/my.cnf \
    && mkdir -p /var/mysql/backup \
    && echo 'information_schema' > /var/mysql/backup/schemas \
    && echo 'mysql' >> /var/mysql/backup/schemas \
    && echo 'performance_schema' >> /var/mysql/backup/schemas \
    && echo 'sys' >> /var/mysql/backup/schemas 

COPY *.cnf /etc/my.cnf.d/
COPY run.sh /var/mysql/
COPY timer.sh /var/mysql/backup/

RUN chmod +x /var/mysql/run.sh \
    && chmod +x /var/mysql/backup/timer.sh \
    && echo '0 * * * * /var/mysql/backup/timer.sh' > /var/spool/cron/root

EXPOSE 3306

ENTRYPOINT ["/var/mysql/run.sh"]