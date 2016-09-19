FROM node:4.5
MAINTAINER Jurien Hamaker <jurien@superbuddy.nl>

WORKDIR /project
EXPOSE 4200 49152 80
ENV HOME /project

VOLUME /project

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod 775 /entrypoint.sh && chmod +x /entrypoint.sh

COPY ./postinstall.sh /postinstall.sh
RUN chmod 775 /postinstall.sh && chmod +x /postinstall.sh

COPY nginx.conf /etc/nginx/sites-available/angular

RUN /postinstall.sh

ENTRYPOINT ["/entrypoint.sh"]