#!/bin/bash

envsubst \
	'${SSLPROXY_PORT} ${SSLPROXY_HEADER_HOST}' \
	< /etc/nginx/conf.d/sslproxy.template \
	> /etc/nginx/conf.d/default.conf

nginx -g 'daemon off;'