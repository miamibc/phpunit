# PHPUnit Docker Container.
# with php7.1, xdebug, composer and phpunit 7.5

FROM alpine:3.7
    
MAINTAINER Sergei Miami <miami@blackcrystal.net>

ADD https://repos.php.earth/alpine/phpearth.rsa.pub /etc/apk/keys/phpearth.rsa.pub
RUN echo "https://repos.php.earth/alpine/v3.7" >> /etc/apk/repositories \
	&& apk update && apk --no-cache add \
		bash \
		ca-certificates \
		git \
		curl \
		unzip \
		openssh-client \
		rsync \
		php7.1 \
		php7.1-bcmath \
		php7.1-ctype \
		php7.1-curl \
		php7.1-dom \
		php7.1-exif \
		php7.1-fileinfo \
		php7.1-gd \
		php7.1-iconv \
		php7.1-json \
		php7.1-mbstring \
		php7.1-mcrypt \
		php7.1-mysqlnd \
		php7.1-opcache \
		php7.1-openssl \
		php7.1-pcntl \
		php7.1-pdo \
		php7.1-pdo_mysql \
		php7.1-pdo_pgsql \
		php7.1-pdo_sqlite \
		php7.1-phar \
		php7.1-session \
		php7.1-simplexml \
		php7.1-soap \
		php7.1-tokenizer \
		php7.1-xdebug \
		php7.1-xml \
		php7.1-xmlreader \
		php7.1-xmlwriter \
		php7.1-zip \
		php7.1-zlib \
		php7.1-pear php7.1-dev gcc musl-dev make \
        libssh2-dev libssh2 \
&& pecl install ssh2-1.2 \
&& echo "extension=ssh2.so" >> /etc/php/7.1/php.ini

WORKDIR /tmp 
	
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
	&& php composer-setup.php --install-dir=/usr/bin --filename=composer \
	&& php -r "unlink('composer-setup.php');" \
	&& composer require "phpunit/phpunit:^7" --prefer-source --no-interaction \
	&& ln -s /tmp/vendor/bin/phpunit /usr/local/bin/phpunit \
	&& sed -i 's/\;z/z/g' /etc/php/7.1/conf.d/xdebug.ini \
	&& php -m | grep -i xdebug

VOLUME ["/app"]
WORKDIR /app

ENTRYPOINT ["/usr/local/bin/phpunit"]
CMD ["--help"]
