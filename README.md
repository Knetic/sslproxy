sslproxy
=====

[![](https://img.shields.io/docker/pulls/knetic/sslproxy.svg)](https://img.shields.io/docker/pulls/knetic/sslproxy.svg)

A simple container meant to perform easy nginx SSL termination, configured using env vars. Made in a straightforward manner, good for "minimum viable product" architectures and home labs. 

Using
=====

Examples speak louder than words:

```
sslproxy:
    image: knetic/sslproxy
    container_name: sslproxy
    restart: always
    volumes:
      - /etc/letsencrypt/certs:/etc/ssl
    links:
      - webserver
    ports:
      - 80:443
    environment:
      - SSLPROXY_HOST=http://webserver:80
      - SSLPROXY_HEADER_HOST=proxied.webserver.invalid
```

Requirements
=====

* `SSLPROXY_HOST` env var, which is an _URL_ (not FQDN) pointing at the HTTP server you want to proxy traffic for.
* `SSLPROXY_HEADER_HOST` env var, which will turn into the Host header on each response.
* A mounted directory `/etc/ssl` with certificate files that you want to present to requestors. The actual format of this is up to nginx, but the author uses LetsEncrypt certs and keys.
    * The name of the cert and key can be customized with `SSLPROXY_CERT` and `SSLPROXY_KEY`, respectively.

Why?
=====

Not every application supports TLS/SSL, and it's a pain to write your own nginx configs for every application you want to run.

This takes the best of a series of top-of-google links to run a simple SSL proxy with a minimum of headache. It's not meant to be the end-result of a scalable system, but rather a piece of a small proof-of-concept architecture, or a home lab. If you need more than that, you should already know how to build it.

Links for the lazy:
- [nginx ssl proxying](https://stackoverflow.com/q/49711226/860453)
- [envsubst for nginx configs](https://serverfault.com/a/755541/155321)