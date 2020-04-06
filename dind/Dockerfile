FROM docker:18-dind

ENV PIP_CERT /etc/ssl/certs/ca-certificates.crt

COPY DOIRootCA2.crt /usr/local/share/ca-certificates/
RUN update-ca-certificates

RUN apk add \
        curl \
        gcc \
        libc-dev \
        libffi-dev \
        make \
        openssl-dev \
        py-pip \
        python-dev

RUN pip install -U docker-compose

