#!/bin/sh
cd /var/www/html
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
php -d memory_limit=512M wp-cli.phar core download --allow-root

./wp-cli.phar config create --dbname=wordpress --dbuser=wpuser --dbpass=${WP_PASSWD} --dbhost=mariadb --allow-root
./wp-cli.phar core install --url=localhost --title=inception --admin_user=${ADMIN_USER} --admin_password=${ADMIN_PASSWD} --admin_email=admin@admin.com --allow-root
./wp-cli.phar user create user2 user2@example.com --user_pass=${USER2_PASSWD} --role=subscriber --allow-root

php-fpm83 -F
