FROM php:7.2-apache
#COPY src/ /var/www/html/
COPY ./virtualhost.example /etc/apache2/sites-available/
RUN apt-get update && apt-get install libzip-dev libpng-dev -y
RUN docker-php-ext-install mysqli pdo pdo_mysql zip gd opcache
VOLUME ["/var/www/html"]
