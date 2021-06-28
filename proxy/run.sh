#!/bin/sh

set -e 

envsubst < /etc/nginx/default.conf.tpl > /etc/nginx/conf.d/default.conf
nginx -g 'deamon off;'

uwsgi ---socket :900 --workers 4 --master --enable-threads --module app.wsgi