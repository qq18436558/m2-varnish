FROM    alpine:3.13.2

ENV     LANG C.UTF-8

RUN     apk update && apk add --no-cache varnish apache2-utils && \
        wget https://github.com/just-containers/s6-overlay/releases/download/v2.2.0.3/s6-overlay-amd64.tar.gz -O /tmp/s6-overlay-amd64.tar.gz && \
        tar xzf /tmp/s6-overlay-amd64.tar.gz -C / --exclude="./bin" && tar xzf /tmp/s6-overlay-amd64.tar.gz -C /usr ./bin && \
        rm -rf /tmp/* /var/cache/*  /root/.cache /root/.ash_history

COPY resources/etc/ /etc/