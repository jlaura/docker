# vim: ft=dockerfile:

FROM nginx:stable

ENV DEBIAN_FRONTEND noninteractive

ADD DOIRootCA2.crt /usr/local/share/ca-certificates/
RUN update-ca-certificates

RUN apt-get update && \
    apt-get install -y \
        build-essential \
        git \
        krb5-multidev \
        krb5-user \
        libghc-regex-pcre-dev \
        libghc-zlib-dev \
        libkrb5-dev \
        libpam-ccreds \
        libpam-krb5 \
    && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/*

WORKDIR /usr/src
ADD http://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz nginx.tar.gz

RUN mkdir nginx && \
    tar xvf nginx.tar.gz -C nginx --strip-components=1

WORKDIR nginx

RUN git clone https://github.com/stnoonan/spnego-http-auth-nginx-module.git && \
    ./configure \
        --prefix=/etc/nginx \
        --sbin-path=/usr/sbin/nginx \
        --modules-path=/usr/lib/nginx/modules \
        --conf-path=/etc/nginx/nginx.conf \
        --error-log-path=/var/log/nginx/error.log \
        --http-log-path=/var/log/nginx/access.log \
        --pid-path=/var/run/nginx.pid \
        --lock-path=/var/run/nginx.lock \
        --user=nginx \
        --group=nginx \
        --add-module=spnego-http-auth-nginx-module \
    && \
    make && \
    make install

FROM nginx:stable

RUN apt-get update && \
    apt-get install -y \
        make \
    && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/*

COPY --from=0 /usr/src/nginx /usr/src/nginx
RUN cd /usr/src/nginx && make install && rm -rf /usr/src/nginx
ADD nginx-auth-krb5/nginx.conf /etc/nginx/nginx.conf
