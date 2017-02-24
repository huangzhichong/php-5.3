FROM php:5.6-fpm

#COPY src /var/www/lms
#COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf


#WORKDIR /var/www/lms

#COPY sources.list /etc/apt/sources.list

RUN apt-get update && apt-get install -y nginx supervisor libmemcached-dev zlib1g-dev \
    && pecl install memcached-2.2.0 \
    && docker-php-ext-enable memcached

COPY index.php /var/www/index.php
COPY lms.conf /etc/nginx/sites-enabled/lms.conf
COPY vhost.conf /etc/nginx/sites-enabled/default.conf
EXPOSE 80 90

CMD ["/bin/bash" ]
