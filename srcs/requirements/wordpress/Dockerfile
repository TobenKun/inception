FROM alpine:3.21.3

# 패키지 업데이트 및 필수 패키지 설치
RUN apk update && apk add --no-cache\
    php-fpm \
    php-mysqli \
    php-cli \
    php-phar \
    php-mbstring \
    curl

# php-fpm 설정 복사
COPY www.conf /etc/php83/php-fpm.d/.
COPY script.sh .

RUN chmod +x script.sh

# 포트 오픈
EXPOSE 9000

# php-fpm 실행
CMD ["./script.sh"]

