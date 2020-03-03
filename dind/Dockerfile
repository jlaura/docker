FROM docker:18-dind

ENV COMPOSE_VERSION "1.25.0"

COPY DOIRootCA2.crt /usr/local/share/ca-certificates/
RUN update-ca-certificates

RUN apk add curl && curl -sL                                                                                            \
        "https://github.com/docker/compose/releases/download/$COMPOSE_VERSION/docker-compose-$(uname -s)-$(uname -m)"   \
        -o /usr/bin/docker-compose &&                                                                                   \
    chmod +x /usr/bin/docker-compose

