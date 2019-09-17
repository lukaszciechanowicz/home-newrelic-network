FROM alpine:latest

RUN apk update
RUN apk add iputils bash curl gzip

ENV PING_ENDPOINT 8.8.8.8
ENV PING_INTERVAL 5
ENV PING_SOURCE_LOCATION pi01
ENV NR_API_KEY none

COPY ./ping-stats.sh /tmp/ping-stats.sh
RUN chmod +x /tmp/ping-stats.sh

ENTRYPOINT /tmp/ping-stats.sh