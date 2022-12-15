FROM ubuntu:focal
MAINTAINER Chilio

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

ENV DISPLAY :99
ENV SCREEN_RESOLUTION 1920x720x24
ENV CHROMEDRIVER_PORT 9515

ENV TMPDIR=/tmp

ENV XDEBUG_MODE coverage

RUN apt-get update && apt-get install -yq --fix-missing apt-utils netcat-openbsd
RUN apt-get update && apt-get install -yq --fix-missing language-pack-en-base
ENV LC_ALL=en_US.UTF-8
RUN apt-get update && apt-get install -yq --fix-missing openssl
RUN apt-get update && apt-get install -yq --fix-missing zip unzip
RUN apt-get update && apt-get install -yq --fix-missing software-properties-common curl
RUN add-apt-repository ppa:ondrej/php
RUN sed -i'' 's/archive\.ubuntu\.com/us\.archive\.ubuntu\.com/' /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -yq
RUN apt-get update && apt-get install -yq --fix-missing libgd-tools
# Install PHP
RUN apt-get update && apt-get install -yq --fix-missing \
    php8.2 \
    php8.2-bcmath \
    php8.2-bz2  \
    php8.2-cli \
    php8.2-common \
    php8.2-curl \
    php8.2-dba \
    php8.2-dev \
    php8.2-enchant \
    php8.2-fpm \
    php8.2-gd \
    php8.2-gmp \
    php8.2-imagick \
    php8.2-imap \
    php8.2-interbase \
    php8.2-intl \
    php8.2-ldap \
    php8.2-mbstring \
    php8.2-mysql \
    php8.2-odbc \
    php8.2-opcache \
    php8.2-pgsql \
    php8.2-phpdbg \
    php8.2-pspell \
    php8.2-raphf \
    php8.2-readline \
    php8.2-snmp \
    php8.2-soap \
    php8.2-sqlite3 \
    php8.2-sybase \
    php8.2-tidy \
    php8.2-xml \
    php8.2-xsl \
    php8.2-zip \
    php-geoip \
    php-mongodb\
    php-redis \
    php-ssh2 \
    php-uuid \
    php-zmq \
    php-radius \
    php-http \
    php-uploadprogress \
    php-yaml \
    php-memcached \
    php-memcache \
    php-tideways \
    php-mailparse \
    php-stomp \
    php-ds \
    php-sass \
    php-lua \
    php-geos \
    php-xdebug php-imagick imagemagick nginx


RUN update-alternatives --set php /usr/bin/php8.2
RUN update-alternatives --set phar /usr/bin/phar8.2
RUN update-alternatives --set phar.phar /usr/bin/phar.phar8.2

RUN apt-get update && apt-get install -yq --fix-missing mc lynx mysql-client bzip2 make g++

# Install Redis, Memcached, Beanstalk
RUN apt-get update && apt-get install -yq --fix-missing redis-server memcached beanstalkd

ENV COMPOSER_HOME /usr/local/share/composer
ENV COMPOSER_ALLOW_SUPERUSER 1
ENV PATH "$COMPOSER_HOME:$COMPOSER_HOME/vendor/bin:$PATH"
RUN \
  mkdir -pv $COMPOSER_HOME && chmod -R g+w $COMPOSER_HOME \
  && curl -o /tmp/composer-setup.php https://getcomposer.org/installer \
  && curl -o /tmp/composer-setup.sig https://composer.github.io/installer.sig \
  && php -r "if (hash('SHA384', file_get_contents('/tmp/composer-setup.php')) \
    !== trim(file_get_contents('/tmp/composer-setup.sig'))) { unlink('/tmp/composer-setup.php'); \
    echo 'Invalid installer' . PHP_EOL; exit(1); }" \
  && php /tmp/composer-setup.php --filename=composer --install-dir=$COMPOSER_HOME

ADD commands/xvfb.init.sh /etc/init.d/xvfb

