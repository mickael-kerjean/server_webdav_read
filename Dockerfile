FROM debian:stable-slim
MAINTAINER mickael@kerjean.me

RUN apt-get update && \
    apt-get -y install apache2 && \
    a2enmod dav && \
    a2enmod dav_fs && \
    . /etc/apache2/envvars && \
    mkdir /var/run/apache2 && \
    chown -R www-data:www-data /var/www && \
    apache2 -S    

COPY apache.conf /etc/apache2/sites-available/000-default.conf
WORKDIR "/var/www/html/"
VOLUME ["/var/www/html/"]
EXPOSE 80
CMD ["apachectl" , "-D", "FOREGROUND"]