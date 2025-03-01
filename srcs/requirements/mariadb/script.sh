#!bin/sh

mariadb-install-db --basedir=/usr --datadir=/var/lib/mysql

mysqld_safe --datadir=/var/lib/mysql
