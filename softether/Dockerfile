# Change it to base image of python docker image to integrate
FROM debian:buster-slim

WORKDIR /root

# install requirements and update
RUN apt update -y && apt install -y gcc make && apt upgrade -y && apt autoremove -y

# install softether
COPY softether-vpnserver-v4.34-9745-rtm-2020.04.05-linux-x64-64bit.tar.gz softether.tgz
RUN tar -zxvf softether.tgz
RUN cd vpnserver && yes 1 | make
RUN mv vpnserver /usr/local/

# copy config
COPY vpn_server.config /usr/local/vpnserver

# register to init.d
COPY softether.init /etc/init.d/softether
# register to service
# COPY softether.service /usr/lib/systemd/system/

CMD service softether start && /bin/sh -c "while sleep 1000; do :; done"
