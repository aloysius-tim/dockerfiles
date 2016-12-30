# Node
FROM node:6
MAINTAINER Jurien Hamaker <jurien@superbuddy.nl>

# Volumes
VOLUME /project
VOLUME /sdk

WORKDIR /project
EXPOSE 3000 5858 81
ENV HOME /project

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod 775 /entrypoint.sh && chmod +x /entrypoint.sh

# Fixes https://github.com/npm/npm/issues/9863
RUN cd $(npm root -g)/npm \
	&& npm install fs-extra \
	&& sed -i -e s/graceful-fs/fs-extra/ -e s/fs\.rename/fs.move/ ./lib/utils/rename.js

RUN	npm install --unsafe-perm -g npm \
	grunt \
	grunt-nodemon \
    grunt-cli \
    forever \
    strongloop					 	\
    @mean-expert/loopback-sdk-builder \
    && npm cache clean

CMD ["/entrypoint.sh"]