#!/bin/bash
set -e
# After copying the repo of your project
# run this script to run composer update
# and preform some basic required actions.

# if dir exist, do not produce an error (|| true)
RUN mkdir /repo/bootstrap/cache || true
RUN /usr/local/bin/composer update --no-scripts
RUN mkdir /var/www/storage/framework/views || true
RUN chown www-data:www-data -R /var/www
RUN chmod 777 -R /var/www/storage
