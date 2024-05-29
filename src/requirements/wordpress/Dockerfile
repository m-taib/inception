FROM debian:bullseye
RUN apt update ; apt install -y php-fpm\
                                php-mysql\
                                mariadb-client
RUN mkdir -p /run/php 
RUN sed -i "s|listen = /run/php/php7.4-fpm.sock|listen = 0.0.0.0:9000|" /etc/php/7.4/fpm/pool.d/www.conf
RUN apt install -y curl && \
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp
COPY script.sh /usr/local/bin/script
RUN chmod +x /usr/local/bin/script
ENTRYPOINT ["script"]
CMD ["php-fpm7.4",  "-F"]