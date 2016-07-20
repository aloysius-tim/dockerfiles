FROM node:4.4.7
MAINTAINER Jurien Hamaker <jurien@superbuddy.nl>

WORKDIR /project
EXPOSE 4200 49152 80
ENV HOME /project

COPY ./entrypoint.sh /entrypoint.sh

RUN apt-get update && apt-get install -y nginx

RUN	npm install -g npm			  	\
    && npm install -g angular-cli 	\
    && npm cache clean

RUN chmod 775 /entrypoint.sh && chmod +x /entrypoint.sh

COPY nginx.conf /etc/nginx/sites-enabled/default

VOLUME /project

ENTRYPOINT ["/entrypoint.sh"]