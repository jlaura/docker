FROM usgsastro/debian:latest

ENV COMPOSE_VERSION "1.25.0"
SHELL ["/bin/bash", "-c"]

RUN apt-get update &&               \
    apt-get install -y              \
        apt-transport-https         \
        ca-certificates             \
        curl                        \
        gnupg2                      \
        software-properties-common

RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -

RUN add-apt-repository                                          \
   "deb [arch=amd64] https://download.docker.com/linux/debian   \
   $(lsb_release -cs)                                           \
   stable"

RUN apt-get update &&       \
    apt-get install -y      \
        docker-ce           \
        docker-ce-cli       \
        containerd.io       \
    &&                      \
    rm -rf /var/cache/apt/*

RUN curl -L                                                                                                             \
        "https://github.com/docker/compose/releases/download/$COMPOSE_VERSION/docker-compose-$(uname -s)-$(uname -m)"   \
        -o /usr/bin/docker-compose &&                                                                                   \
    chmod +x /usr/bin/docker-compose

