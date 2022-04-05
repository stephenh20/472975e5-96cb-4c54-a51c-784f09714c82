FROM php:8-apache

# install mysql and redis php extensions
RUN docker-php-ext-install pdo pdo_mysql mysqli
RUN pecl install redis-5.3.7 && docker-php-ext-enable redis

# get rid of server name error
RUN echo 'ServerName localhost' >> /etc/apache2/apache2.conf

