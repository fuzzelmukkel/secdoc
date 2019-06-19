# Get apache with php 7.2 as base image
FROM php:7.2-apache
# Install needed tools and php extensions
RUN apt-get update && apt-get install -y libpng-dev git zip
RUN docker-php-ext-install mbstring gd
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
RUN mkdir secdoc
RUN mv html/assets/demo.db secdoc/demo.db
RUN mkdir secdoc/PDF && mkdir secdoc/temp & mkdir secdoc/inc
RUN chmod -R 755 secdoc & chown -R www-data secdoc
# Install dependencies with composer
WORKDIR /var/www/html/assets
RUN composer install
# Adjust access rights
WORKDIR /var/www/
RUN chmod -R 755 html & chown -R www-data html
EXPOSE 80/tcp
