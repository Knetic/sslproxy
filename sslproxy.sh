#!/bin/bash

envsubst \
	'${SSLPROXY_HOST} ${SSLPROXY_HEADER_HOST} ${SSLPROXY_CERT} ${SSLPROXY_KEY}' \
	< /etc/nginx/conf.d/sslproxy.template \
	> /etc/nginx/conf.d/default.conf

nginx -g 'daemon off;'