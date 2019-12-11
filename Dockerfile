FROM danisbagus/base-php7:latest

RUN mkdir /app
RUN mkdir -p /run/php
RUN mkdir -p /var/log/nginx

# Copy error html file
COPY docker/html /var/lib/nginx/html

# Copy nginx configuration
COPY docker/nginx/nginx.conf /etc/nginx/nginx.conf
COPY docker/nginx/default.conf /etc/nginx/conf.d/default.conf

# Copy php configuration
COPY docker/php/php-fpm.conf /etc/php/7.2/fpm/php-fpm.conf
COPY docker/php/php.ini /etc/php/7.2/fpm/php.ini

# Copy supervisor configuration
COPY docker/supervisor/supervisor.conf /etc/supervisor/supervisor.conf

# Copy memcached configuration
COPY docker/memcached/memcached.conf /etc/memcached.conf

RUN ln -sf /dev/stdout /var/log/nginx/access.log \
 && ln -sf /dev/stderr /var/log/nginx/error.log

COPY docker/entrypoint.sh /carmudi/alice/entrypoint.sh

EXPOSE 80 443

WORKDIR /app

# ENTRYPOINT ["./entrypoint.sh"]

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisor.conf"]

