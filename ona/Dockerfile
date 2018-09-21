ARG PHP_VERSION=5

FROM php:$PHP_VERSION-apache

# Any git tag, branch, or commit works as version
ARG ONA_VERSION=master

ENV DEBIAN_FRONTEND noninteractive
ENV ONA_ROOT /opt/ona
ENV APACHE_DOCUMENT_ROOT /var/www/html/

# Build-time metadata as defined at http://label-schema.org
ARG BUILD_DATE
ARG VCS_REF
ARG APP_VCS_REF

LABEL maintainer="Fabian Raab <fabian@raab.link>" \
      ona-version="$ONA_VERSION" \
      php-version="$PHP_VERSION" \
      app-vcs-url="https://github.com/opennetadmin/ona" \
      app-vcs-ref="$APP_VCS_REF" \
      vcs-url-orig="https://gitlab.com/raabf/ona-docker.git" \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name="ona-docker" \
      org.label-schema.description="OpenNetAdmin (ONA) IP Address Management (IPAM) tool" \
      org.label-schema.url="http://opennetadmin.com/" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/raabf/ona-docker.git" \
      org.label-schema.docker.cmd="docker run --detach --publish 0.0.0.0:8666:80 -v /etc/ona/local/:/opt/ona/www/local -v /etc/timezone:/etc/timezone:ro -v /etc/localtime:/etc/localtime:ro" \
      org.label-schema.schema-version="1.0"

ENV DEBIAN_FRONTEND noninteractive

# Set ona www as apache document root
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf && \
    sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

COPY ./apache2.conf /etc/apache2/conf-available/ona.conf

RUN a2enconf ona.conf && \
    mv $PHP_INI_DIR/php.ini-production $PHP_INI_DIR/php.ini


# Install dependencies and dev packeges to build php extensions
RUN apt-get update && \
    apt-get install --quiet --yes \
    libgmp-dev re2c libmcrypt-dev libldap2-dev nmap iputils-ping unzip dnsutils file && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /usr/share/doc/* && \
    rm -rf /tmp/*

# Install requered php extensions
RUN ln -s /usr/include/x86_64-linux-gnu/gmp.h /usr/local/include/  && \
    docker-php-ext-configure gmp  && \
    docker-php-ext-install gmp && \
    docker-php-ext-configure mcrypt  && \
    docker-php-ext-install mcrypt && \
    docker-php-ext-install opcache mysqli pdo_mysql  && \
    docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/ && \
    docker-php-ext-install ldap

# Download an install ONA
WORKDIR $ONA_ROOT
RUN curl -L https://github.com/opennetadmin/ona/archive/$ONA_VERSION.tar.gz | tar --strip 1 -xz  && \
    echo "$ONA_ROOT" > /etc/onabase && \
    mv --force --strip-trailing-slashes ./www/local ./www/local.dist && \
    mkdir --verbose ./www/local && \
    touch /var/log/ona.log && \
    chown --recursive --verbose www-data:www-data ./www/local /var/log/ona.log

# Optional: For php debugging
#RUN echo "<?php phpinfo(); ?>" > ./www/phpinfo.php

# Script to initialize local config for the docker volume.
# Run it after creating a new container.
COPY ./init_conf.sh ./

# The local configuration of ONA
VOLUME $ONA_ROOT/www/local

EXPOSE 80/tcp

