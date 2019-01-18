FROM nginx

ENV SSLPROXY_HOST=http://127.0.0.1:8080
ENV SSLPROXY_HEADER_HOST=example.invalid
ENV SSLPROXY_CERT /etc/ssl/cert.pem
ENV SSLPROXY_KEY /etc/ssl/privkey.pem

COPY sslproxy.sh /usr/local/bin/sslproxy

RUN rm /etc/nginx/conf.d/*
COPY sslproxy.template /etc/nginx/conf.d/sslproxy.template

CMD ["/usr/local/bin/sslproxy"]