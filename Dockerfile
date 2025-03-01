FROM ubuntu:noble
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
RUN apt-get update && apt-get install -yq --fix-missing apt-transport-https libpng-dev jq nginx
# Install PHP
RUN apt-get update && apt-get install -yq --fix-missing --no-install-recommends \
    php8.3 \
    php8.3-bcmath \
    php8.3-bz2 \
    php8.3-cli \
    php8.3-common \
    php8.3-curl \
    php8.3-dba \
    php8.3-dev \
    php8.3-enchant \
    php8.3-fpm \
    php8.3-gd \
    php8.3-gmp \
    php8.3-http \
    php8.3-igbinary \
    php8.3-imagick \
    php8.3-imap \
    php8.3-interbase \
    php8.3-intl \
    php8.3-ldap \
    php8.3-mailparse \
    php8.3-mbstring \
    php8.3-memcache \
    php8.3-memcached \
    php8.3-mongodb \
    php8.3-msgpack \
    php8.3-mysql \
    php8.3-odbc \
    php8.3-opcache \
    php8.3-pgsql \
    php8.3-phpdbg \
    php8.3-pspell \
    php8.3-raphf \
    php8.3-readline \
    php8.3-redis \
    php8.3-snmp \
    php8.3-soap \
    php8.3-sqlite3 \
    php8.3-ssh2 \
    php8.3-stomp \
    php8.3-sybase \
    php8.3-tidy \
    php8.3-uploadprogress \
    php8.3-uuid \
    php8.3-xdebug \
    php8.3-xml \
    php8.3-xsl \
    php8.3-yaml \
    php8.3-zip \
    php8.3-zmq

RUN update-alternatives --set php /usr/bin/php8.3
RUN update-alternatives --set phar /usr/bin/phar8.3
RUN update-alternatives --set phar.phar /usr/bin/phar.phar8.3

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

RUN \
  apt-get install -yq --fix-missing xvfb fonts-ipafont-gothic xfonts-cyrillic xfonts-100dpi xfonts-75dpi xfonts-base \
    xfonts-scalable \
  && CHROMEDRIVER_VERSION=`curl  https://googlechromelabs.github.io/chrome-for-testing/last-known-good-versions.json | jq -r .channels.Stable.version` \
  && echo $CHROMEDRIVER_VERSION \
  && curl -sS -o /tmp/chromedriver_latest.zip \
    https://storage.googleapis.com/chrome-for-testing-public/$CHROMEDRIVER_VERSION/linux64/chromedriver-linux64.zip \
  && dir -lh /tmp \
  && unzip -j /tmp/chromedriver_latest.zip chromedriver-linux64/chromedriver -d /tmp \
  && rm /tmp/chromedriver_latest.zip \
  && mv /tmp/chromedriver /opt/chromedriver \
  && chmod +x /opt/chromedriver \
  && ln -fs /opt/chromedriver /usr/local/bin/chromedriver \
  && curl -sS -o - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
  && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list \
  && apt-get -yq update && apt-get install -yq --fix-missing google-chrome-stable x11vnc rsync


RUN curl -sL https://deb.nodesource.com/setup_20.x | bash -
RUN apt-get update && apt-get install -yq --fix-missing nodejs
RUN apt-get update && apt-get install -yq --fix-missing git
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN npm install -g yarn
RUN wget https://phar.phpunit.de/phpunit.phar
RUN chmod +x phpunit.phar
RUN mv phpunit.phar /usr/local/bin/phpunit

RUN npm install -g node-gyp
RUN npm install --unsafe-perm -g node-sass

RUN apt-get update && apt-get install -yq --fix-missing supervisor

ADD configs/supervisord.conf /etc/supervisor/supervisord.conf

ADD configs/nginx-default-site /etc/nginx/sites-available/default
RUN sed -i 's/php8\.4/php8.3/g' /etc/nginx/sites-available/default

RUN npm set progress=false

ADD commands/xvfb.init.sh /etc/init.d/xvfb
RUN chmod +x /etc/init.d/xvfb

ADD commands/start-nginx-ci-project.sh /usr/bin/start-nginx-ci-project
RUN sed -i 's/php8\.4/php8.3/g' /usr/bin/start-nginx-ci-project
RUN chmod +x /usr/bin/start-nginx-ci-project

ADD commands/versions /usr/bin/versions
RUN chmod +x /usr/bin/versions

ADD commands/configure-laravel.sh /usr/bin/configure-laravel
RUN chmod +x /usr/bin/configure-laravel

ADD commands/chrome-system-check.sh /usr/bin/chrome-system-check
RUN chmod +x /usr/bin/chrome-system-check

ADD commands/chromedriver-compatibility-matrix.php /usr/bin/chromedriver-compatibility-matrix.php
RUN chmod +x /usr/bin/chromedriver-compatibility-matrix.php
ADD commands/dusk-versions-check.php /usr/bin/dusk-versions-check.php
RUN chmod +x /usr/bin/dusk-versions-check.php

ADD commands/start-chromedriver.sh /usr/bin/start-chromedriver
RUN chmod +x /usr/bin/start-chromedriver

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


CMD ["php-fpm8.3", "-F"]
