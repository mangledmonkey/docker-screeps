FROM node:latest
MAINTAINER Brandon West <brandon@mangledmonkey.com>
LABEL Description="Install screeps personal server."

# install supervisor
RUN apt-get update && apt-get -y install \
    python-setuptools
RUN easy_install supervisor

# install screeps
RUN npm install -g screeps

# add supervisord config and setup scripts
ADD configs/* /root/configs/
ADD scripts/* /root/scripts/

# set up supervisord
RUN chmod a+x /root/scripts/* && \
    mkdir -p /etc/supervisor /var/log/supervisor && \
    cp /root/configs/supervisord.conf /etc/supervisor/supervisord.conf

# open screeps port
EXPOSE 21025

# start core services
CMD ["/bin/bash", "-c", "/root/scripts/setup.sh"]