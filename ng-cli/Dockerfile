FROM node:4.4.7
MAINTAINER Jurien Hamaker <jurien@superbuddy.nl>

WORKDIR /project
EXPOSE 4200 49152
ENV HOME /tmp

COPY ./entrypoint.sh /entrypoint.sh

RUN set -ex;                    \
	npm install -g npm;			\
    npm install -g angular-cli; \
    npm cache clean;			\
    chmod 775 /entrypoint.sh;	\
    chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]