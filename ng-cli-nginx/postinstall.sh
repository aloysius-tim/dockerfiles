#!/bin/bash
apt-get update && apt-get install -y nginx
echo "daemon off;" >> /etc/nginx/nginx.conf
echo "events { worker_connections 1024; }" >> /etc/nginx/nginx.conf
ln -s /etc/nginx/sites-available/angular /etc/nginx/sites-enabled/default

npm install -gf npm
npm install -gf angular-cli@1.0.0-beta.18 @angular/tsc-wrapped typings typescript