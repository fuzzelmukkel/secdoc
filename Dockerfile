# Get apache with php 7.4 as base image
FROM php:7.4-apache
# Install needed tools and php extensions
RUN apt-get update && apt-get install -y libpng-dev git zip libonig-dev libldap2-dev nano sqlite3
RUN docker-php-ext-install mbstring gd ldap
# Install composer
RUN curl -o /tmp/composer-setup.php https://getcomposer.org/installer \
&& curl -o /tmp/composer-setup.sig https://composer.github.io/installer.sig \
# Make sure we're installing what we think we're installing!
&& php -r "if (hash('SHA384', file_get_contents('/tmp/composer-setup.php')) !== trim(file_get_contents('/tmp/composer-setup.sig'))) { unlink('/tmp/composer-setup.php'); echo 'Invalid installer' . PHP_EOL; exit(1); }" \
&& php /tmp/composer-setup.php --no-ansi --install-dir=/usr/local/bin --filename=composer --snapshot \
&& rm -f /tmp/composer-setup.*
# Copy SecDoc files and prepare folders
COPY / /var/www/html/
WORKDIR /var/www/
RUN rm html/install.php && mkdir secdoc temp && mv html/assets/demo.db secdoc/demo.db && mv html/assets/ajax/secdoc.conf.php secdoc/secdoc.conf.php
RUN mkdir secdoc/PDF secdoc/inc secdoc/sessions
RUN chmod -R 755 secdoc && chown -R www-data secdoc && chmod -R 755 temp && chown -R www-data temp
# Install dependencies with composer
WORKDIR /var/www/html/assets
RUN composer install
# Adjust access rights
WORKDIR /var/www/
RUN chmod -R 755 html & chown -R www-data html
EXPOSE 80/tcp
