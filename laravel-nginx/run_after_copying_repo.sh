#!/bin/bash
set -e
# After copying the repo of your project
# run this script to run composer update
# and preform some basic required actions.

# if dir exist, do not produce an error (|| true)
mkdir /var/www/bootstrap/cache || true
/usr/local/bin/composer update --no-scripts
mkdir /var/www/storage/framework/views || true
chown www-data:www-data -R /var/www
chmod 755 -R /var/www/storage
