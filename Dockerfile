FROM php:7.2-apache
COPY / /var/www/html/
RUN chmod -R 755 /var/www/html/
RUN chown -R www-data /var/www/html/
EXPOSE 80/tcp
