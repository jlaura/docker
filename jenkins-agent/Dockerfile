# vim: ft=dockerfile

FROM jenkins/jnlp-slave:latest

USER root

RUN apt-get update &&                       \
    apt-get install -y ca-certificates &&   \
    rm -rf /var/lib/apt/lists/*             \
    rm -rf /var/cache/apt/*
COPY DOIRootCA2.crt /usr/local/share/ca-certificates/ 

RUN update-ca-certificates &&                                               \
    git config --system http.sslCAInfo /etc/ssl/certs/ca-certificates.crt

USER jenkins
