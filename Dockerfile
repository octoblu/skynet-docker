FROM ubuntu:12.04

MAINTAINER Skynet http://skynet.im/

RUN apt-get update -y --fix-missing
RUN apt-get install -y python-software-properties 
RUN add-apt-repository ppa:chris-lea/node.js
RUN echo "deb http://us.archive.ubuntu.com/ubuntu/ precise universe" >> /etc/apt/sources.list

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10
RUN echo "deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen" | tee -a /etc/apt/sources.list.d/10gen.list
RUN apt-get update -y --fix-missing
RUN apt-get -y install redis-server apt-utils supervisor nodejs
RUN apt-get -y install -o apt::architecture=amd64 mongodb-org=2.6.0

RUN sed -i 's/daemonize yes/daemonize no/g' /etc/redis/redis.conf

EXPOSE 3000

ONBUILD ADD . /var/www
ONBUILD RUN cd /var/www && npm install
ONBUILD ADD ./docker/config.js.docker /var/www/config.js
ONBUILD ADD ./docker/supervisor.conf /etc/supervisor/conf.d/supervisor.conf
ONBUILD RUN mkdir /var/log/skynet
ONBUILD CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf"] 
