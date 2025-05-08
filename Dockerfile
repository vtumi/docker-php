ARG ALPINE_VERSION=3.21
FROM alpine:${ALPINE_VERSION}

# Install packages
RUN apk add --no-cache \
  tzdata \
  curl \
  php83 \
  php83-ctype \
  php83-curl \
  php83-dom \
  php83-exif \
  php83-fileinfo \
  php83-fpm \
  php83-gd \
  php83-iconv \
  php83-json \
  php83-mbstring \
  php83-mysqli \
  php83-opcache \
  php83-openssl \
  php83-pdo \
  php83-pdo_mysql \
  php83-pecl-imagick \
  php83-phar \
  php83-redis \
  php83-session \
  php83-simplexml \
  php83-xml \
  php83-xmlreader \
  php83-zip \
  php83-zlib \
  supervisor

# Add composer
RUN curl -sS https://getcomposer.org/installer | /usr/bin/php81 && \
    chmod +x composer.phar && \
    mv composer.phar /usr/local/bin/composer

STOPSIGNAL SIGQUIT

EXPOSE 9000

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]
