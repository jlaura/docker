FROM usgsastro/debian

# Gitlab recommended
ENV DOCKER_VERSION=5:19.03.13~3-0~debian-buster
ENV DOCKER_COMPOSE_VERSION=1.29.2

RUN apt-get update && \
    apt-get install -y \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg \
        lsb-release

RUN curl -fsSL https://download.docker.com/linux/debian/gpg | \
        gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg && \
    echo \
        "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] \
            https://download.docker.com/linux/debian $(lsb_release -cs) stable" | \
        tee /etc/apt/sources.list.d/docker.list > /dev/null

RUN apt-get update && \
    apt-get install docker-ce=${DOCKER_VERSION} docker-ce-cli=${DOCKER_VERSION} containerd.io -y && \
    rm -rf /var/lib/apt/lists/*

RUN curl -sL "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/bin/docker-compose && \
    chmod +x /usr/bin/docker-compose

# From https://github.com/docker-library/docker/blob/master/19.03/Dockerfile
ENV DOCKER_TLS_CERTDIR=/certs
COPY docker/docker-entrypoint.sh /usr/bin/docker-entrypoint.sh
RUN ([ ! -e /etc/nsswitch.conf ] && echo 'hosts: files dns' > /etc/nsswitch.conf) || true
RUN chmod +x /usr/bin/docker-entrypoint.sh && \
    mkdir /certs /certs/client && \
    chmod 1777 /certs /certs/client
ENTRYPOINT ["/usr/bin/docker-entrypoint.sh"]

