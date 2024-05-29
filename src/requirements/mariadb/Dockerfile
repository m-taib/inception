FROM debian:bullseye
RUN apt update && apt install mariadb-server -y
RUN mkdir -p /run/mysqld 
#for creating mariadb socket
RUN chown -R mysql:mysql /run/mysqld
COPY tools/mariadb_conf.sh /usr/local/bin/db
RUN chmod +x /usr/local/bin/db
ENTRYPOINT ["db"]
CMD [ "mysqld"]