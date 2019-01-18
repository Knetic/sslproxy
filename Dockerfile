FROM nginx

ENV SSLPROXY_PORT=8080
ENV SSLPROXY_HEADER_HOST=example.invalid

COPY sslproxy.sh /usr/local/bin/sslproxy

RUN rm /etc/nginx/conf.d/*
COPY sslproxy.template /etc/nginx/conf.d/sslproxy.template

CMD ["/usr/local/bin/sslproxy"]