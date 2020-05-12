# vim: ft=dockerfile:

FROM usgsastro/python:2

ARG NGINX_LDAP_VERSION=0.0.5

SHELL ["/bin/bash", "-c"]

RUN apt-get update && \
    apt-get install -y \
        gcc \
        libldap2-dev \
        libsasl2-dev \
        unzip \ 
    && \
    rm -rf /var/cache/apt/* /var/lib/apt/lists/*

ADD https://github.com/nginxinc/nginx-ldap-auth/archive/release-${NGINX_LDAP_VERSION}.zip \
    /usr/local/nginx-ldap-auth.zip

WORKDIR /usr/local
RUN unzip nginx-ldap-auth.zip && \
    rm nginx-ldap-auth.zip

WORKDIR nginx-ldap-auth-release-${NGINX_LDAP_VERSION}

RUN pip install virtualenv && \
    python -m virtualenv .env && \
    .env/bin/pip install python-ldap


# Stage 2: No build dependencies
FROM usgsastro/python:2

ARG NGINX_LDAP_VERSION=0.0.5

SHELL ["/bin/bash", "-c"]

RUN apt-get update && \
    apt-get install -y \
        libldap-2.4.2 \
        libsasl2-2 \
    && \
    rm -rf /var/cache/apt/* /var/lib/apt/lists/*

COPY --from=0 /usr/local/nginx-ldap-auth-release-${NGINX_LDAP_VERSION} \
    /usr/local/nginx-ldap-auth-release-${NGINX_LDAP_VERSION}

ENV PATH /usr/local/nginx-ldap-auth-release-${NGINX_LDAP_VERSION}/.env/bin:$PATH
EXPOSE 8888

WORKDIR /usr/local/nginx-ldap-auth-release-${NGINX_LDAP_VERSION}
CMD ["python", "nginx-ldap-auth-daemon.py", "--host", "0.0.0.0", "-p", "8888"]

