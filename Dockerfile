FROM ubuntu:16.04

LABEL authors="Yves Hoppe, Robert Deutz"

# Install
RUN apt-get update \
  && DEBIAN_FRONTEND='noninteractive' apt-get -y install software-properties-common apt-transport-https language-pack-en-base \
  && LC_ALL=en_US.UTF-8 add-apt-repository ppa:ondrej/php \
  && apt-get update \
	&& DEBIAN_FRONTEND='noninteractive' apt-get install -y --allow-unauthenticated \
    curl mysql-client wget postgresql-client \
    php7.2 php7.2-common php7.2-memcache php7.2-memcached php7.2-redis php-xdebug  \
    php7.2-gd php7.2-gettext php7.2-mbstring php-mcrypt php7.2-mysql php7.2-sqlite3 \
    php7.2-pgsql php7.2-curl php7.2-ldap php7.2-zip \
    composer \
		&& sed -i 's/memory_limit\s*=.*/memory_limit=-1/g' /etc/php/7.2/cli/php.ini \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && cd /usr/local/bin
