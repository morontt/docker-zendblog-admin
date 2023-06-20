FROM php:7.4-apache-buster

MAINTAINER Alexander Harchenko <morontt@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV PHP_CPPFLAGS="$PHP_CPPFLAGS -std=c++11"
ENV TZ "Europe/Moscow"
ENV COMPOSER_ALLOW_SUPERUSER 1

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

COPY ./custom-apt.sh /tmp/custom-apt.sh
RUN bash /tmp/custom-apt.sh

RUN docker-php-ext-install -j$(nproc) intl zip pdo_mysql opcache \
    && pecl install imagick \
    && docker-php-ext-enable imagick

COPY ./.bashrc /root/.bashrc
RUN cp ${PHP_INI_DIR}/php.ini-production ${PHP_INI_DIR}/php.ini \
    && sed -i 's/;date.timezone =/date.timezone = Europe\/Moscow/' ${PHP_INI_DIR}/php.ini \
    && sed -i 's/memory_limit = 128M/memory_limit = 512M/' ${PHP_INI_DIR}/php.ini \
    && echo "LogFormat \"%a %l %u %t \\\"%r\\\" %>s %O \\\"%{User-Agent}i\\\"\" mainlog" >> /etc/apache2/apache2.conf
RUN a2enmod rewrite remoteip && a2dismod deflate -f

RUN set -x && curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer \
    && composer self-update 2.2.9
