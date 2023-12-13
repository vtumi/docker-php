ARG ALPINE_VERSION=3.17
FROM alpine:${ALPINE_VERSION}

# Install packages
RUN apk add --no-cache \
  curl \
  php81 \
  php81-ctype \
  php81-curl \
  php81-dom \
  php81-exif \
  php81-fileinfo \
  php81-fpm \
  php81-gd \
  php81-iconv \
  php81-json \
  php81-mbstring \
  php81-mysqli \
  php81-opcache \
  php81-openssl \
  php81-pdo \
  php81-pdo_mysql \
  php81-pecl-imagick \
  php81-phar \
  php81-redis \
  php81-session \
  php81-simplexml \
  php81-xml \
  php81-xmlreader \
  php81-zip \
  php81-zlib \
  supervisor

# Add composer
RUN curl -sS https://getcomposer.org/installer | /usr/bin/php81 && \
    chmod +x composer.phar && \
    mv composer.phar /usr/local/bin/composer

STOPSIGNAL SIGQUIT

EXPOSE 9000

CMD ["/usr/bin/supervisord"]
