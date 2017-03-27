#!/bin/bash
apt-get update && apt-get install -y nginx
echo "daemon off;" >> /etc/nginx/nginx.conf
# echo "events { worker_connections 1024; }" >> /etc/nginx/nginx.conf

rm -rf /etc/nginx/sites-enabled/default
ln -s /etc/nginx/sites-available/angular /etc/nginx/sites-enabled/default

npm install -gf @angular/cli @angular/tsc-wrapped typescript@~2.1.0
