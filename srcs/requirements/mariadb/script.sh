#!bin/sh

mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

mysqld_safe --datadir=/var/lib/mysql
