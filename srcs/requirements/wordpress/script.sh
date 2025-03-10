#!/bin/sh

cd /var/www/html

# WP-CLI 다운로드
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar

# 메모리 제한 설정 후 워드프레스 다운로드
php -d memory_limit=512M wp-cli.phar core download --allow-root

# 워드프레스가 이미 설치되어 있는지 확인
if ./wp-cli.phar core is-installed --allow-root; then
    echo "✅ WordPress is already installed. Skipping installation."
else
    echo "🚀 Installing WordPress..."
    ./wp-cli.phar config create --dbname=wordpress --dbuser=wpuser --dbpass=${WP_PASSWD} --dbhost=mariadb --allow-root
    ./wp-cli.phar core install --url=sangshin.42.fr --title=inception --admin_user=${ADMIN_USER} --admin_password=${ADMIN_PASSWD} --admin_email=admin@admin.com --allow-root --skip-email
    ./wp-cli.phar user create user2 user2@example.com --user_pass=${USER2_PASSWD} --role=subscriber --allow-root
fi

# php-fpm 실행
php-fpm83 -F

