FROM php:8.2-apache
#COPY src/ /var/www/html/
COPY ./virtualhost.example /etc/apache2/sites-available/
RUN apt-get update && apt-get install libzip-dev libjpeg-dev libpng-dev -y
RUN pecl install xdebug
RUN docker-php-ext-enable xdebug
RUN docker-php-ext-configure gd --with-jpeg
RUN docker-php-ext-install mysqli pdo pdo_mysql zip gd opcache
VOLUME ["/var/www/html"]
