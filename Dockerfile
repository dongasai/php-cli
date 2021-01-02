#

FROM php:7.0-cli

ENV REFRESH_DATE 2020年12月29日09:13:27

RUN echo "deb http://mirrors.163.com/debian/ buster main non-free contrib" > /etc/apt/sources.list && \
    echo "deb http://mirrors.163.com/debian/ buster-updates main non-free contrib " >> /etc/apt/sources.list  && \
    echo "deb http://mirrors.163.com/debian/ buster-backports main non-free contrib " >> /etc/apt/sources.list && \
    echo "deb-src http://mirrors.163.com/debian/ buster main non-free contrib " >> /etc/apt/sources.list && \
    echo "deb-src http://mirrors.163.com/debian/ buster-updates main non-free contrib " >> /etc/apt/sources.list && \
    echo "deb-src http://mirrors.163.com/debian/ buster-backports main non-free contrib " >> /etc/apt/sources.list  && \
    echo "deb http://mirrors.163.com/debian-security/ buster/updates main non-free contrib  " >> /etc/apt/sources.list  && \
    echo "deb-src http://mirrors.163.com/debian-security/ buster/updates main non-free contrib " >> /etc/apt/sources.list

RUN apt-get update
RUN apt-get install -y vim wget zip zlib1g-dev

RUN docker-php-ext-install bcmath mbstring pdo pdo_mysql zip;docker-php-ext-enable pdo pdo_mysql;


# 安装composer 
RUN wget https://mirrors.aliyun.com/composer/composer.phar \
	&& mv composer.phar /usr/local/bin/composer \
	&& chmod +x /usr/local/bin/composer \
	&& composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/ 

WORKDIR /var/www/html