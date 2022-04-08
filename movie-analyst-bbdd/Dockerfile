FROM mysql:latest

ENV MYSQL_ROOT_PASSWORD ${MYSQL_ROOT_PASSWORD}
ENV MYSQL_NAME ${MYSQL_NAME}
ADD data-schema.sql /docker-entrypoint-initdb.d

EXPOSE 3306
