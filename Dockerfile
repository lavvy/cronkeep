FROM ubuntu:14.04.3
#FROM armv7/armhf-ubuntu:14.04.3

MAINTAINER lavashonline@gmail.com 

# Install packages
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
  apt-get -y install supervisor git apache2 libapache2-mod-php5 mysql-server php5-mysql pwgen wget net-tools iptables nano sudo php-apc php5-mcrypt curl at && \
  echo "ServerName localhost" >> /etc/apache2/apache2.conf

RUN curl -sS https://getcomposer.org/installer | php

RUN php composer.phar create-project cronkeep/cronkeep --keep-vcs -s dev /var/www/cronkeep


EXPOSE 80 

CMD "bash" 
