FROM ubuntu:16.04

ENV LANG C.UTF-8

RUN apt update && DEBIAN_FRONTEND=noninteractive apt-get install -y wget tzdata && apt -y install varnish apache2-utils && \
    wget https://github.com/just-containers/s6-overlay/releases/download/v2.2.0.3/s6-overlay-amd64.tar.gz -O /tmp/s6-overlay-amd64.tar.gz && \
    tar xzf /tmp/s6-overlay-amd64.tar.gz -C / --exclude="./bin" && tar xzf /tmp/s6-overlay-amd64.tar.gz -C /usr ./bin && \
    mkdir /logs && apt-get autoremove -y && apt-get clean && apt-get autoclean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 80 6081 6082