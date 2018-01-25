FROM php:7.1-fpm

LABEL maintainer="Khary Sharpe <ksharpe@email.com>"

ENV APP_ENV     PRODUCTION
ENV LANGUAGE   en_US.UTF-8
ENV LANG       en_US.UTF-8
ENV LC_ALL     en_US.UTF-8
ENV COMPOSER_ALLOW_SUPERUSER 1

# Ensure UTF-8

RUN DEBIAN_FRONTEND="noninteractive" apt-get clean && apt-get update && apt-get install -y apt-utils locales
RUN echo "LC_ALL=en_US.UTF-8" >> /etc/environment
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
RUN echo "LANG=en_US.UTF-8" > /etc/locale.
# RUN ln -s /etc/locale.alias /usr/share/locale/locale.alias
RUN DEBIAN_FRONTEND="noninteractive" locale-gen en_US.UTF-8

RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y vim curl wget build-essential nodejs git
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng-dev \
        libpq-dev

RUN docker-php-ext-install -j$(nproc) zip pdo_pgsql pgsql

RUN pecl install xdebug
#    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
#    && docker-php-ext-install -j$(nproc) gd

# Install composer
COPY --from=composer:1.6 /usr/bin/composer /usr/bin/composer

# Load startup script
COPY ./resources/config/xdebug.ini /etc/php/7.1/mods-available/xdebug.ini
COPY ./resources/scripts/start-container /usr/local/bin/start-container
RUN chmod +x /usr/local/bin/start-container

ENTRYPOINT start-container

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
