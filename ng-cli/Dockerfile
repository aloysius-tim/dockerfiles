FROM node:latest
MAINTAINER Jurien Hamaker <jurien@superbuddy.nl>

WORKDIR /project
EXPOSE 4200 49152
ENV HOME /tmp

COPY entrypoint.sh /usr/bin/entrypoint

RUN set -ex;                    \
    npm install -g angular-cli; \
    npm cache clean;

ENTRYPOINT ["/usr/bin/entrypoint"]