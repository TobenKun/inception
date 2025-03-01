FROM alpine:3.21.3

# MariaDB 설치
RUN apk add --no-cache mariadb mariadb-client

COPY mariadb-server.cnf /etc/my.cnf.d/.
COPY init.sql /etc/mysql/init.sql
COPY script.sh .

RUN chmod +x script.sh

# MySQL 소켓 디렉토리 생성
RUN mkdir -p /run/mysqld && \
    chown -R mysql:mysql /run/mysqld

# 포트 오픈
EXPOSE 3306

# MariaDB 실행
CMD ["./script.sh"]

