FROM php:7.4-fpm-alpine

COPY composer.lock composer.json /var/www/

WORKDIR /var/www

RUN docker-php-ext-install pdo_mysql 

COPY . /var/www

RUN chown -R www-data:www-data \
        /var/www/storage \
        /var/www/bootstrap/cache

RUN mv .env.prod .env