ADD commands/start-nginx-ci-project.sh /usr/bin/start-nginx-ci-project
RUN chmod +x /usr/bin/start-nginx-ci-project

ADD commands/versions /usr/bin/versions
RUN chmod +x /usr/bin/versions

ADD configs/.bowerrc /root/.bowerrc

ADD commands/configure-laravel.sh /usr/bin/configure-laravel

RUN chmod +x /usr/bin/configure-laravel

ADD commands/chrome-system-check.sh /usr/bin/chrome-system-check
RUN chmod +x /usr/bin/chrome-system-check

ADD commands/chromedriver-compatibility-matrix.php /usr/bin/chromedriver-compatibility-matrix.php
RUN chmod +x /usr/bin/chromedriver-compatibility-matrix.php
ADD commands/dusk-versions-check.php /usr/bin/dusk-versions-check.php
RUN chmod +x /usr/bin/dusk-versions-check.php


RUN \
  apt-get install -yq --fix-missing xvfb gconf2 fonts-ipafont-gothic xfonts-cyrillic xfonts-100dpi xfonts-75dpi xfonts-base \
    xfonts-scalable \
  && chmod +x /etc/init.d/xvfb \
  && CHROMEDRIVER_VERSION=`curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE` \
  && mkdir -p /opt/chromedriver-$CHROMEDRIVER_VERSION \
  && curl -sS -o /tmp/chromedriver_linux64.zip \
    http://chromedriver.storage.googleapis.com/$CHROMEDRIVER_VERSION/chromedriver_linux64.zip \
  && unzip -qq /tmp/chromedriver_linux64.zip -d /opt/chromedriver-$CHROMEDRIVER_VERSION \
  && rm /tmp/chromedriver_linux64.zip \
  && chmod +x /opt/chromedriver-$CHROMEDRIVER_VERSION/chromedriver \
  && ln -fs /opt/chromedriver-$CHROMEDRIVER_VERSION/chromedriver /usr/local/bin/chromedriver \
  && curl -sS -o - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
  && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list \
  && apt-get -yq update && apt-get install -yq --fix-missing google-chrome-stable x11vnc rsync

RUN apt-get update && apt-get install -yq --fix-missing apt-transport-https libpng-dev
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get update && apt-get install -yq --fix-missing nodejs
RUN apt-get update && apt-get install -yq --fix-missing git
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

#RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
#RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
#RUN apt-get update && apt-get install -yq --fix-missing yarn
RUN npm install -g yarn
RUN yarn global add bower
RUN wget https://phar.phpunit.de/phpunit.phar
RUN chmod +x phpunit.phar
RUN mv phpunit.phar /usr/local/bin/phpunit

RUN npm install -g node-gyp
RUN npm install --unsafe-perm -g node-sass
RUN npm install -g gulp

RUN apt-get update && apt-get install -yq --fix-missing supervisor

ADD configs/supervisord.conf /etc/supervisor/supervisord.conf

ADD configs/nginx-default-site /etc/nginx/sites-available/default

RUN npm set progress=false
RUN mkdir /run/php

VOLUME [ "/var/log/supervisor" ]

# Clean system up
RUN apt-get -yq update
RUN apt-get -yq upgrade
RUN apt-get -yq autoremove
RUN apt-get -yq clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN systemctl enable xvfb

RUN versions

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION
LABEL org.label-schema.build-date=$BUILD_DATE \
          org.label-schema.name="Laravel Dusk CI Docker" \
          org.label-schema.description="Test suite for Laravel Dusk in gitlab CI" \
          org.label-schema.url="https://hub.docker.com/r/chilio/laravel-dusk-ci/" \
          org.label-schema.vcs-ref=$VCS_REF \
          org.label-schema.vcs-url="https://github.com/chilio/laravel-dusk-ci" \
          org.label-schema.vendor="Chilio" \
          org.label-schema.version=$VERSION \
          org.label-schema.schema-version="1.0.0"


CMD ["php-fpm8.2", "-F"]
