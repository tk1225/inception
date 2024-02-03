FROM debian:buster

RUN apt-get update \
    && apt-get install -y nginx php-fpm php-mysql mariadb-client wget curl sudo\
    && rm -rf /var/lib/apt/lists/*

WORKDIR /var/www
RUN wget https://wordpress.org/latest.tar.gz \
    && tar -xzvf latest.tar.gz \
    && rm latest.tar.gz \
    && chown -R 755 /var/www/wordpress

COPY php-fpm.conf /etc/php/7.3/fpm/pool.d/www.conf
RUN mkdir /run/php

# Expose ports
EXPOSE 9000

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
COPY ./tools/wait.sh ./tools/wait.sh
RUN chmod +x ./tools/wait.sh

CMD ["bash" ,"./tools/wait.sh"]