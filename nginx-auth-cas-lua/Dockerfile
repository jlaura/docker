# vim: ft=dockerfile:
FROM openresty/openresty:bionic

RUN apt-get update && \
    apt install libnginx-mod-http-lua -y && \
    rm -rf /var/lib/apt/lists/*

COPY DOIRootCA2.crt /usr/local/share/ca-certificates/
COPY DigiCertCA.crt /usr/local/share/ca-certificates/
RUN update-ca-certificates

RUN luarocks install lua-resty-http

ADD https://raw.githubusercontent.com/prigaux/nginx-auth-cas-lua/master/src/global_cas_conf.lua \
    /usr/local/openresty/lualib/
RUN chmod 644 /usr/local/openresty/lualib/global_cas_conf.lua

ADD https://raw.githubusercontent.com/prigaux/nginx-auth-cas-lua/master/src/cas.lua \
    /usr/local/openresty/lualib/
RUN chmod 644 /usr/local/openresty/lualib/cas.lua

COPY nginx-auth-cas-lua/nginx.conf /usr/local/openresty/nginx/conf/

